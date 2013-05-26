;; (require 'vf-mew)

(setq warning-minimum-level :error)
                                        ;(setq temp-buffer-show-function (function ignore)) 
(setq byte-compile-warnings nil)


(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; (load-file "~/.emacs.d/.emacs/vf-cedet-bzr.el")

(setq erc-timestamp-format "[%H:%M]")
(custom-set-faces '(erc-timestamp-face '((t :weight bold :foreground "SkyBlue4"))))
