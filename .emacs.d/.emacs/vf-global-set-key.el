;; (global-set-key (kbd "<f6>") 'other-window)

;;临时记号
;;有时你需要跳到另一个文件进行一些操作，然后很快的跳回来。你当然可以使用 bookmark 或者寄存器。但是这些实在是太慢了。你多想拥有vi那样的 ma, mb, 'a, 'b 的操作。现在你可以用几行 elisp 达到类似的目的：
(global-set-key "\C-cp" 'ska-point-to-register)
(global-set-key "\C-cn" 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))
(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

(global-set-key "\C-cca" 'v_cua_mode)
(fset 'v_cua_mode
   [?\M-x ?c ?u ?a ?  ?m ?o ?d ?e return])

;; 插入日期
(global-set-key "\C-cid" 'insert-date)
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y年%m月%e日%k:%M")))

;; 插入当前时间
(global-set-key "\C-cit" 'insert-current-time)
(defun insert-current-time () 
  "Insert the current time" 
  (interactive "*") 
  (insert (current-time-string)))

(global-set-key "\C-cipn" 'insert-path-name)
(defun insert-path-name ()
  "Insert the full path file name into the current buffer."
  (interactive)
  (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))

(global-set-key "\C-cifn" 'insert-file-name)
(defun insert-file-name ()
  "Insert the file name into the current buffer."
  (interactive)
  (insert (file-name-nondirectory (buffer-file-name (window-buffer (minibuffer-selected-window))))))

;; 全屏
(global-set-key [(control f10)] 'fs)
(defun fs()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )
;; M-left M-right M-up M-down to move between buffers and windows
(windmove-default-keybindings 'meta)
(defun frame-bck()
  (interactive)
  (other-window -1)
)
(define-key (current-global-map) (kbd "M-o") 'other-window)
(define-key (current-global-map) (kbd "M-O") 'frame-bck)

; C-x a w来取消abbrev扩展，有时候不想被扩展的缩写自动被扩展后可以用此来恢复
(global-set-key (kbd "C-x a w") 'unexpand-abbrev)

;; 下面的功能已经被 ace-jump-mode替换
;; ;;有了这段代码之后，当你按 C-c a x (x 是任意一个字符) 时，光标就会到下一个 x 处。再次按 x，光标就到下一个 x。比如 C-c a w w w w ..., C-c a b b b b b b ...
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
                     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "C-c a") 'wy-go-to-char)

(global-set-key [(super left)] 'windmove-left)
(global-set-key [(super right)] 'windmove-right)
(global-set-key [(super up)] 'windmove-up)
(global-set-key [(super down)] 'windmove-down)


(provide 'vf-global-set-key)
