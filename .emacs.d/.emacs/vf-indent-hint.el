(add-to-list 'load-path "~/.emacs.d/indent-hints-mode")
;; (require 'indent-hints)
;; (indent-hints-global-mode)
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

(provide 'vf-indent-hint)
