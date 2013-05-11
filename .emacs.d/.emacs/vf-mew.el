(add-to-list 'load-path "~/.emacs.d/mew-6.5")
(autoload 'mew "mew" nil t)  
(autoload 'mew-send "mew" nil t)  
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
(setq mew-icon-directory "~/site-lisp/mew/etc")    
(setq mew-use-cached-passwd t)    
;; mew-pop-size设置成0时，pop邮件大小没有限制    
(setq mew-pop-size 0)    
;; 不删除服务器上的邮件    
(setq mew-pop-delete nil)


