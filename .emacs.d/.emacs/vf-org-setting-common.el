;; org7.x��8.x�汾���е�����
(require 'org-install)
;; (require 'org-latex)
;; (require 'vf-org-latex)      ;;;; org���latex���� 
(load-file "~/.emacs.d/.emacs/vf-org-gtd.el") ;;; org��gtd���� 
;; (require 'org-publish)                        ;;; org-publish ���� 
(add-hook 'org-mode-hook
          '(lambda ()
             (turn-on-font-lock)
             (setq truncate-lines nil)  ;���org-mode�ڱ༭���ĵ�ʱ�򲻻��Զ����е�����
             (define-key org-mode-map "\C-col" 'org-store-link)
             (define-key org-mode-map "\C-coc" 'org-capture)
             (define-key org-mode-map "\C-coa" 'org-agenda)
             (define-key org-mode-map "\C-cob" 'org-iswitchb)            ;switch only between files with org suffix
             (define-key org-mode-map "\C-cot" 'org-toggle-link-display) ;toogle link display, literal or descriptive
             (setq org-export-default-language "zh-CN")
             (setq org-export-language-setup (quote (("zh-cn" "����" "����" "Ŀ¼" "��ע") ("en" "Author" "Date" "Table of Contents" "Footnotes"))))
             ))
;; org-babel
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages '(
                             (sh . t)
                             (emacs-lisp . t)))
(setq org-confirm-babel-evaluate nil)
