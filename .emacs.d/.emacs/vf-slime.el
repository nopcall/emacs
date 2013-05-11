(add-to-list 'load-path "~/.emacs.d/slime")
(setq inferior-lisp-program "sbcl")
(require 'slime)
(slime-setup '(slime-fancy)) ;;清屏，让slime更好看

;; customzie shorcuts
(add-hook 'slime-mode-hook 'vf-slime-hook)
(defun vf-slime-hook ()
  ;; M-/ 符号补全
  (define-key slime-mode-map (kbd "M-/") 'slime-complete-symbol)
  ;; C-M-S-x eval-defun
  (define-key slime-mode-map (kbd "C-S-M-/") 'slime-eval-defun)
  ;; C-c C-o clear-slime-repl-buffer
  (define-key slime-mode-map (kbd "C-c C-o") 'clear-slime-repl-buffer))

(add-hook 'slime-repl-mode-hook 'vf-slime-repl-hook)
(defun vf-slime-repl-hook ()
  ;; 交换clear-buffer和clear-output快捷键，因为C-c C-o用来clear-buffer用着顺手
  (define-key slime-repl-mode-map (kbd "M-/") 'slime-complete-symbol)
  (define-key slime-repl-mode-map (kbd "C-c C-o") 'slime-repl-clear-buffer)
  (define-key slime-repl-mode-map (kbd "C-c M-o") 'slime-repl-clear-output))

(defun clear-slime-repl-buffer ()
  "if *slime-repl sbcl* is alive then clear it, otherwise display it in another window and clear it.
this may be useful when you want to eval a function in a slime buffer with C-M-x and want to a clear error output"
  (interactive)
  (setq slime-sbcl-buffer-name "*slime-repl sbcl*")
  (setq slime-sbcl-window-name (get-buffer-window slime-sbcl-buffer-name))
  (if (window-live-p slime-sbcl-window-name)
      (with-selected-window slime-sbcl-window-name
        (slime-repl-clear-buffer))
    (progn
      (setq current-window-name (selected-window))
      (switch-to-buffer-other-window slime-sbcl-buffer-name)
      (slime-repl-clear-buffer)
      (select-window current-window-name))))


