(require 'webjump-plus)
(setq webjump-sites
        (append '(
                  ("stackoverflow" . "www.stackoverflow.com")
                  ("cnblog" . "cnblogs.com/visayafan")
                  ("csdnblog" . "blog.csdn.net/pfanaya")
                  ("baidu" . [simple-query "www.baidu.com" "www.baidu.com/s?wd=" ""])
                  )
                webjump-plus-sites
                webjump-sample-sites))
(global-set-key [(super j)] 'webjump)
(setq browse-url-generic-program (executable-find "google-chrome"))
(setq browse-url-browser-function 'browse-url-generic)
;; (setq webjump-sites
;;       (append '(
;;                 ("stackoverflow" . "www.stackoverflow.com")
;;                 ("cnblog" . "cnblogs.com/visayafan")
;;                 ("csdnblog" . "blog.csdn.net/pfanaya")
;;                 ("baidu" . [simple-query "www.baidu.com" "www.baidu.com/s?wd=" ""])
;;                 )
;;               webjump-sample-sites))
(provide 'vf-webjump)
