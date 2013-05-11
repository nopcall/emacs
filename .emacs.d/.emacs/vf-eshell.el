(global-set-key (kbd "<f11>") 'eshell)
(custom-set-variables
 '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output t) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
 '(comint-completion-autolist t)        ; show completion list when ambiguous
 '(comint-input-ignoredups t)           ; no duplicates in command history
 '(comint-completion-addsuffix t)       ; insert space/slash after file completion
 '(eshell-glob-case-insensitive t)
 '(eshell-aliases-file "/home/visayafan/.emacs.d/eshell/alias")
 '(eshell-scroll-show-maximum-output nil)
)
;; 空行按回车自动 ls; 展开 "..."=>"../.." ; "...."=>"../../.." 
(defun user-ret ()
  (interactive)
  (let ((input (eshell-get-old-input)))
    (if (string-equal input "")
        (progn
          (insert-string "ls")
          (eshell-send-input))
      (progn
        (cond
         ((string-match "^cd\\ \\.\\{2,\\}$" input)
          (let ((len (- (length input) 5))
                (dots (lambda (n d)(if (<= n 0) nil (concat (funcall dots (1- n) d) d)))))
            (eshell-bol)(kill-line)
            (insert-string (concat "cd .." (funcall dots len "/..")))
            (eshell-send-input)))
         ((string-match "^\\.\\{2,\\}$" input)
          (let ((len (- (length input) 2))(p ".."))
            (while (> len 0)
              (setq len (1- len))(setq p (concat p "/..")))
            (eshell-bol)(kill-line)
            (insert-string p)
            (eshell-send-input)))
         (t
          (eshell-send-input))))
      )))
;; 删除文件到回收站而非不可恢复性删除
;; 注意在win下可以直接删除到回收站但在Ubuntu下所说是删除到~/.Trash下而非~/.local/share/Trash 需要做个链接
(setq delete-by-moving-to-trash t)

;; (defvar ac-source-eshell-pcomplete
;;   '((candidates . (pcomplete-completions))))
;; (defun ac-complete-eshell-pcomplete ()
;;   (interactive)
;;   (auto-complete '(ac-source-eshell-pcomplete)))
;; ;; 自动开启 ac-mode
;; ;; 需要 (global-auto-complete-mode 1)
;; (add-to-list 'ac-modes 'eshell-mode)
;; (setq ac-sources '(ac-source-eshell-pcomplete
;;                    ;; ac-source-files-in-current-dir
;;                    ;; ac-source-filename
;;                    ;; ac-source-abbrev
;;                    ;; ac-source-words-in-buffer
;;                    ;; ac-source-imenu
;;                    ))

;; clc 清屏,在eshell中输入命令而非M-x clc
;; 由于经常错打成ccl所以把ccl也定制成清屏
(defun eshell/ccl()
  "to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
(defun eshell/clc()
  "to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))


