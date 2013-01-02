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
;; (setq gnus-cache-directory "~/.emacs.d/gnus/news/cache/")           ;缓存目录
(setq gnus-cache-active-file "~/.emacs.d/gnus/news/cache/active")   ;缓存激活文件
(setq message-directory "~/.emacs.d/gnus/mail/")                    ;邮件的存储目录
(setq message-auto-save-directory "~/.emacs.d/gnus/mail/drafts")    ;自动保存的目录
(setq mail-source-directory "~/.emacs.d/gnus/mail/incoming")        ;邮件的源目录
(setq nnmail-message-id-cache-file "~/.emacs.d/gnus/.nnmail-cache") ;nnmail的消息ID缓存
(setq nnml-newsgroups-file "~/.emacs.d/gnus/mail/newsgroup")        ;邮件新闻组解释文件
(setq nntp-marks-directory "~/.emacs.d/gnus/news/marks")            ;nntp组存储目录
(setq mml-default-directory "~/.emacs.d/gnus/attach/")              ;附件的存储位置

;; 将发送的邮件和帖子保存在nnml gropu 根据时间保存
(setq gnus-message-archive-method '(nnml "archive"
                                         (nnml-directory "~/.emacs.d/gnus/archive")
                                         (nnml-active-file "~/.emacs.d/gnus/archive/active")
                                         (nnml-get-new-mail nil)
                                         (nnml-inhibit-expiry t)))
(setq gnus-message-archive-group
      '((if (message-news-p)
            (concat "news-" (format-time-string "%Y"))
          (concat "mail-" (format-time-string "%Y")))))

;; 在summary缓冲区中解除M-s绑定的向前搜索，重新绑定用来切换buffer。
(setq gnus-summary-mode-hook
      '(lambda ()
         (local-unset-key (kbd "M-s"))
         (local-unset-key (kbd "N"))
         (local-unset-key (kbd "n"))
         (local-unset-key (kbd "P"))
         (local-unset-key (kbd "p"))
         (local-unset-key [(tab)])
         (local-set-key [(tab)] 'vf-hide-show-thread)
         (local-set-key (kbd "M-s") 'ido-switch-buffer)
         (local-set-key "\C-cs" 'gnus-summary-search-article-forward)
         (local-set-key "N" 'gnus-summary-next-unread-article)
         (local-set-key "n" 'gnus-summary-next-article)
         (local-set-key "P" 'gnus-summary-prev-unread-article)
         (local-set-key "p" 'gnus-summary-prev-article)))

;; 保存article时默认header冗余太多，设置变量gnus-saved-headers来精简
(setq gnus-save-all-headers nil)        ;只有此变量为nil，gnus-saved-headers才有效
(setq gnus-saved-headers "^From:\\|^Newsgroups:\\|^Date:\\|^Followup-To:\\|^Reply-To:\\|^Summary:\\|^Keywords:\\|^Subject:")

;; 自动取回完整thead
(setq gnus-fetch-old-headers 'some)
;; 下载header和article方便 offline的时候使用 http://www.gnus.org/manual/gnus_401.html#SEC522
;; (setq gnus-agent t) ;;默认已经开启
;; agent缓存articles(默认情况下只缓存headers) 但可能会耗费空间。
(setq gnus-agent-cache t)

(setq gnus-group-line-format "%P%M%S%p%P%5y-|-%6t-|-%B%(%g%)
")                                      ;此处换行不可移动到上行中

(provide 'vf-gnus)
