;; 打开en后缀的文件进入后en-mode，此mode下左/右键后退/前进，上键暂停，下键打开文件
(setq auto-mode-alist (cons '("\\.en$" . en-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.de$" . en-mode) auto-mode-alist))

(define-derived-mode en-mode text-mode "LEN")
(add-hook 'en-mode-hook 'en-mode-emms)
(defun en-mode-emms ()
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/emms-3.0")
  (if (not (eq system-type 'gnu/linux))
      (add-to-list 'exec-path "C:/Program Files/SMPlayer/mplayer"))
  (require 'emms-setup)
  (emms-devel)
  (require 'emms-i18n)    ;; 自动识别音乐标签的编码
  (require 'emms-history) ;; 自动保存和导入上次的播放列表
  (setq emms-player-mpg321-command-name "mpg123"
        emms-player-mplayer-command-name "mplayer"
        emms-player-list '(emms-player-mplayer
                           emms-player-mplayer-playlist
                           emms-player-ogg123
                           emms-player-mpg321))
  ;; When asked for emms-play-directory always start from this
  (if (eq system-type 'gnu/linux)
      (setq emms-source-file-default-directory "/home/visayafan/")
    (setq emms-source-file-default-directory "D:/"))
  ;; Show the current track each time EMMS starts to play a track with "NP : " (Now Playing)
  (add-hook 'emms-player-started-hook 'emms-show)
  (setq emms-show-format "NP: %s")
  ;; face
  (set-face-foreground 'emms-playlist-selected-face "blue")
  (set-face-background 'emms-playlist-selected-face "white")
  (set-face-foreground 'emms-playlist-track-face  "black")
  
  (define-key en-mode-map (kbd "C-c e l") 'emms-playlist-mode-go)
  (define-key en-mode-map (kbd "C-c e s") 'emms-start)
  (define-key en-mode-map (kbd "C-c e e") 'emms-stop)
  (define-key en-mode-map (kbd "C-c e f") 'emms-play-playlist)
  (define-key en-mode-map (kbd "C-c e d") 'emms-play-directory-tree)
  (define-key en-mode-map (kbd "C-c e a") 'emms-add-directory-tree)
  (define-key en-mode-map [\C-\S-right] 'emms-next)
  (define-key en-mode-map [\C-\S-left] 'emms-previous)
  (define-key en-mode-map [left]  (lambda () (interactive) (emms-seek -3))) ;5 seconds
  (define-key en-mode-map [right]  (lambda () (interactive) (emms-seek +3)))
  (define-key en-mode-map [\C-right] 'emms-seek-forward) ;10 seconds
  (define-key en-mode-map [\C-left] 'emms-seek-backward)
  (define-key en-mode-map [\M-left]  (lambda () (interactive) (emms-seek -15))) ;15 seconds
  (define-key en-mode-map [\M-right]  (lambda () (interactive) (emms-seek +15)))
  (define-key en-mode-map [up] 'emms-pause)
  (define-key en-mode-map (kbd "M-j") 'emms-pause) ;为写时方便暂停，设置快捷键为M-j
  (define-key en-mode-map [down] 'emms-play-file)
  (define-key en-mode-map [\C-down] 'emms-volume-lower)
  (define-key en-mode-map [\C-up] 'emms-volume-raise))

(provide 'vf-emms)
