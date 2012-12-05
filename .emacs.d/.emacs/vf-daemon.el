;; 解决emacs client字体问题
(setq window-system-default-frame-alist
      '((x
         (font . "-unknown-文泉驿等宽微米黑-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1"))
        (nil
         (font . "-unknown-文泉驿等宽微米黑-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1")
         (menu-bar-lines . 0) (tool-bar-lines . 0))))

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

(provide 'vf-daemon)
