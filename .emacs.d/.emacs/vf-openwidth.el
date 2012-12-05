                                        ;  openwith ,外部程序

;;直接用正常的方式打开相应的文件,openwith会自动做处理
;;`C-xC-f'即可
(when (eq system-type 'windows-nt)
  (require'w32-shell-execute))
(require 'openwith)
(openwith-mode t)
(when (eq system-type 'gnu/linux)
  (setq openwith-associations
        '(("\\.pdf$" "evince" (file)) ("\\.mp3$" "smplayer" (file) )
          ("\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "smplayer" (file) )
          ;;          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "eog" (file))
          ("\\.CHM$\\|\\.chm$" "chmsee"  (file) ))))
(when (eq system-type 'windows-nt)
  ;;windows 上使用w32-shell-execute 调用系统的相应程序打开
  (setq openwith-associations
        '(("\\.pdf$" "open" (file)) ("\\.mp3$" "open" (file) )
          ("\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "open" (file) )
          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "open" (file))
          ("\\.CHM$\\|\\.chm$" "open"  (file) ))))
(provide 'vf-openwidth)