;; https://github.com/rejeep/wrap-region.git

(add-to-list 'load-path "~/.emacs.d/wrap-region")
(require 'wrap-region)
;; 总是打开
(wrap-region-mode t)
;; 自定义
;; 第1个是插入的符号，第2个是触发的符号，即按下#即可插入{- -}
(wrap-region-add-wrappers
 '(("$" "$")
   ("{-" "-}" "#")
   ("/" "/" nil 'ruby-mode)
   ("/* " " */" "#" '(java-mode javascript-mode css-mode))
   ("`" "`" nil '(markdown-mode ruby-mode))))
;; 可以指定在某些模式下不可用，设置变量wrap-region-except-modes

