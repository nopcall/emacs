;; org-mode
(setenv "PATH" (concat (getenv "PATH") ":/home/visayafan/VfInstall/texlive/2011/bin/i386-linux/"))
(setq exec-path (append exec-path '("/home/visayafan/VfInstall/texlive/2011/bin/i386-linux/")))
(setq load-path (cons "~/.emacs.d/org-7.8.11/lisp" load-path))
(add-hook 'org-mode-hook 
          (lambda () (setq truncate-lines nil)))
(require 'org-install)
(require 'org-latex)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-col" 'org-store-link)
(global-set-key "\C-coc" 'org-capture)
(global-set-key "\C-coa" 'org-agenda)
(global-set-key "\C-cob" 'org-iswitchb)
(add-hook 'org-mode-hook 
          (lambda () (setq truncate-lines nil)))
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))
(setq org-log-done 'time)
(setq org-log-done 'note)


;; 使用xelatex一步生成PDF
(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode %f"
        "xelatex -interaction nonstopmode %f"))
;; code执行免应答（Eval code without confirm）
(setq org-confirm-babel-evaluate nil)
;; Auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(defun org-mode-article-modes ()
  (reftex-mode t)
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all)))
(add-hook 'org-mode-hook
          (lambda ()
            (if (member "REFTEX" org-todo-keywords-1)
                (org-mode-article-modes))))
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(add-to-list 'org-export-latex-classes
             '("cn-article"
               "\\documentclass[10pt,a4paper]{article}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{lmodern}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{listings}
\\usepackage{geometry}
\\usepackage{algorithm}
\\usepackage{algorithmic}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{natbib}
\\usepackage{fancyhdr}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,
linkcolor=blue,
urlcolor=blue,
menucolor=blue]{hyperref}
\\usepackage{fontspec,xunicode,xltxtra}
\\setmainfont[BoldFont=Adobe Heiti Std]{Adobe Song Std}  
\\setsansfont[BoldFont=Adobe Heiti Std]{AR PL UKai CN}  
\\setmonofont{Bitstream Vera Sans Mono}  
\\newcommand\\fontnamemono{AR PL UKai CN}%等宽字体
\\newfontinstance\\MONO{\\fontnamemono}
\\renewcommand\\contentsname{目录}
\\newcommand{\\mono}[1]{{\\MONO #1}}
\\setCJKmainfont[Scale=0.9]{Adobe Heiti Std}%中文字体
\\setCJKmonofont[Scale=0.9]{Adobe Heiti Std}
\\hypersetup{unicode=true}
%\\geometry{a4paper, textwidth=6.5in, textheight=10in,marginparsep=7pt, marginparwidth=.6in}
\\definecolor{foreground}{RGB}{220,220,204}%浅灰
\\definecolor{background}{RGB}{62,62,62}%浅黑
\\definecolor{preprocess}{RGB}{250,187,249}%浅紫
\\definecolor{var}{RGB}{239,224,174}%浅肉色
\\definecolor{string}{RGB}{154,150,230}%浅紫色
\\definecolor{type}{RGB}{225,225,116}%浅黄
\\definecolor{function}{RGB}{140,206,211}%浅天蓝
\\definecolor{keyword}{RGB}{239,224,174}%浅肉色
\\definecolor{comment}{RGB}{180,98,4}%深褐色
\\definecolor{doc}{RGB}{175,215,175}%浅铅绿
\\definecolor{comdil}{RGB}{111,128,111}%深灰
\\definecolor{constant}{RGB}{220,162,170}%粉红
\\definecolor{buildin}{RGB}{127,159,127}%深铅绿
\\punctstyle{kaiming}
\\title{}
\\fancyfoot[C]{\\bfseries\\thepage}
\\chead{\\MakeUppercase\\sectionmark}
\\pagestyle{fancy}
\\tolerance=1000
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-export-latex-listings t)
;; Options for \lset command（reference to listing Manual)
;; (setq org-export-latex-listings-options
;;       '(
;;         ("escapeinside" "{(*@}{@*)}")
;;         ("basicstyle" "\\color{foreground}\\small\\mono")           ; 源代码字体样式
;;         ("keywordstyle" "\\color{function}\\bfseries\\small\\mono") ; 关键词字体样式
;;         ("identifierstyle" "\\color{doc}\\small\\mono")
;;         ("commentstyle" "\\color{comment}\\small\\itshape")         ; 批注样式
;;         ("stringstyle" "\\color{string}\\small")                    ; 字符串样式
;;         ("showstringspaces" "false")                                ; 字符串空格显示
;;         ("numbers" "left")                                          ; 行号显示
;;         ("numberstyle" "\\color{preprocess}")                       ; 行号样式
;;         ("stepnumber" "1")                                          ; 行号递增
;;         ("backgroundcolor" "\\color{background}")                   ; 代码框背景色
;;         ("tabsize" "4")                                             ; TAB等效空格数
;;         ("captionpos" "t")                                          ; 标题位置 top or buttom(t|b)
;;         ("breaklines" "true")                                       ; 自动断行
;;         ("breakatwhitespace" "true")                                ; 只在空格分行
;;         ("showspaces" "false")                                      ; 显示空格
;;         ("columns" "flexible")                                      ; 列样式
;;         ("frame" "single")                                          ; 代码框：阴影盒
;;         ("frameround" "tttt")                                       ; 代码框： 圆角
;;         ("framesep" "0pt")
;;         ("framerule" "8pt")
;;         ("rulecolor" "\\color{background}")
;;         ("fillcolor" "\\color{white}")
;;         ("rulesepcolor" "\\color{comdil}")
;;         ("framexleftmargin" "10mm")
;;         ))

(setq org-export-latex-listings-options
      '(
        ("number" "left")
        ("numberstyle" "\\tiny")
        ("basicstyle" "\\scriptsize")
        ("stepnumber" "1")
        ("captionpos" "b")
        ("breaklines" "true")
        ("breakatwhitespace" "false")
        ("frame" "single")
        ("keywordstyle" "\\color{blue!70}")
        ("commentstyle" "\\color{red!50!green!50!blue!50}")))
;; Make Org use ido-completing-read for most of its completing prompts.
(setq org-completion-use-ido t)
;; 各种Babel语言支持
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (matlab . t)
   (C . t)
   (perl . t)
   (sh . t)
   (ditaa . t)
   (python . t)
   (haskell . t)
   (dot . t)
   (latex . t)
   (js . t)
   ))

