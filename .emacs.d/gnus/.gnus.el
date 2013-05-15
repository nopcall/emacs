(setq user-full-name "Han Fan")
(setq user-mail-address "visayafan@gmail.com")

(setq gnus-select-method '(nntp "news.aioe.org"))
;; (setq gnus-select-method '(nntp "localhost"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.gnus.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp  "news.gmane.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp  "news.gwene.org"))
;; (add-to-list 'gnus-secondary-select-methods '(nntp  "news.newsfan.net"))

;; 满71字符自动换行
(add-hook 'message-mode-hook (lambda () (setq fill-column 72) (turn-on-auto-fill)))
;; 回贴时buffer的显示设置
(setq gnus-posting-styles '((".*" (name "visayafan") (body "\n----") (address "visayafan@gmail.com"))))
;; 语言环境设定
(set-language-environment 'UTF-8)
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq gnus-default-charset 'chinese-iso-8bit
      gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
      gnus-summary-show-article-charset-alist
    	'((1 . cn-gb-2312)
  		  (2 . gb18030)
  		  (3 . chinese-iso-8bit)
  		  (4 . gbk)
  		  (5 . big5)
  		  (6 . utf-8))
      gnus-newsgroup-ignored-charsets
        '(unknown-8bit x-unknown iso-8859-1 gb18030 x-gbk))
;;解决gb18030乱码
(setq gnus-newsgroup-ignored-charsets 
      '(unknown-8bit x-unknown gb18030))
;;设定要显示的头信息
(setq gnus-visible-headers "^\\(^From:\\|^Subject:\\|^Date:\\)")
;;设定屏幕的分割比例
(gnus-add-configuration '(article (vertical 1.0 (summary .319 point) (article 1.0))))
;;自动显示图片
(auto-image-file-mode)
(setq mm-inline-large-images t)
(add-to-list 'mm-attachment-override-types "image/*")
;; 杂项
(setq gnus-confirm-mail-reply-to-news t
      message-kill-buffer-on-exit t
      message-elide-ellipsis "[...]\n")
(setq gnus-group-line-format "%P%M%S%p%P%5y-|--%B%(%G%)
")      ;;此处换行不可移动到上行中
;; 加快启动速度
(setq gnus-check-new-newsgroups nil)
(setq gnus-check-bogus-newsgroups nil)
;; 最多读取帖子数，默认值是nil
(setq gnus-newsgroup-maximum-articles nil) 
;; 保存article时默认header冗余太多，设置变量gnus-saved-headers来精简
(setq gnus-save-all-headers nil)        ;只有此变量为nil，gnus-saved-headers才有效
(setq gnus-saved-headers "^From:\\|^Newsgroups:\\|^Date:\\|^Followup-To:\\|^Reply-To:\\|^Summary:\\|^Keywords:\\|^Subject:")
;; 自动取回部分完整thead
(setq gnus-fetch-old-headers 'some)
;; 下载header和article方便 offline的时候使用
;; http://www.gnus.org/manual/gnus_401.html#SEC522
(setq gnus-agent t) ;;默认已经开启
;; 当article已经存在于agent中的时候，即使当前状态为plugged也不要下载，直接从agent里读取
(setq gnus-agent-cache t)
;; 我不是新手，不需要进行太多的交互提问
;; (setq gnus-novice-user nil)
;; (setq gnus-expert-user t)
;退出时不进行交互式询问
(setq gnus-interactive-exit nil)

;; ;; gnus是我唯一的新闻组阅读器，所以不需要保存.newsrc.
;; ;; http://www.gnus.org/manual/big-gnus.html#SEC11
;; (setq gnus-save-newsrc-file nil)
;; (setq gnus-read-newsrc-file nil)
;; ;; dribble文件是.newsrc的备份文件，连.newsrc都不需要还要dribble干嘛,
;; ;; http://www.gnus.org/manual/big-gnus.html#SEC11
;; (setq gnus-use-dribble-file nil)
;; (setq gnus-always-read-dribble-file nil)

;; 当读取一个帖子的时候，预读取它后来的帖子
;; 个数由gnus-use-article-prefetch决定，默认为30，设置为t则没有限制
;; http://www.gnus.org/manual/big-gnus.html#IDX1024
(setq gnus-asynchronous t)              
;; 指定多于多少个未读帖子才算是大新闻组，多于此值则会提示用户输入个数,默认是200
;; 用户输入负数-n则表明取最老的n个帖子
;; http://www.gnus.org/manual/big-gnus.html#IDX103
(setq gnus-large-newsgroup 300)

;; article在agent本地过期时间，默认为7天
(setq gnus-agent-expire-days 90)
(defun my-article-old-p ()
  "Say whether an article is old."
  (< (time-to-days (date-to-time (mail-header-date gnus-headers)))
     (- (time-to-days (current-time)) gnus-agent-expire-days)))
(require 'gnus-agent)
(setq  gnus-category-predicate-alist
       (append gnus-category-predicate-alist
               '((old . my-article-old-p))))
