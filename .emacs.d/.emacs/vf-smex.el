(add-to-list 'load-path "~/.emacs.d/smex")
(require 'ido)
(setq org-completion-use-ido t)
(require 'smex)
;; (smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
