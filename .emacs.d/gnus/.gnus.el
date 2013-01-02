(setq user-full-name "visayafan")
(setq user-mail-address "visayafan@gmail.com")

(setq gnus-select-method '(nntp "news.aioe.org"))
;; (setq gnus-select-method '(nntp "localhost"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.gnus.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp  "news.gmane.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp  "news.newsfan.net"))

;; 满71字符自动换行
(add-hook 'message-mode-hook (lambda () (setq fill-column 72) (turn-on-auto-fill)))

;; 发送设置
(setq gnus-posting-styles '((".*"
                             (name "visayafan")
                             (body "\n\nvisayafan\n--\n") 
                             (address "visayafan@gmail.com"))))

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
(setq gnus-visible-headers
      "^\\(^From:\\|^Subject:\\|^Date:\\)")

;;设定屏幕的分割比例
;; (gnus-add-configuration '(article (vertical 1.0 (summary .382 point) (article 1.0))))
(gnus-add-configuration '(article (vertical 1.0 (summary .319 point) (article 1.0))))

;;自动显示图片
(auto-image-file-mode)
(setq mm-inline-large-images t)
(add-to-list 'mm-attachment-override-types "image/*")

;; 杂项
(setq gnus-confirm-mail-reply-to-news t
      message-kill-buffer-on-exit t
      message-elide-ellipsis "[...]\n")
