(add-to-list 'load-path "~/.emacs.d/ace-jump-mode")
(require 'ace-jump-mode)
;; C-c SPC           ==> ace-jump-word-mode
;; C-u C-c SPC       ==> ace-jump-char-mode
;; C-u C-u C-c SPC   ==> ace-jump-line-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; alt+space
(define-key global-map [?\M- ] 'ace-jump-mode)
(provide 'vf-ace-jump-mode)
