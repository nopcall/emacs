;; org7和8版本之间差别非常大，这里是版本8的配置文件
(setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
(load-file "~/.emacs.d/.emacs/vf-org-setting-common.el")
(add-hook 'org-mode-hook 
          '(lambda ()
             (setq org-html-postamble nil)           ;在7.x版本中使用的是org-export-html-postamble
             (setq org-html-preamble t)              
             (setq org-html-style-include-default nil)
             (setq org-html-style-include-scripts nil)
             (setq org-html-home/up-format "<div id=\"org-div-home-and-up\"> <a accesskey=\"H\" href=\"%s\"> HOME </a> </div>")
             (setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
             (setq org-hide-emphasis-markers nil)
             (setq org-export-dispatch-use-expert-ui t) ;C-c C-e后不显示提示bufffer
             (define-key org-mode-map [f5] 'org-html-export-to-html-and-open)
             (define-key org-mode-map [f7] 'org-html-export-to-html)
             (define-key org-mode-map [f8] 'org-publish)
             ))
;;"org8中去掉了导出HTML并打开的函数，不过可以利用 org-open-file实现一个"
(defun org-html-export-to-html-and-open ()
  (interactive)
  (org-open-file (org-html-export-to-html)))

(setq org-publish-project-alist
      '(("java"
         :base-directory "~/visayafan.github.com/Coding/Java"
         :publishing-directory "~/visayafan.github.com/Coding/Java"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#java\">主页</a></div>"
         :recursive t
         )
        ("python"
         :base-directory "~/visayafan.github.com/Coding/Python"
         :publishing-directory "~/visayafan.github.com/Coding/Python"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#python\">主页</a></div>"
         :recursive t
         )
        ("cpp"
         :base-directory "~/visayafan.github.com/Coding/Cpp"
         :publishing-directory "~/visayafan.github.com/Coding/Cpp"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#cpp\">主页</a></div>"
         :recursive t
         )
        ("lisp"
         :base-directory "~/visayafan.github.com/Coding/Lisp"
         :publishing-directory "~/visayafan.github.com/Coding/Lisp"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#lisp\">主页</a></div>"
         :recursive t
         )
        ("kernel"
         :base-directory "~/visayafan.github.com/Linux/LinuxKernel"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxKernel"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxkernel\">主页</a></div>"
         :recursive t
         )
        ("linux"
         :base-directory "~/visayafan.github.com/Linux/LinuxOS"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxOS"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxos\">主页</a></div>"
         :recursive t
         )
        ("linuxc"
         :base-directory "~/visayafan.github.com/Linux/LinuxCoding"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxCoding"
         :recursive t
         :publishing-function org-html-publish-to-html
         :base-extension "org"
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxcoding\">主页</a></div>"
         )        
        ("compiler"
         :base-directory "~/visayafan.github.com/Compiler/o"
         :publishing-directory "~/visayafan.github.com/Compiler/o"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#compiler\">主页</a></div>"
         :recursive t
         )
        ("english"
         :base-directory "~/visayafan.github.com/English/NewWords"
         :publishing-directory "~/visayafan.github.com/English/NewWords"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#english\">主页</a></div>"
         :recursive t
         )
        ("deutsh"
         :base-directory "~/visayafan.github.com/Deutsch/NeuWort"
         :publishing-directory "~/visayafan.github.com/Deutsch/NeuWort"
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :html-preamble "<div id=\"org-div-comments\"><a href=\"../../index.html#english\">主页</a></div>"
         :recursive t
         )
        ("all"
         :components ("cpp" "java" "python" "lisp" "linux" "linuxc" "kernel" "compiler")
         )
        ))




