;;此文件专门为配置windows

;; win7下使用windowspages来虚拟多个桌面时需要用到此快捷键，所以禁止
(global-unset-key [(control meta right)])
(global-unset-key [(control meta left)])

;; (setq browse-url-browser-function 'browse-url-generic-program)
(setq browse-url-generic-program (executable-find "chrome.exe"))

;; gnupg
(custom-set-variables 
   '(epa-file-name-regexp "\\.gpg\\(~\\|\\.~[0-9]+~\\)?\\'") 
   '(epg-gpg-program "c:/Program Files/GNU/GnuPG/pub/gpg2.exe")) 

;; 可以解决win7下慢速度
(setq w32-get-true-file-attributes nil)
;; (server-start)

;; 向PATH和exec-path中添加外部命令路径函数
(defun vf-add-to-exec-path (path)
  " 参考：http://blog.csdn.net/winterttr/article/details/7273283"
  (setenv "PATH" (concat (expand-file-name path)
                         path-separator
                         (getenv "PATH")))
  (setq exec-path
        (cons (expand-file-name path)
              exec-path)))
(mapc #'vf-add-to-exec-path
      (reverse
       '("C:/Program Files/Git/bin"
         "D:/VFInstall/SBCL"
         )))
;; 解决win下选中区域的前景色
(custom-set-faces
 '(region ((t (:background "yellow" :foreground "blue")))))

(setq warning-minimum-level :error)
;(setq temp-buffer-show-function (function ignore)) 
(setq byte-compile-warnings nil)
;; eshell别名文件
(setq eshell-aliases-file "~/.emacs.d/eshell/alias-win32")

;; 解决shell乱码 
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(load-file "~/.emacs.d/.emacs/vf-font.el")

(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(prefer-coding-system 'gbk)
