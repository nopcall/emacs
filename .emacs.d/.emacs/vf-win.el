;; 
;;���ļ�ר��Ϊ����windows
;;


;; win7��ʹ��windowspages������������ʱ��Ҫ�õ��˿�ݼ������Խ�ֹ
(global-unset-key [(control meta right)])
(global-unset-key [(control meta left)])

;; ���񲻹��ã�������ӵ�����������ȥ��
;; (setq eshell-path-env (concat (getenv "PATH")
;;                               "C:\\Program Files\\Google\\Chrome\\Application;"
;;                               "c:\\Program Files\\GNU\\GnuPG\\pub;"
;;                               ))
;; 
(setq browse-url-generic-program (executable-find "chrome"))

;; ���Խ��win7�����ٶ�
(setq w32-get-true-file-attributes nil)
(server-start)

(provide 'vf-win)
