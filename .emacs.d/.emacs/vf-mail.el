(add-to-list 'load-path "~/.emacs.d/mew-6.5")

(autoload 'mew "mew" nil t)  
(autoload 'mew-send "mew" nil t)  
;; Mew����ʱ�������뵽�ڴ棬�˳�ʱ���ܱ��浽�ļ�����������
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
;; �����ͼ��·���Ͱ�װ·���йأ������뿴Mew�İ�װ����    
(setq mew-icon-directory "~/.emacs.d/mew/etc")    
;; (setq mew-use-cached-passwd t)    
;; mew-pop-size���ó�0ʱ��pop�ʼ���Сû������    
(setq mew-pop-size 0)    
;; ��ɾ���������ϵ��ʼ�    
(setq mew-pop-delete nil)    
(setq mew-use-biff t)  ;; ����ʹ��Biff��������Ƿ������ʼ���Ĭ��Ϊ5���ӡ���������ʼ�������emacs��״̬����ʾMail(n)����ʾ��n��ʾ���ʼ���Ŀ��
;; (setq mew-use-biff-bell t)  ;; ��������֪ͨ�����ʼ�
(setq mew-biff-interval 10) ;; �����Զ�������ʼ���ʱ��������λ������

