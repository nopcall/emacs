(add-to-list 'load-path "~/.emacs.d/iedit")
;; 批量修改变量名
;; 使用：选中要修改的变量名后C-;即可看到buffer中所有的此变量名都被高亮，开始修改，C-;结束。默认是整个buffer，如果有region被选中则只作用在此region上
(require 'iedit)
(provide 'vf-iedit)
