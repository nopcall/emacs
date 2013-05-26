;; org7和8版本之间差别非常大，这里是版本8的配置文件
(add-to-list 'load-path "~/.emacs.d/org-8.0.3/lisp")
(load-file "~/.emacs.d/.emacs/vf-org-setting-common.el")
(load-file "~/.emacs.d/.emacs/vf-org-contacts.el")

;; 将制作org文件转换成幻灯片
;; https://github.com/yjwen/org-reveal
(add-to-list 'load-path "~/.emacs.d/org-reveal")
(require 'ox-reveal)
(setq org-reveal-root "../..//Layout/JS/reveal.js")
(setq org-reveal-hlevel 2)              ;>2的headline则纵向显示（需要用down键查看）
(setq org-reveal-control t)             ;右下角显示控制台
(setq org-reveal-center t)              ;为nil则所有slide大小相同
(setq org-reveal-progress t)            ;显示进度条
(setq org-reveal-history nil)
(setq org-reveal-mathjax t)
(setq org-reveal-theme 'moon)
(setq org-reveal-trans 'cube)

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

;; HTML生成最后阶段进行替换
;; (add-hook 'org-export-html-final-hook 'org-delete-!!!)
;; (defun org-delete-!!! ()
;;   (interactive)
;;   (goto-char (point-min))
;;   (while (re-search-forward "!!!!!" nil t)
;;     (replace-match "<"))
;;   (goto-char (point-min))
;;   (while (re-search-forward "@@@@@" nil t)
;;     (replace-match ">")))

(eval-after-load 'ox-html
  '(dolist (fun (list 'fan/org-html-produce-inline-html))
     (add-to-list 'org-export-filter-final-output-functions fun)))

(defun fan/org-html-produce-inline-html (string backend info)
  "replace !!!!! to < and @@@@@ to >"
  (when (and (org-export-derived-backend-p backend 'html)
             (string-match "!!!!!" string))
    (replace-regexp-in-string (rx  (= 5 "!")
                                   (group (+? anything))
                                   (= 5 "@"))
                              "<\\1>"
                              string)))

;; GTD
(setq org-tag-alist '(
                      ("@CC" . ?c)
                      ("@Emacs" . ?e)
                      ("@LISP" . ?l)
                      ("@ENGLISH" . ?E)
                      ))
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

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
