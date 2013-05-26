;; 解决emacs client字体问题
(setq window-system-default-frame-alist
      '((x
         (font . "-unknown-文泉驿等宽微米黑-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1"))
        (nil
         (font . "-unknown-文泉驿等宽微米黑-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1")
         (menu-bar-lines . 0) (tool-bar-lines . 0))))

;; 使用daemon启动时进行的操作
;; 开启tabber mode并设置tab的颜色
(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (progn
                  (tabbar-mode t)
                (custom-set-faces
                 '(tabbar-selected-face ((t (:inherit tabbar-default-face :background "#102e4e" :foreground "green" :box (:line-width 2 :color "#102e4e" :style released-button)))))
                 '(tabbar-unselected-face ((t (:inherit tabbar-default-face :foreground "#102e4e" :box (:line-width 2 :color "white" :style pressed-button)))))))))))

;; http://emacswiki.org/emacs/TabBarMode 上抄来的代码，解决emacsclient下tabber不能使用问题

;; Allow tab-bar-mode to be frame-local.  This is deprecated and exploits
;; the fact that `default-header-line-format' is an alias of the global
;; value of `header-line-format'. Tested with Emacs 24.1.
(make-variable-frame-local 'default-header-line-format)
;; These two are needed as the aliased frame-local value isn't recognized
;; unless the variable is explicitly accessed once. Do so on those two
;; occasions where this matters. Notably, `handle-switch-frame' need not
;; be advised.
(defadvice select-frame (after adapt-select-frame-parameters activate)
  "Fix frame-local value of `default-header-line-format'."
  (interactive)
  default-header-line-format)
;; This absolutely must be after delete-frame, so
;; `delete-frame-functions' won't work.
(defadvice delete-frame (after adapt-delete-frame-parameters activate)
  "Fix frame-local value of `default-header-line-format'."
  (interactive)
  default-header-line-format)
;; Example usage: Set per-terminal (frame-local) options.
(defun customize-terminal-frame (frame)
  (cond
   ((frame-parameter frame 'window-system)
    (set-frame-parameter frame 'default-header-line-format '(:eval (tabbar-line)))
    (tabbar-init-tabsets-store))
   (t
    (set-frame-parameter frame 'default-header-line-format nil)
    (set-frame-parameter frame 'menu-bar-lines 0))))
(add-hook 'after-make-frame-functions 'customize-terminal-frame)




(defun client-save-kill-emacs(&optional display)
  " This is a function that can bu used to shutdown save buffers and
shutdown the emacs daemon. It should be called using
emacsclient -e '(client-save-kill-emacs)'.  This function will
check to see if there are any modified buffers or active clients
or frame.  If so an x window will be opened and the user will
be prompted."

  (let (new-frame modified-buffers active-clients-or-frames (last-nonmenu-event nil))

                                        ; Check if there are modified buffers or active clients or frames.
    (setq modified-buffers (modified-buffers-exist))
    (setq active-clients-or-frames ( or (> (length server-clients) 1)
                                        (> (length (frame-list)) 1)
                                        ))

                                        ; Create a new frame if prompts are needed.
    (when (or modified-buffers active-clients-or-frames)
      (when (not (eq window-system 'x))
        (message "Initializing x windows system.")
        (x-initialize-window-system))
      (when (not display) (setq display (getenv "DISPLAY")))
      (message "Opening frame on display: %s" display)
      (select-frame (make-frame-on-display display '((window-system . x)))))

                                        ; Save the current frame.
    (setq new-frame (selected-frame))


                                        ; When displaying the number of clients and frames:
                                        ; subtract 1 from the clients for this client.
                                        ; subtract 2 from the frames this frame (that we just created) and the default frame.
    (when ( or (not active-clients-or-frames)
               (yes-or-no-p (format "There are currently %d clients and %d frames. Exit anyway?" (- (length server-clients) 1) (- (length (frame-list)) 2))))

                                        ; If the user quits during the save dialog then don't exit emacs.
                                        ; Still close the terminal though.
      (let((inhibit-quit t))
                                        ; Save buffers
        (with-local-quit
          (save-some-buffers))

        (if quit-flag
            (setq quit-flag nil)
                                        ; Kill all remaining clients
          (progn
            (dolist (client server-clients)
              (server-delete-client client))
                                        ; Exit emacs
            (kill-emacs)))
        ))

                                        ; If we made a frame then kill it.
    (when (or modified-buffers active-clients-or-frames) (delete-frame new-frame))
    )
  )


(defun modified-buffers-exist()
  "This function will check to see if there are any buffers
that have been modified.  It will return true if there are
and nil otherwise. Buffers that have buffer-offer-save set to
nil are ignored."
  (let (modified-found)
    (dolist (buffer (buffer-list))
      (when (and (buffer-live-p buffer)
                 (buffer-modified-p buffer)
                 (not (buffer-base-buffer buffer))
                 (or
                  (buffer-file-name buffer)
                  (progn
                    (set-buffer buffer)
                    (and buffer-offer-save (> (buffer-size) 0))))
                 )
        (setq modified-found t)
        )
      )
    modified-found
    )
  )
