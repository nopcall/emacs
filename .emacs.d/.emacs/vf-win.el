;;此文件专门为配置windows

;; win7下使用windowspages来虚拟多个桌面时需要用到此快捷键，所以禁止
(global-unset-key [(control meta right)])
(global-unset-key [(control meta left)])

(setq browse-url-generic-program (executable-find "chrome"))

;; gnupg
(custom-set-variables 
   '(epa-file-name-regexp "\\.gpg\\(~\\|\\.~[0-9]+~\\)?\\'") 
   '(epg-gpg-program "c:/Program Files/GNU/GnuPG/pub/gpg2.exe")) 

;; 可以解决win7下慢速度
(setq w32-get-true-file-attributes nil)
;; (server-start)

(setq exec-path (append exec-path '("D:\\VFInstall\\SBCL")))

(setq eshell-aliases-file "~/.emacs.d/eshell/alias-win32")

;; 解决shell乱码 
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(require 'vf-font)

(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(prefer-coding-system 'gbk)
