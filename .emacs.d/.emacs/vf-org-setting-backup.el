(setq org-publish-project-alist
      '(("java"
         :base-directory "~/visayafan.github.com/Coding/Java"
         :publishing-directory "~/visayafan.github.com/Coding/Java"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :link-home "../../index.html#java"
         :auto-index t
         :section-numbers t
         )
        ("python"
         :base-directory "~/visayafan.github.com/Coding/Python"
         :publishing-directory "~/visayafan.github.com/Coding/Python"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :link-home "../../index.html#python"
         :auto-index t
         :section-numbers t
         )
        ("cpp"
         :base-directory "~/visayafan.github.com/Coding/Cpp"
         :publishing-directory "~/visayafan.github.com/Coding/Cpp"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :link-home "../../index.html#cpp"
         :auto-index t
         :section-numbers t
         )
        ("kernel"
         :base-directory "~/visayafan.github.com/Linux/LinuxKernel"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxKernel"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :link-home "../../index.html#linuxkernel"
         :auto-index t
         :section-numbers t
         )
        ("linux"
         :base-directory "~/visayafan.github.com/Linux/LinuxOS"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxOS"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :link-home "../../index.html#linuxos"
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
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxcoding\">HOME</a><br/><a href=\"#disqus_thread\">COMMENTS</a></div>"
         )        
        ("compiler"
         :base-directory "~/visayafan.github.com/Compiler/o"
         :publishing-directory "~/visayafan.github.com/Compiler/o"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :link-home "../../index.html#compiler"
         :auto-index t
         :section-numbers t
         )
        ("all"
         :components ("cpp" "java" "python" "linux" "linuxc" "kernel" "compiler")
         )
        ))
