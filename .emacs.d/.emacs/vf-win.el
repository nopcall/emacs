;; 
;;���ļ�ר��Ϊ����windows
;;

;; win7��ʹ��windowspages������������ʱ��Ҫ�õ��˿�ݼ������Խ�ֹ
(global-unset-key [(control meta right)])
(global-unset-key [(control meta left)])

(setq browse-url-generic-program (executable-find "chrome"))

;; gnupg
(custom-set-variables 
   '(epa-file-name-regexp "\\.gpg\\(~\\|\\.~[0-9]+~\\)?\\'") 
   '(epg-gpg-program "c:/Program Files/GNU/GnuPG/pub/gpg2.exe")) 

;; ���Խ��win7�����ٶ�
(setq w32-get-true-file-attributes nil)
;; (server-start)

(setq exec-path (append exec-path '("D:\\VFInstall\\SBCL")))


(provide 'vf-win)
