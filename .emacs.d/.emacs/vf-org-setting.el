(setq load-path (cons "~/.emacs.d/org-7.8.11/lisp" load-path))
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(require 'org-install)
(require 'org-latex)
;; org里的latex配置 
;; (require 'vf-org-latex)
;; org里gtd配置 
(require 'vf-org-gtd)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-col" 'org-store-link)
(global-set-key "\C-coc" 'org-capture)
(global-set-key "\C-coa" 'org-agenda)
(global-set-key "\C-cob" 'org-iswitchb)

;; org-publish 配置
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; setq truncate-lines nil的两行代码是为了解决org-mode在编辑中文的时候不会自动折行的问题
(add-hook 'org-mode-hook 
          (lambda () (setq truncate-lines nil)))


(setq org-publish-project-alist
      '(("java"
         :base-directory "~/visayafan.github.com/Coding/Java"
         :publishing-directory "~/visayafan.github.com/Coding/Java"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#java\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("python"
         :base-directory "~/visayafan.github.com/Coding/Python"
         :publishing-directory "~/visayafan.github.com/Coding/Python"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#python\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("cpp"
         :base-directory "~/visayafan.github.com/Coding/Cpp"
         :publishing-directory "~/visayafan.github.com/Coding/Cpp"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#cpp\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("lisp"
         :base-directory "~/visayafan.github.com/Coding/Lisp"
         :publishing-directory "~/visayafan.github.com/Coding/Lisp"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#lisp\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("kernel"
         :base-directory "~/visayafan.github.com/Linux/LinuxKernel"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxKernel"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxkernel\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("linux"
         :base-directory "~/visayafan.github.com/Linux/LinuxOS"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxOS"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxos\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("linuxc"
         :base-directory "~/visayafan.github.com/Linux/LinuxCoding"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxCoding"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index t
         :section-numbers t
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxcoding\">主页</a></div>"
         )        
        ("compiler"
         :base-directory "~/visayafan.github.com/Compiler/o"
         :publishing-directory "~/visayafan.github.com/Compiler/o"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#compiler\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("all"
         :components ("cpp" "java" "python" "lisp" "linux" "linuxc" "kernel" "compiler")
         )
        ))
(global-set-key (kbd "<f8> p") 'org-publish)

(provide 'vf-org-setting)

