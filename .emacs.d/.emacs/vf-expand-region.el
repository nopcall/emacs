(add-to-list 'load-path "~/.emacs.d/expand-region")
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'vf-expand-region)
