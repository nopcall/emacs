(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/.emacs")
(add-to-list 'load-path "~/.emacs.d/others")

;; My Emacs Configuration
;; Path: .emacs.d/others and .emacs.d/.emacs
(load-file "~/.emacs.d/.emacs/vf-basic.el")
(load-file "~/.emacs.d/.emacs/vf-autocomplete.el")
(load-file "~/.emacs.d/.emacs/vf-cpp.el")
(load-file "~/.emacs.d/.emacs/vf-gdb.el")
(load-file "~/.emacs.d/.emacs/vf-global-set-key.el")
(load-file "~/.emacs.d/.emacs/vf-not-sure.el")
;; (load-file "~/.emacs.d/.emacs/vf-cedet-bzr.el")
(load-file "~/.emacs.d/.emacs/vf-org-setting-8.x.el")
(load-file "~/.emacs.d/.emacs/vf-webjump.el")
(load-file "~/.emacs.d/.emacs/vf-org-remember.el")
(load-file "~/.emacs.d/.emacs/vf-zencoding.el")
(load-file "~/.emacs.d/.emacs/vf-yasnippet.el")
(load-file "~/.emacs.d/.emacs/vf-multiple-cursors.el")          ;多个光标同时操作
(load-file "~/.emacs.d/.emacs/vf-html-mode.el")                 ;扩展自带的SGML mode
(load-file "~/.emacs.d/.emacs/vf-ace-jump-mode.el")             ;按下一个键后可能跳转的地主用红色的不同字母标识只要再按下此标识字符即可跳转到那个地方  
(load-file "~/.emacs.d/.emacs/vf-expand-region.el")             ;C-=根据位置选中可能要选中的，例如引号之间，括号之间
(load-file "~/.emacs.d/.emacs/vf-ido.el")
(load-file "~/.emacs.d/.emacs/vf-smex.el")                      ;M-x更加智能化
(load-file "~/.emacs.d/.emacs/vf-jiami.el")                     ;加密
(load-file "~/.emacs.d/.emacs/vf-eshell.el")                    ;eshell
(load-file "~/.emacs.d/.emacs/vf-slime.el")                     ;slime
(load-file "~/.emacs.d/.emacs/vf-gnus.el")                      ;gnus
(load-file "~/.emacs.d/.emacs/vf-wrap-region.el")               ;可以在选定区域外包上指定字符串
(load-file "~/.emacs.d/.emacs/vf-emms.el")
(load-file "~/.emacs.d/.emacs/vf-graphviz.el") ;graphviz
(load-file "~/.emacs.d/.emacs/vf-matlab.el")
;; (load-file "~/.emacs.d/.emacs/vf-bbdb.el")
;; (load-file "~/.emacs.d/.emacs/typopunct.el")
;; (load-file "~/.emacs.d/.emacs/vf-weibo.el")
;; (load-file "~/.emacs.d/.emacs/vf-wubi.el")                      ;wubi
;; (load-file "~/.emacs.d/.emacs/vf-ibus.el")
;; (load-file "~/.emacs.d/.emacs/vf-color-theme.el")
;; (load-file "~/.emacs.d/.emacs/vf-doxymacs.el")
;; (load-file "~/.emacs.d/.emacs/vf-latex.el")
;; (load-file "~/.emacs.d/.emacs/vf-perl.el")
;; (load-file "~/.emacs.d/.emacs/vf-java.el")
;; (load-file "~/.emacs.d/.emacs/vf-python.el")
;; (load-file "~/.emacs.d/.emacs/vf-html-helper-mode.el")
;; (load-file "~/.emacs.d/.emacs/vf-folding.el")
;; (load-file "~/.emacs.d/.emacs/vf-indent-hint.el")            ;没有sublime的缩进线细
;; (load-file "~/.emacs.d/.emacs/vf-twitter.el")
;; (load-file "~/.emacs.d/.emacs/vf-minimap.el")
;; (load-file "~/.emacs.d/.emacs/vf-undo-tree.el")              ;undo-tree 不怎么常用
;; (load-file "~/.emacs.d/.emacs/exec-path-from-shell.el")
;; (exec-path-from-shell-initialize)
;; (load-file "~/.emacs.d/.emacs/vf-openwith.el")               ;调用外部命令打开emacs不能打开的文件
;; (load-file "~/.emacs.d/.emacs/vf-package.el")                ;包管理
;; (load-file "~/.emacs.d/.emacs/vf-w3m.el")                    ;w3m
;; (load-file "~/.emacs.d/.emacs/vf-mail.el")                   ;mail
;; (load-file "~/.emacs.d/.emacs/vf-auto-complete-clang.el")    ;clang
;; (load-file "~/.emacs.d/.emacs/vf-daemon.el")                 ;daemon client
;; (load-file "~/.emacs.d/.emacs/vf-newsticker.el")             ;newsticker
;; (load-file "~/.emacs.d/.emacs/vf-iedit.el")                  ;iedit
;; (load-file "~/.emacs.d/.emacs/unicad.el")                       ;自动判断文档编码Universal Charset Auto Detector
;; (load-file "~/.emacs.d/.emacs/winner.el")                       ;C-c left/right undo/redo窗口布局
;; (winner-mode t)
;; (load-file "~/.emacs.d/.emacs/windresize.el")                   ;调整窗口大小

(custom-set-variables
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
 '(custom-theme-directory "~/.emacs.d/vfthemes")
)

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

(menu-bar-mode -1)
