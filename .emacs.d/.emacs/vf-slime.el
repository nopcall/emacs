(add-to-list 'load-path "~/.emacs.d/slime")
(setq inferior-lisp-program "sbcl")
(require 'slime)
(slime-setup '(slime-fancy)) ;;清屏，让slime更好看

;; customzie shorcuts
(add-hook 'slime-mode-hook 'vf-slime-hook)
(defun vf-slime-hook ()
  ;; M-/ 符号补全
  (define-key slime-mode-map (kbd "M-/") 'slime-complete-symbol))

(add-hook 'slime-repl-mode-hook 'vf-slime-repl-hook)
(defun vf-slime-repl-hook ()
  ;; 交换clear-buffer和clear-output快捷键，因为C-c C-o用来clear-buffer用着顺手
  (define-key slime-repl-mode-map (kbd "M-/") 'slime-complete-symbol)
  (define-key slime-repl-mode-map (kbd "C-c C-o") 'slime-repl-clear-buffer)
  (define-key slime-repl-mode-map (kbd "C-c M-o") 'slime-repl-clear-output))

(provide 'vf-slime)
