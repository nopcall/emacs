(setq gnus-thread-hide-subtree t)
(setq gnus-treat-hide-signature t)
;; 在有价值的帖子上加*，就保存到本地，按meta+*就取消保存
(setq gnus-use-cache t)
;; 设置Gnus启动时配置文件
(setq gnus-startup-file "~/.emacs.d/gnus/.newsrc")
(setq gnus-init-file "~/.emacs.d/gnus/.gnus")
(provide 'vf-gnus)
