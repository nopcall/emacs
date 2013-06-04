(tool-bar-mode -1)
;; 最近访问过的文件和最近修改过的文件
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq session-save-file-coding-system 'utf-8)
;; kill-ring 方便粘贴。
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
;; 替换自带的切换Buffer功能
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; 高亮当前行：hi-line.el,emacs自己带的
;; (require 'hl-line)
;; (global-hl-line-mode -1)
;; 应该是Chrome用的吧？
(require 'edit-server)
(edit-server-start)
;; 设置光标为竖线
;; (setq-default cursor-type 'bar)
;; 光标禁止闪烁-1 光标闪烁1
(blink-cursor-mode 1)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'C++-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'html-mode-hook 'hs-minor-mode)
(global-set-key "\C-cha" 'hs-hide-all)
;(global-set-key "\C-cas" 'hs-show-all)
(global-set-key "\C-chb" 'hs-hide-block)
(global-set-key "\C-cbs" 'hs-show-block)
(global-set-key "\C-chl" 'hs-hide-level)
;; hide-region
(require 'hide-region)
(global-set-key (kbd "C-c h r") 'hide-region-hide)
(global-set-key (kbd "C-c s r") 'hide-region-unhide)
;; hide lines
(require 'hide-lines)
(global-set-key (kbd "C-c h L") 'hide-lines)
(global-set-key (kbd "C-c s l") 'show-all-invisible)
(global-set-key (kbd "C-c m l") 'list-matching-lines)
;; 返回最近修改的地方
;; (require 'goto-last-change)
;; (global-set-key "\C-cgl" 'goto-last-change)
;;;; sudo apt-get install cscope
(require 'xcscope)
(setq cscope-do-not-update-database t)
(add-hook 'c-mode-hook (function cscope:hook))
(add-hook 'c++-mode-hook (function cscope:hook))
(add-hook 'dired-mode-hook (function cscope:hook))
;; (define-key global-map (kbd "C-c s a")  'cscope-set-initial-directory)
(define-key global-map (kbd "C-c s A")  'cscope-unset-initial-directory)
(define-key global-map (kbd "C-c s s ")  'cscope-find-this-symbol)
(define-key global-map (kbd "C-c s d")  'cscope-find-global-definition)
(define-key global-map (kbd "C-c s G")  'cscope-find-global-definition-no-prompting)
(define-key global-map (kbd "C-c s u")  'cscope-pop-mark)
(define-key global-map (kbd "C-c s n")  'cscope-next-symbol)
(define-key global-map (kbd "C-c s N")  'cscope-next-file)
(define-key global-map (kbd "C-c s p")  'cscope-prev-symbol)
(define-key global-map (kbd "C-c s P")  'cscope-prev-file)
(define-key global-map (kbd "C-c s b")  'cscope-display-buffer)
;; (define-key global-map (kbd "C-c s ")' cscope-display-buffer-toggle)
;; 显示被一个输入函数调用的所有函数。
(define-key global-map (kbd "C-c s c")  'cscope-find-functions-calling-this-function)
;; 显示被输入函数调用的所有函数
(define-key global-map (kbd "C-c s C")  'cscope-find-called-functions)
(define-key global-map (kbd "C-c s f")  'cscope-find-this-file);
;; Find files #including a file.
(define-key global-map (kbd "C-c s i")  'cscope-find-files-including-file)
;; Find egrep pattern
(global-set-key (kbd "C-c s e") 'cscope-find-egrep-pattern)
;; Find text string;
(global-set-key (kbd "C-c s t") 'cscope-find-this-text-string)

(put 'dired-find-alternate-file 'disabled nil)
(require 'dired-x) ; 有些特殊的功能

;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(setq show-paren-style 'parentheses)
;;把缺省的 major mode 设置为 text-mode, 而不是几乎什么功能也 没有的 fundamental-mode.
(show-paren-mode t)
(mouse-avoidance-mode 'animate)
;;进行语法加亮。
(global-font-lock-mode t)
;;设置有用的个人信息
(setq user-full-name "visayafan")
(setq user-mail-address "visayafan@gmail.com")
;;让 dired 可以递归的拷贝和删除目录。
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(setq visible-bell t)
;; 高亮显示选择区域
(setq transient-mark-mode t)
;; 设置tab为4个空格的宽度，而不是原来的2
(setq c-basic-offset 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; 打开图片显示功能
(auto-image-file-mode t)
;;页面平滑滚动， scroll-margin 3 靠近屏幕边沿3行时开始滚动，可以很好的看到上下文。
(setq scroll-margin 3
      scroll-conservatively 10000)
;;; hippie-expand
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; 鼠标遇到光标自动躲让
;; (mouse-avoidance-mode 'animate)
;;进行语法加亮。
(global-font-lock-mode t)
;;让 dired 可以递归的拷贝和删除目录。
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(setq visible-bell t)

;; goto-line
(global-set-key (kbd "M-g") 'goto-line)
;; y/n代替yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;;禁用启动画面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
;;;;去掉喇叭声
(setq visible-bell t)
;; 列号
(setq column-number-mode t)
;; 把滚动条放在左边
(menu-bar-left-scroll-bar)
;; narrow C-x n m / C-x n w
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(global-set-key (kbd "M-@") 'set-mark-command)
(global-set-key (kbd "C-@") 'mark-word)
;; 扩展 C-w M-w
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; 指针颜色
(set-cursor-color "blue")
;; 鼠标颜色
(set-mouse-color "yellow")
;; 不产生备份文件,临时文件
;; (setq make-backup-files nil)
;; (setq-default make-backup-files nil)

(setq default-fill-column 110)

;; (global-set-key "\C-z" 'undo)

;; For Linux 鼠标滚轮＋C设置字体大小
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

(global-set-key "\C-cln" 'linum-mode)
(global-set-key "\C-cmb" 'menu-bar-mode)

(global-set-key "\C-cds" 'desktop-save)
(global-set-key "\C-cdc" 'desktop-change-dir)
;; (load "desktop")
;; (desktop-load-default)
;; (desktop-read)

;;abbrev
(setq abbrev-mode t)
(setq abbrev-file-name             ;; tell emacs where to read abbrev
      "~/.emacs.d/abbrev_defs")    ;; definitions from...
(setq save-abbrevs t)              ;; save abbrevs when files are saved
;; you will be asked before the abbreviations are saved
(quietly-read-abbrev-file)       ;; reads the abbreviations file on startup
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
;; 在标题栏显示buffer名
(setq frame-title-format '("" buffer-file-name ))

(setq tags-table-list '("~/.emacs.d/TAGS"))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq tab-width 4 indent-tabs-mode nil)

;; iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
    (set-face-underline-p 'org-link t))
  (iimage-mode))

;; M-x clc即可清屏
(defun clc ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;; 将备份文件保存在~/.emacs_backups中而非当前目录
(setq backup-directory-alist (quote (("." . "~/.backups_emacs"))))
;; 当文件存在硬链接时默认的备份会破坏这种链接（新建一个文件在新文件中修改，与原来链接文件的inode不同，故与原来链接文件存在链接关系的文件不会同步更新），可以修改当存在链接的时候,通过拷贝来备份，而不是写进一个新文件，故链接关系不会被破坏。
(setq backup-by-copying-when-linked t)

;; M+T 替换默认的C-x C-t, Win-t替换默认的M-t
(global-set-key [(super t)] 'transpose-words)
(global-set-key [(M t)] 'transpose-lines)

;; 

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
;; (defface hl-line '((t (:background "white")))
;;   "Face to use for `hl-line-face'." :group 'hl-line)
;; (setq hl-line-face 'hl-line)
;; (global-hl-line-mode t) ; turn it on for all modes by default

;; C-o 用c-context-open-line替换原来的open-line
(global-set-key "\C-o" 'open-line)

;; 加载vc-git需要时间较长，故禁止
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))

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

;; open file fast
;; http://ergoemacs.org/emacs/emacs_hotkey_open_file_fast.html
(global-unset-key [f1])
(global-set-key [f1] 'open-file-fast)
(defvar xah-filelist nil "alist for files i need to open frequently. Key is a short abbrev, Value is file path.")
(setq prefix (if (eq system-type 'gnu/linux) "~/" "d:/"))
(setq filelist
      (list
        (cons "gtd.org"  (concat prefix "visayafan.github.com/Others/diary/gtd.org"))
        (cons ".emacs"  "~/.emacs")
        (cons "index.html"  (concat prefix "visayafan.github.com/index.html"))
        (cons "emacs.org"  (concat prefix "visayafan.github.com/Coding/Lisp/Emacs.org"))
        (cons "org.org"  (concat prefix "visayafan.github.com/Coding/Lisp/EmacsOrg.org"))
        (cons "gnus.org"  (concat prefix "visayafan.github.com/Coding/Lisp/EmacsGnus.org"))
        (cons "latex.org"  (concat prefix "visayafan.github.com/Others/o/latex-lyx.org"))
        (cons "git.org"  (concat prefix "visayafan.github.com/Others/o/git.org"))
        (cons "en.org"  (concat prefix "visayafan.github.com/English/NewWords/NewWords05.org"))
        ))

(defun open-file-fast (openCode)
  "Prompt to open a file from a pre-defined set."
  (interactive
   (list
    (ido-completing-read "Open:"
                         (mapcar
                          (lambda (x) (car x))
                          filelist))))
  (find-file (cdr (assoc openCode filelist))))

;; (defun open-file-fast ()
;;   (interactive)
;;   (let* ((prefix (if (eq system-type 'gnu/linux)
;;                     "~/"
;;                   "d:/"))
;;         (file-list (list
;;                      (concat prefix "visayafan.github.com/Others/diary/gtd.org")
;;                      "~/.emacs"
;;                      (concat prefix "visayafan.github.com/index.html")
;;                      (concat prefix "visayafan.github.com/Coding/Lisp/Emacs.org")
;;                      (concat prefix "visayafan.github.com/Coding/Lisp/EmacsGnus.org")
;;                      ))
;;         (prompt-string)
;;         number)
;;     (dotimes (i (length file-list))
;;       (setq prompt-string (concat prompt-string "[" (number-to-string i) "]" (elt file-list i) "\n")))
;;     (setq prompt-string (concat prompt-string "Enter a number:"))
;;     (setq number (read-number prompt-string))
;;     (find-file (elt file-list number))))

(fset 'vf-copy-current-line-down
      "\C-a\367\C-y\C-e")
(fset 'vf-copy-current-line-up
      "\C-a\367\C-y\C-e\C-p")
;; (global-set-key (kbd "s-n") 'vf-copy-current-line-down)
(global-set-key [(control shift meta n)] 'vf-copy-current-line-down)
;; (global-set-key (kbd "s-p") 'vf-copy-current-line-up)
(global-set-key [(control shift meta p)] 'vf-copy-current-line-up)

;; 默认输入法设置为德语，切换快捷键为C-\
(setq default-input-method "german")

;; 开启自动闭合括号minor mode，但在lisp mode中关掉它，因为写lisp代码时这个功能会成为阻碍
(electric-pair-mode 1)
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (set (make-local-variable 'electric-pair-mode) nil)))
                             
;; replace-string可以无询问式地替换指定区域内容
(global-set-key "\C-crs" 'replace-string)

;; 自动识别编码
(require 'unicad)
;; jump-char 快捷键
;; | ;      | next     |
;; | :      | previous |
;; | C-c C-c| ace-jump |
(require 'jump-char)
(define-key global-map (kbd "C-c a") 'jump-char-forward)
