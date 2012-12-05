(add-to-list 'load-path "~/.emacs.d/slime")
(setq inferior-lisp-program "sbcl")
(require 'slime)
(slime-setup '(slime-fancy)) ;;��������slime���ÿ�

;; customzie shorcuts
(add-hook 'slime-mode-hook 'vf-slime-hook)
(defun vf-slime-hook ()
  ;; M-/ ���Ų�ȫ
  (define-key slime-mode-map (kbd "M-/") 'slime-complete-symbol))

(add-hook 'slime-repl-mode-hook 'vf-slime-repl-hook)
(defun vf-slime-repl-hook ()
  ;; ����clear-buffer��clear-output��ݼ�����ΪC-c C-o����clear-buffer����˳��
  (define-key slime-repl-mode-map (kbd "C-c C-o") 'slime-repl-clear-buffer)
  (define-key slime-repl-mode-map (kbd "C-c M-o") 'slime-repl-clear-output))

(provide 'vf-slime)
