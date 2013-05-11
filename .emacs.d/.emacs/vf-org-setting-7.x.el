(add-to-list 'load-path "~/.emacs.d/org-7.8.11/lisp")
(load-file "~/.emacs.d/.emacs/vf-org-setting-common.el")
(add-hook 'org-mode-hook 
          '(lambda ()
             (setq org-export-html-divs (quote ("preamble" "content" "postamble")))
             (setq org-export-html-home/up-format "<div id=\"org-div-home-and-up\"> <a accesskey=\"H\" href=\"%s\"> HOME </a> </div>")
             (setq org-export-html-postamble nil)
             (setq org-export-html-preamble nil)
             (setq org-export-html-style-include-default nil)
             (setq org-export-html-style-include-scripts nil)
             (define-key org-mode-map [f5] 'org-export-as-html-and-open)
             (define-key org-mode-map [f7] 'org-export-as-html)
             (define-key org-mode-map [f8] 'org-publish)
             ))

;; HTML生成最后阶段进行替换
(add-hook 'org-export-html-final-hook 'org-delete-!!!)
(defun org-delete-!!! ()
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "!!!!!" nil t)
    (replace-match "<"))
  (goto-char (point-min))
  (while (re-search-forward "@@@@@" nil t)
    (replace-match ">")))

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
        ("english"
         :base-directory "~/visayafan.github.com/English/NewWords"
         :publishing-directory "~/visayafan.github.com/English/NewWords"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#english\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("deutsh"
         :base-directory "~/visayafan.github.com/Deutsch/NeuWort"
         :publishing-directory "~/visayafan.github.com/Deutsch/NeuWort"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#english\">主页</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("all"
         :components ("cpp" "java" "python" "lisp" "linux" "linuxc" "kernel" "compiler")
         )))


