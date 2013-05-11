;; org7.x��8.x�汾���е�����
(require 'org-install)
(require 'org-latex)
;; org���latex���� 
;; (require 'vf-org-latex)
;; org��gtd���� 
(load-file "~/.emacs.d/.emacs/vf-org-gtd.el")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; org-publish ����
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(add-hook 'org-mode-hook
          '(lambda ()
             (turn-on-font-lock)
             (setq truncate-lines nil)  ;���org-mode�ڱ༭���ĵ�ʱ�򲻻��Զ����е�����
             (setq org-export-default-language "zh-CN")
             (setq org-export-language-setup (append org-export-language-setup '(("zh-CN" "����" "����" "Ŀ¼" "��ע"))))
             (setq org-emphasis-regexp-components (quote (" 	('\"{��������" "- 	.,:!?;'\")}\\��������" " ,\"'" "." 1)))
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
