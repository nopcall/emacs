;; http://blog.csdn.net/winterttr/article/details/7273345
;; https://github.com/brianjcj/auto-complete-clang.git

;; 加载clang
(add-to-list 'load-path "~/.emacs.d/auto-complete-clang")
(require 'auto-complete-clang)

;; 自动启动
(setq ac-auto-start t)
;; 延迟
(setq ac-quick-help-delay 0.5)  
;; 添加c-mode和c++-mode的hook，开启auto-complete的clang扩展
(defun my-ac-cc-mode-setup ()
      (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/include/c++/4.5
 /usr/include/c++/4.5/i686-linux-gnu
 /usr/include/c++/4.5/backward
 /usr/local/include
 /usr/lib/i386-linux-gnu/gcc/i686-linux-gnu/4.5.2/include
 /usr/lib/i386-linux-gnu/gcc/i686-linux-gnu/4.5.2/include-fixed
 /usr/include/i386-linux-gnu
 /usr/include
")))
(provide 'vf-auto-complete-clang)
