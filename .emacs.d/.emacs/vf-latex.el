;;;;http://www.gnu.org/software/auctex/download-for-unix.html
;;;; .configure make sudo make install
(add-to-list 'load-path "~/.emacs.d/auctex-11.86")
(add-to-list 'load-path "~/.emacs.d/auctex-11.86/preview")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
;; (add-hook 'LaTeX-mode-hook
;;           (lambda()
;;             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;;             (setq TeX-command-default "XeLaTeX")))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq preview-scale-function 1.3)
(setq LaTeX-math-menu-unicode t)
(setq TeX-insert-braces nil)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;;Auctex for Latex
(add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(add-hook 'LaTeX-mode-hook (lambda()
                             ;;调用latex命令
                             (add-to-list 'TeX-command-list (list "LaTeX" "latex %s.tex" 'TeX-run-command nil t))
                             ;;调用dvipdfmx命令
                             (add-to-list 'TeX-command-list (list "dvi2pdf" "dvipdfmx %s.dvi" 'TeX-run-command nil t))
                             ;;调用pdflatex命令;;调用pdflatex命令;;调用pdflatex命令
                             (add-to-list 'TeX-command-list (list "pdf Latex" "pdflatex %s.tex" 'TeX-run-command nil t))
                                        ; View PDF
                             (add-to-list 'TeX-command-list (list "View pdf" "start .\\\"%s.pdf\""'TeX-run-command nil t))
                             ;;设置环境为xelatex
                             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                             ;;(setq TeX-command-default "XeLaTeX")
                             ;;(setq TeX-save-query nil )
                             ;;(setq TeX-show-compilation t)
                             ))
;; latex-math-mode
;; latex-math-mode (add math symbols to menu and shortcuts)
;; So that you can use, e.g., `a, to input \alpha. You may also define
;; your own customized shortcuts by setting the variable
;; LaTeX-math-list before loading LaTeX-math-mode.
;; to enable maths support
(setq LaTeX-math-mode t)
(setq TeX-electric-escape t) ;; you may like it or dislike it. I found it useful when inputting repeated commands -- you just need to type \ and ENTER to repeat the last latex command.
(add-hook 'LaTeX-mode-hook 'latex-math-mode)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'latex-math-mode)   ; with Emacs latex mode
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; reftex-mode
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

(defun latex-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
                               (?$  _ "$")
                               ))
  (setq skeleton-pair t)
  (local-set-key (kbd "$") 'skeleton-pair-insert-maybe)
  )
(add-hook 'LaTeX-mode-hook 'latex-auto-pair)
(add-hook 'latex-mode-hook 'latex-auto-pair)

