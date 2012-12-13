(setq gnus-thread-hide-subtree t)
(setq gnus-treat-hide-signature t)
;; 在有价值的帖子上加*，就保存到本地，按meta+*就取消保存
(setq gnus-use-cache t)
(setq gnus-init-file "~/.emacs.d/gnus/.gnus")                       ;设置Gnus启动时配置文件
(setq gnus-startup-file "~/.emacs.d/gnus/.newsrc")                  ;初始文件
(setq gnus-default-directory "~/.emacs.d/gnus/")                    ;默认目录
(setq gnus-home-directory "~/.emacs.d/gnus/")                       ;主目录
(setq gnus-dribble-directory "~/.emacs.d/gnus/")                    ;恢复目录
(setq gnus-directory "~/.emacs.d/gnus/news/")                       ;新闻组的存储目录
(setq gnus-article-save-directory "~/.emacs.d/gnus/news/")          ;文章保存目录
(setq gnus-kill-files-directory "~/.emacs.d/gnus/news/trash/")      ;文件删除目录
(setq gnus-agent-directory "~/.emacs.d/gnus/news/agent/")           ;代理目录
(setq gnus-cache-directory "~/.emacs.d/gnus/news/cache/")           ;缓存目录
(setq gnus-cache-active-file "~/.emacs.d/gnus/news/cache/active")   ;缓存激活文件
(setq message-directory "~/.emacs.d/gnus/mail/")                    ;邮件的存储目录
(setq message-auto-save-directory "~/.emacs.d/gnus/mail/drafts")    ;自动保存的目录
(setq mail-source-directory "~/.emacs.d/gnus/mail/incoming")        ;邮件的源目录
(setq nnmail-message-id-cache-file "~/.emacs.d/gnus/.nnmail-cache") ;nnmail的消息ID缓存
(setq nnml-newsgroups-file "~/.emacs.d/gnus/mail/newsgroup")        ;邮件新闻组解释文件
(setq nntp-marks-directory "~/.emacs.d/gnus/news/marks")            ;nntp组存储目录
(setq mml-default-directory "~/.emacs.d/gnus/attach/")              ;附件的存储位置

;; 在summary缓冲区中解除M-s绑定的向前搜索，重新绑定用来切换buffer。
(setq gnus-summary-mode-hook
      '(lambda ()
         (local-unset-key (kbd "M-s"))
         (local-set-key (kbd "M-s") 'ido-switch-buffer)
         (local-set-key "\C-cs" 'gnus-summary-search-article-forward)))

;; 保存article时默认header冗余太多，设置变量gnus-saved-headers来精简
(setq gnus-save-all-headers nil)        ;只有此变量为nil，gnus-saved-headers才有效
(setq gnus-saved-headers "^From:\\|^Newsgroups:\\|^Date:\\|^Followup-To:\\|^Reply-To:\\|^Summary:\\|^Keywords:\\|^Subject:")

(provide 'vf-gnus)
