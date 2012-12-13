(setq user-full-name "visayafan")
(setq user-mail-address "visayafan@gmail.com")

(setq gnus-select-method '(nntp "news.aioe.org"))
;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.gnus.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp  "news.gmane.org"))
;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.newsgroup.com.hk"))
(add-to-list 'gnus-secondary-select-methods '(nntp  "news.newsfan.net"))
;; 开启代理功能,为了能让gnus支持离线浏览,gnus 5.10.x会自动开启该功能。
(gnus-agentize)

;; 满71字符自动换行
(add-hook 'message-mode-hook (lambda () (setq fill-column 72) (turn-on-auto-fill)))

;; 发送设置
(setq gnus-posting-styles '((".*" (name "visayafan") (address "visayafan@gmail.com"))))

;; 语言环境设定
(set-language-environment 'Chinese-GB)
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
      '(unknown-8bit x-unknown iso-8859-1))

;;解决gb18030乱码
(setq gnus-newsgroup-ignored-charsets 
      '(unknown-8bit x-unknown gb18030))

;;设定要显示的头信息
(setq gnus-visible-headers
      "^\\(^From:\\|^Subject:\\|^Date:\\)")

;;设定屏幕的分割比例
(gnus-add-configuration '(article (vertical 1.0 (summary .382 point) (article 1.0))))

;;自动显示图片
(auto-image-file-mode)
(setq mm-inline-large-images t)
(add-to-list 'mm-attachment-override-types "image/*")

;; 杂项
(setq gnus-confirm-mail-reply-to-news t
      message-kill-buffer-on-exit t
      message-elide-ellipsis "[...]\n")
