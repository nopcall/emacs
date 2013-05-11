(add-to-list 'load-path "~/.emacs.d/mew-6.5")

(autoload 'mew "mew" nil t)  
(autoload 'mew-send "mew" nil t)  
;; Mew运行时保存密码到内存，退出时加密保存到文件，有主密码
(setq mew-use-master-passwd t)
(setq mew-charset-m17n "utf-8")
(setq mew-internal-utf-8p t)
;; Optional setup (Read Mail menu for Emacs 21):  
(if (boundp 'read-mail-command)  
    (setq read-mail-command 'mew))  
;; Optional setup (e.g. C-xm for sending a message):  
(autoload 'mew-user-agent-compose "mew" nil t)  
(if (boundp 'mail-user-agent)  
    (setq mail-user-agent 'mew-user-agent))  
(if (fboundp 'define-mail-user-agent)  
    (define-mail-user-agent  
      'mew-user-agent  
      'mew-user-agent-compose  
      'mew-draft-send-message  
      'mew-draft-kill  
      'mew-send-hook))  
(setq user-full-name "visayafan")  
(setq user-mail-address "visayafan@gmail.com")  
(setq mew-cite-fields '("Date:"  "From:"))  
(setq mew-cite-format "On %s %s wrote:\n\n")  
(setq mew-use-cached-passwd t)  
;; 下面的图标路径和安装路径有关，具体请看Mew的安装过程    
(setq mew-icon-directory "~/.emacs.d/mew/etc")    
;; (setq mew-use-cached-passwd t)    
;; mew-pop-size设置成0时，pop邮件大小没有限制    
(setq mew-pop-size 0)    
;; 不删除服务器上的邮件    
(setq mew-pop-delete nil)    
(setq mew-use-biff t)  ;; 设置使用Biff检查邮箱是否有新邮件，默认为5分钟。如果有新邮件，则在emacs的状态栏显示Mail(n)的提示—n表示新邮件数目。
;; (setq mew-use-biff-bell t)  ;; 设置嘟嘟声通知有新邮件
(setq mew-biff-interval 10) ;; 设置自动检查新邮件的时间间隔，单位：分钟

