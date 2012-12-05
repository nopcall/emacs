(add-to-list 'load-path "~/.emacs.d/doxymacs-1.8.0/lisp")
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'python-mode-hook 'doxymacs-mode)

(provide 'vf-doxymacs)