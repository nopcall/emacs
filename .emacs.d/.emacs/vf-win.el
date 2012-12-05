;; 
;;此文件专门为配置windows
;;


;; win7下使用windowspages来虚拟多个桌面时需要用到此快捷键，所以禁止
(global-unset-key [(control meta right)])
(global-unset-key [(control meta left)])

;; 好像不管用，还是添加到环境变量里去吧
;; (setq eshell-path-env (concat (getenv "PATH")
;;                               "C:\\Program Files\\Google\\Chrome\\Application;"
;;                               "c:\\Program Files\\GNU\\GnuPG\\pub;"
;;                               ))
;; 
(setq browse-url-generic-program (executable-find "chrome"))

;; 可以解决win7下慢速度
(setq w32-get-true-file-attributes nil)
(server-start)

(provide 'vf-win)
