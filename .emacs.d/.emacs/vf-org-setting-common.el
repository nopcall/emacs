;; org7.x和8.x版本共有的配置
(require 'org-install)
(require 'org-latex)
;; org里的latex配置 
;; (require 'vf-org-latex)
;; org里gtd配置 
(load-file "~/.emacs.d/.emacs/vf-org-gtd.el")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; org-publish 配置
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(add-hook 'org-mode-hook
          '(lambda ()
             (turn-on-font-lock)
             (setq truncate-lines nil)  ;解决org-mode在编辑中文的时候不会自动折行的问题
             (setq org-export-default-language "zh-CN")
             (setq org-export-language-setup (append org-export-language-setup '(("zh-CN" "作者" "日期" "目录" "脚注"))))
             (setq org-emphasis-regexp-components (quote (" 	('\"{。，？！" "- 	.,:!?;'\")}\\。，？！" " ,\"'" "." 1)))
             (define-key org-mode-map "\C-col" 'org-store-link)
             (define-key org-mode-map "\C-coc" 'org-capture)
             (define-key org-mode-map "\C-coa" 'org-agenda)
             (define-key org-mode-map "\C-cob" 'org-iswitchb)            ;switch only between files with org suffix
             (define-key org-mode-map "\C-cot" 'org-toggle-link-display) ;toogle link display, literal or descriptive
             ))

;; org-babel
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages '(
                             (sh . t)
                             (emacs-lisp . t)))
(setq org-confirm-babel-evaluate nil)
