(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/.emacs")
(add-to-list 'load-path "~/.emacs.d/others")

;; Emacs Conguration From EmacsWiki
;; Path: ~/.emacs.d
(require 'unicad)                       ;自动判断文档编码Universal Charset Auto Detector
(require 'winner)                       ;C-c left/right undo/redo窗口布局
(winner-mode t)
;; (require 'windresize)                   ;调整窗口大小
;; My Emacs Configuration
;; Path: ~/.emacs.d/.emacs
(require 'vf-basic)
(require 'vf-autocomplete)
(require 'vf-cedet)
;; (require 'vf-color-theme)
(require 'vf-cpp)
;; (require 'vf-doxymacs)
;; (require 'vf-ecb)
(require 'vf-global-set-key)
;; (require 'vf-latex)
;; (require 'vf-matlab)
(require 'vf-not-sure)
(require 'vf-org-setting)
;; (require 'vf-perl)
(require 'vf-webjump)
(setq org-default-notes-file (expand-file-name "~/notes.org"))
(require 'vf-org-remember)
;; (require 'vf-java)
(require 'vf-python)
(require 'vf-zencoding)
;; (require 'vf-html-helper-mode)
(require 'vf-yasnippet)
;; (require 'vf-folding)
;; 没有sublime的缩进线细
;; (require 'vf-indent-hint)
;; 微博
(require 'vf-weibo)
;; twitter 不过不能用
;; (require 'vf-twitter)
;; 迷你地图
;; (require 'vf-minimap)
;; 多个光标同时操作
(require 'vf-multiple-cursors)
;; 扩展自带的SGML mode
(require 'vf-html-mode)
;; 按下一个键后可能跳转的地主用红色的不同字母标识，只要再按下此标识字符即可跳转到那个地方
(require 'vf-ace-jump-mode)             
;; C-=根据位置选中可能要选中的，例如引号之间，括号之间
(require 'vf-expand-region)
;; undo-tree 不怎么常用
;; (require 'vf-undo-tree)
(require 'vf-ido)
;; M-x更加智能化
(require 'vf-smex)

;; (require 'exec-path-from-shell)
;; (exec-path-from-shell-initialize)

;; 调用外部命令打开emacs不能打开的文件
;; (require 'vf-openwith)
;; 加密
(require 'vf-jiami)
;; eshell
(require 'vf-eshell)
;; 包管理
;; (require 'vf-package)
;; w3m
;; (require 'vf-w3m)
;; mail
;; (require 'vf-mail)
;; 可以在选定区域外包上指定字符串
(require 'vf-wrap-region)
;; clang
;; (require 'vf-auto-complete-clang)
;; daemon client
(require 'vf-daemon)
;; slime
(require 'vf-slime)
;; gnus
(require 'vf-gnus)
;; newsticker
;; (require 'vf-newsticker)
;; iedit
;; (require 'vf-iedit)
;; graphviz
;; (require 'graphviz-dot-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(auth-source-save-behavior nil)
 '(blink-cursor-mode nil)
 '(c-cleanup-list (quote set-from-style))
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(c-hanging-braces-alist (quote set-from-style))
 '(canlock-password "3bfa2919f2aba5693f4a475d605d39949dfb2269")
 '(column-number-mode t)
 '(comint-completion-addsuffix t)
 '(comint-completion-autolist t)
 '(comint-input-ignoredups t)
 '(comint-move-point-for-output t)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(custom-enabled-themes (quote (vf)))
 '(custom-safe-themes (quote ("8fa5156415ee36c4eb1e1492d5ec43ef105e94bf3d416abeefe3723fc35f356a" "2739ab45a856cab6ca78df53463390498961342d2836ec50cab433a50dba2e20" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(custom-theme-directory "~/.emacs.d/vfthemes")
 '(default-input-method "chinese-wubi")
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(eshell-aliases-file "/home/visayafan/.emacs.d/eshell/alias")
 '(eshell-glob-case-insensitive nil)
 '(eshell-hist-rebind-keys-alist (quote (([(control 112)] . eshell-previous-input) ([(control 110)] . eshell-next-input) ([(control up)] . eshell-previous-input) ([(control down)] . eshell-next-input) ([(control 114)] . eshell-isearch-backward) ([(control 115)] . eshell-isearch-forward) ([(meta 114)] . eshell-previous-matching-input) ([(meta 112)] . eshell-previous-matching-input-from-input) ([(meta 110)] . eshell-next-matching-input-from-input) ([up] . eshell-previous-matching-input-from-input) ([down] . eshell-next-matching-input-from-input))))
 '(eshell-scroll-show-maximum-output nil)
 '(fci-rule-color "#383838")
 '(font-use-system-font t)
 '(gnus-startup-file "~/.emacs.d/gnus/.newsrc")
 '(jde-enable-abbrev-mode t)
 '(jde-jdk (quote ("1.6")))
 '(jde-jdk-doc-url "file:///media/Source_Study/study/java/jdk-7-fcs-bin-b147-apidocs-27_jun_2011/docs/index.html")
 '(jde-jdk-registry (quote (("1.6" . "/usr/lib/jvm/java-1.6.0-openjdk"))))
 '(matlab-shell-command "/usr/local/MATLAB/R2010b/bin/matlab")
 '(menu-bar-mode t)
 '(minimap-hide-scroll-bar nil)
 '(minimap-update-delay 0.5)
 '(minimap-width-fraction 0.2)
 '(org-blank-before-new-entry (quote ((heading) (plain-list-item))))
 '(org-emphasis-regexp-components (quote (" 	('\"{。，？！" "- 	.,:!?;'\")}\\。，？！" " 	
,\"'" "." 1)))
 '(org-export-default-language "zh-CN")
 '(org-export-html-divs (quote ("preamble" "content" "postamble")))
 '(org-export-html-home/up-format "<div id=\"org-div-home-and-up\">
 <a accesskey=\"H\" href=\"%s\"> HOME </a>
</div>")
 '(org-export-html-postamble nil)
 '(org-export-html-preamble nil)
 '(org-export-html-style-include-default nil)
 '(org-export-html-style-include-scripts nil)
 '(org-export-language-setup (quote (("en" "Author" "Date" "TOC" "Footnotes") ("ca" "Autor" "Data" "&Iacute;ndex" "Peus de p&agrave;gina") ("cs" "Autor" "Datum" "Obsah" "Pozn\341mky pod carou") ("da" "Ophavsmand" "Dato" "Indhold" "Fodnoter") ("de" "Autor" "Datum" "Inhaltsverzeichnis" "Fu&szlig;noten") ("eo" "A&#365;toro" "Dato" "Enhavo" "Piednotoj") ("es" "Autor" "Fecha" "&Iacute;ndice" "Pies de p&aacute;gina") ("fi" "Tekij&auml;" "P&auml;iv&auml;m&auml;&auml;r&auml;" "Sis&auml;llysluettelo" "Alaviitteet") ("fr" "Auteur" "Date" "Table des mati&egrave;res" "Notes de bas de page") ("hu" "Szerz&otilde;" "D&aacute;tum" "Tartalomjegyz&eacute;k" "L&aacute;bjegyzet") ("is" "H&ouml;fundur" "Dagsetning" "Efnisyfirlit" "Aftanm&aacute;lsgreinar") ("it" "Autore" "Data" "Indice" "Note a pi&egrave; di pagina") ("nl" "Auteur" "Datum" "Inhoudsopgave" "Voetnoten") ("no" "Forfatter" "Dato" "Innhold" "Fotnoter") ("nb" "Forfatter" "Dato" "Innhold" "Fotnoter") ("nn" "Forfattar" "Dato" "Innhald" "Fotnotar") ("pl" "Autor" "Data" "Spis tre&#x015b;ci" "Przypis") ("sv" "F&ouml;rfattare" "Datum" "Inneh&aring;ll" "Fotnoter") ("zh-CN" "作者" "日期" "目录" "脚注"))))
 '(org-format-latex-header "\\documentclass{article}
\\usepackage[usenames]{color}
\\usepackage{amsmath}
\\usepackage[mathscr]{eucal}
\\pagestyle{empty}             % do not remove
[PACKAGES]
[DEFAULT-PACKAGES]
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}
\\usepackage{fontspec,xunicode,xltxtra}
\\usepackage{listings}
\\usepackage{xcolor}
\\usepackage{color}
\\usepackage{float}
\\usepackage{blkarray}
\\usepackage{multicol}
\\usepackage{tcolorbox}
\\tcbuselibrary{listings}
%\\setmainfont[BoldFont=Adobe Heiti Std]{FangSong_GB2312}
%\\setsansfont[BoldFont=Adobe Heiti Std]{KaiTi_GB2312}
\\setmainfont[BoldFont=Adobe Heiti Std]{Adobe Song Std}
\\setsansfont[BoldFont=Adobe Heiti Std]{AR PL UKai CN}
\\setmonofont{Bitstream Vera Sans Mono}
\\XeTeXlinebreaklocale \"zh\"  %
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
\\newcommand\\li{\\fontspec{LiSu}}
\\newcommand\\hei{\\fontspec{SimHei}}
\\newcommand\\you{\\fontspec{YouYuan}}
%\\newcommand\\sun{\\fontspec{SimSun}}
\\newcommand\\fangsong{\\fontspec{仿宋_GB2312}}
\\newcommand\\kai{\\fontspec{KaiTi_GB2312}}
\\usepackage{titlesec}
\\titleformat{\\chapter}{\\centering\\huge}{第\\thechapter{}章}{1em}{\\textbf}
\\titleformat{\\part}{\\centering\\huge}{第\\thepart{}部分}{1em}{\\textbf}
\\renewcommand{\\contentsname}{目~录}
\\renewcommand{\\listfigurename}{插图目录}
\\renewcommand{\\listtablename}{表格目录}
\\renewcommand{\\indexname}{索引}
\\renewcommand{\\tablename}{表}
\\renewcommand{\\figurename}{图}

\\lstset{
basicstyle=\\scriptsize,
numbers=left,
keywordstyle=\\color{blue},
numberstyle={\\tiny\\color{lightgray}},
stepnumber=1, %行号会逐行往上递增
numbersep=5pt,
commentstyle=\\small\\color{red},
%backgroundcolor=\\color[rgb]{0.95,1.0,1.0},
showspaces=false,
showtabs=false,
frame=shadowbox, framexleftmargin=5mm, rulesepcolor=\\color{red!20!green!20!blue!20!},
% frame=single,
% TABframe=single,
tabsize=4,
breaklines=tr,
extendedchars=false %这一条命令可以解决代码跨页时，章节标题，页眉等汉字不显示的问题
}")
 '(org-hide-emphasis-markers nil)
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-special-blocks org-vm org-wl org-w3m)))
 '(preview-gs-options (quote ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
 '(scroll-bar-mode (quote left))
 '(show-paren-mode t)
 '(w3m-add-tab-number t)
 '(w3m-bookmark-file-coding-system (quote gb18030))
 '(w3m-command-arguments (quote ("-cookie" "-F" "-o" "http_proxy=http://127.0.0.1:8087/")))
 '(w3m-default-save-directory "~/Downloads")
 '(w3m-home-page "about:")
 '(w3m-init-file "~/.emacs.d/w3m/.emacs-w3m")
 '(w3m-search-default-engine "baidu")
 '(w3m-search-engine-alist (quote (("yahoo" "http://search.yahoo.com/bin/search?p=%s" nil) ("yahoo-ja" "http://search.yahoo.co.jp/bin/search?p=%s" euc-japan) ("alc" "http://eow.alc.co.jp/%s/UTF-8/" utf-8) ("blog" "http://blogsearch.google.com/blogsearch?q=%s&oe=utf-8&ie=utf-8" utf-8) ("blog-en" "http://blogsearch.google.com/blogsearch?q=%s&hl=en&oe=utf-8&ie=utf-8" utf-8) ("google" "http://www.google.com/search?q=%s&ie=utf-8&oe=utf-8" utf-8) ("google-en" "http://www.google.com/search?q=%s&hl=en&ie=utf-8&oe=utf-8" utf-8) ("google news" "http://news.google.com/news?q=%s&ie=utf-8&oe=utf-8" utf-8) ("google news-en" "http://news.google.com/news?q=%s&hl=en&ie=utf-8&oe=utf-8" nil) ("google groups" "http://groups.google.com/groups?q=%s" nil) ("All the Web" "http://www.alltheweb.com/search?q=%s&web&_sb_lang=en" nil) ("All the Web-ja" "http://www.alltheweb.com/search?q=%s&web&_sb_lang=ja&cs=euc-jp" euc-japan) ("technorati" "http://www.technorati.com/search/%s" utf-8) ("technorati-ja" "http://www.technorati.jp/search/search.html?query=%s&language=ja" utf-8) ("technorati-tag" "http://www.technorati.com/tag/%s" utf-8) ("goo-ja" "http://search.goo.ne.jp/web.jsp?MT=%s" euc-japan) ("excite-ja" "http://www.excite.co.jp/search.gw?target=combined&look=excite_jp&lang=jp&tsug=-1&csug=-1&search=%s" shift_jis) ("altavista" "http://altavista.com/sites/search/web?q=\"%s\"&kl=ja&search=Search" nil) ("rpmfind" "http://rpmfind.net/linux/rpm2html/search.php?query=%s" nil) ("debian-pkg" "http://packages.debian.org/cgi-bin/search_contents.pl?directories=yes&arch=i386&version=unstable&case=insensitive&word=%s" nil) ("debian-bts" "http://bugs.debian.org/cgi-bin/pkgreport.cgi?archive=yes&pkg=%s" nil) ("freebsd-users-jp" "http://home.jp.FreeBSD.org/cgi-bin/namazu.cgi?key=\"%s\"&whence=0&max=50&format=long&sort=score&dbname=FreeBSD-users-jp" euc-japan) ("iij-archie" "http://www.iij.ad.jp/cgi-bin/archieplexform?query=%s&type=Case+Insensitive+Substring+Match&order=host&server=archie1.iij.ad.jp&hits=95&nice=Nice" nil) ("waei" "http://dictionary.goo.ne.jp/search.php?MT=%s&kind=je" euc-japan) ("eiwa" "http://dictionary.goo.ne.jp/search.php?MT=%s&kind=ej" nil) ("kokugo" "http://dictionary.goo.ne.jp/search.php?MT=%s&kind=jn" euc-japan) ("eiei" "http://www.dictionary.com/cgi-bin/dict.pl?term=%s&r=67" nil) ("amazon" "http://www.amazon.com/exec/obidos/search-handle-form/250-7496892-7797857" iso-8859-1 "url=index=blended&field-keywords=%s") ("amazon-ja" "http://www.amazon.co.jp/gp/search?__mk_ja_JP=%%83J%%83%%5E%%83J%%83i&url=search-alias%%3Daps&field-keywords=%s" shift_jis) ("emacswiki" "http://www.emacswiki.org/cgi-bin/wiki?search=%s" nil) ("en.wikipedia" "http://en.wikipedia.org/wiki/Special:Search?search=%s" nil) ("de.wikipedia" "http://de.wikipedia.org/wiki/Spezial:Search?search=%s" utf-8) ("ja.wikipedia" "http://ja.wikipedia.org/wiki/Special:Search?search=%s" utf-8) ("msdn" "http://search.msdn.microsoft.com/search/default.aspx?query=%s" nil) ("freshmeat" "http://freshmeat.net/search/?q=%s&section=projects" nil) ("baidu" "http://www.baidu.com/s?wd=%s" undecided))))
 '(wubi-phrases-file "~/.emacs.d/wubi/wubi-phrases.txt")
 '(wubi-phrases-file-el "~/.emacs.d/wubi/.wubi-phrases.el")
 '(yas-prompt-functions (quote (yas/dropdown-prompt yas/completing-prompt yas/ido-prompt yas/x-prompt yas-dropdown-prompt yas/no-prompt)))
 '(yas-snippet-dirs (quote ("~/.emacs.d/yasnippet/snippets")) nil (yasnippet))
 '(yas-trigger-key "<tab>"))

(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))

(fset 'vf-copy-current-line-down
      "\C-a\367\C-y\C-e")
(fset 'vf-copy-current-line-up
      "\C-a\367\C-y\C-e\C-p")
(global-set-key (kbd "s-n") 'vf-copy-current-line-down)
(global-set-key [(control shift meta n)] 'vf-copy-current-line-down)
(global-set-key (kbd "s-p") 'vf-copy-current-line-up)
(global-set-key [(control shift meta p)] 'vf-copy-current-line-up)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "文泉驿等宽微米黑"))))
 '(ac-yasnippet-candidate-face ((t (:background "sandybrown" :foreground "dark green"))))
 '(dired-marked ((t nil)))
 '(minimap-font-face ((default (:height 20 :family "DejaVu Sans Mono")) (nil (:height 1.0))))
 '(minimap-semantic-function-face ((t (:inherit (font-lock-function-name-face minimap-font-face) :background "gray90" :box (:line-width 1 :color "black") :height 3.5))))
 '(minimap-semantic-type-face ((t (:inherit (font-lock-function-name-face minimap-font-face) :background "gray90" :box (:line-width 1 :color "black") :height 3.5))))
 '(minimap-semantic-variable-face ((t (:inherit (font-lock-function-name-face minimap-font-face) :background "gray90" :box (:line-width 1 :color "black") :height 3.5))))
 '(region ((t (:background "gtk_selection_bg_color" :foreground "gtk_selection_fg_color"))))
 '(tabbar-selected-face ((t (:inherit tabbar-default-face :background "#102e4e" :foreground "green" :box (:line-width 2 :color "#102e4e" :style released-button)))))
 '(tabbar-unselected-face ((t (:inherit tabbar-default-face :foreground "#102e4e" :box (:line-width 2 :color "white" :style pressed-button))))))

;; wubi
(require 'vf-wubi)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(prefer-coding-system 'utf-8)