;; 导出Beamer的设置
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
;;-----------------------------------------------------------------------------
(add-to-list 'org-export-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt,professionalfonts]{beamer}
\\mode
\\usetheme{{{{Warsaw}}}}
%\\usecolortheme{{{{beamercolortheme}}}}

\\beamertemplateballitem
\\setbeameroption{show notes}
\\usepackage{graphicx}
\\usepackage{tikz}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{amsmath}
\\usepackage{lmodern}
\\usepackage{fontspec,xunicode,xltxtra}
\\usepackage{polyglossia}
\\setmainfont{Times New Roman}
\\setCJKmainfont{DejaVu Sans YuanTi}
\\setCJKmonofont{DejaVu Sans YuanTi Mono}
\\usepackage{verbatim}
\\usepackage{listings}
\\institute{{{{beamerinstitute}}}}
\\subject{{{{beamersubject}}}}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

(setq ps-paper-type 'a4
      ps-font-size 16.0
      ps-print-header nil
      ps-landscape-mode nil)


;; 当所有子项目都标记为Done的时候，父项目也被标记为Done
(defun org-summary-todo (n-done n-not-done)
  "Swith entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging.
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(setq org-tag-alist '(("@STL" . ?s) ("@OJ" . ?o) ("@Python" . ?p) ("@English" . ?e)))
;;(require 'calendar)
(setq calendar-latitude +30.15)
(setq calendar-longitude +120.10)
(setq calendar-location-name "Hangzhou")
;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)
(setq mark-diary-entries-in-calendar t)
(setq mark-holidays-in-calendar nil)
(setq view-calendar-holidays-initially nil)
;;(setq mark-diary-entries-in-calendar t)
;;(setq mark-holidays-in-calendar t)
;;(setq view-calendar-holidays-initially nil)
;; my advice for exit-calendar : save and close the _diray buffer
(defadvice exit-calendar (before my-advice-close-diary ())
  "save and close the _diary buffer to avoid open it when
starting emacs next time."
  (let ((bf (find-file-noselect diary-file t)))
    (and bf
         (save-excursion
           (with-current-buffer bf (save-buffer) (kill-buffer nil))))))
(ad-activate 'exit-calendar)
;;I don't care these holidays
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
                         (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 3 14 "白色情人节")
                         (holiday-fixed 4 1 "愚人节")
                         (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-fixed 6 1 "儿童节")
                         (holiday-float 6 0 3 "父亲节")
                         (holiday-fixed 7 1 "建党节")
                         (holiday-fixed 8 1 "建军节")
                         (holiday-fixed 9 10 "教师节")
                         (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 12 25 "圣诞节")))


;;; .emacs.lisp
;; (setq org-export-html-style
;;       "<style type=\"text/css\">#<:use "~/dstudy/noteAll/java/org-mode-snapshot.css"></style>")

(setq org-export-html-validation-link nil)


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
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#java\">主页</a><br/><a href=\"#disqus_thread\">评论</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("python"
         :base-directory "~/visayafan.github.com/Coding/Python"
         :publishing-directory "~/visayafan.github.com/Coding/Python"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#python\">主页</a><br/><a href=\"#disqus_thread\">评论</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("cpp"
         :base-directory "~/visayafan.github.com/Coding/Cpp"
         :publishing-directory "~/visayafan.github.com/Coding/Cpp"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#cpp\">主页</a><br/><a href=\"#disqus_thread\">评论</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("kernel"
         :base-directory "~/visayafan.github.com/Linux/LinuxKernel"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxKernel"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxkernel\">主页</a><br/><a href=\"#disqus_thread\">评论</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("linux"
         :base-directory "~/visayafan.github.com/Linux/LinuxOS"
         :publishing-directory "~/visayafan.github.com/Linux/LinuxOS"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxos\">主页</a><br/><a href=\"#disqus_thread\">评论</a></div>"
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
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#linuxcoding\">主页</a><br/><a href=\"#disqus_thread\">评论</a></div>"
         )        
        ("compiler"
         :base-directory "~/visayafan.github.com/Compiler/o"
         :publishing-directory "~/visayafan.github.com/Compiler/o"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :style "<div id=\"org-div-comments\"><a href=\"../../index.html#compiler\">主页</a><br/><a href=\"#disqus_thread\">评论</a></div>"
         :auto-index t
         :section-numbers t
         )
        ("all"
         :components ("cpp" "java" "python" "linux" "linuxc" "kernel" "compiler")
         )
        ))
(global-set-key (kbd "<f8> p") 'org-publish)

;; org-mode使用auto-complete
;; (setq ac-modes
;;         (append ac-modes '(org-mode objc-mode jde-mode sql-mode
;;                                     change-log-mode text-mode
;;                                     makefile-gmake-mode makefile-bsdmake-mo
;;                                     autoconf-mode makefile-automake-mode)))

(provide 'vf-org-setting)

