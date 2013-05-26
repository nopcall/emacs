(require 'erc)
(erc-truncate-mode t)
;; 默认是3000
(setq erc-max-buffer-size 3000) 
;; 此时调用erc-truncate-buffer即清屏剩下erc-max-buffer-size字符
(setq erc-truncate-buffer-on-save t)
;; 使用/CLC即可清空当前buffer
;; 必须要大写 http://keramida.wordpress.com/2008/11/04/extending-erc-with-emacs-lisp/
(defun erc-cmd-CLC (&rest ignore)
  "Erase the current buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (message "Flushed contents of channel")
    t))
(defun erc-cmd-CLR (&rest ignore)
  "Erase the current buffer."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (kill-line
     (truncate (* (count-lines (point-min) (point-max)) 0.8)))))
;; 忽略某些消息，比如有人进来，有人出去
(setq erc-ignore-list nil)
(erc-track-mode t)
;; http://www.irchelp.org/irchelp/rfc/chapter6.html#c6_2
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                 "324" "329" "332" "333" "353" "477"))
(setq erc-hide-list '("JOIN" "PART" "QUIT" "MODE"))
;; nick 就是登录时用的，full name 是别人查询你的时候显示的信息
(setq erc-nick "visayafan" erc-user-full-name "Han Fan")

;; 进入erc后自动打开的channel
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#orgmode" "#ubuntu-cn")))

;; 快捷键C-c e，如果erc已经打开则切换到erc否则打开erc
(global-set-key (kbd "C-c e") 'fan-erc-start-or-switch) ;; ERC
(defun fan-erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?
      (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6667 :nick "visayafan" :full-name "Han Fan")
      ;; (erc :server "irc.gimp.org" :port 6667 :nick "visayafan" :full-name "Han Fan")
      )))
;; 使用tabber
(setq erc-header-line-uses-tabbar-p t)
;; 将M-n/p用于切换buffer
(add-hook 'erc-mode-hook 'fan/erc-change-key)
(defun fan/erc-change-key ()
  (interactive)
  (progn
    (local-unset-key (kbd "M-n"))
    (local-unset-key (kbd "M-p"))
    (local-set-key "\C-cn" 'rcirc-insert-next-input)
    (local-set-key "\C-cp" 'rcirc-insert-prev-input)
    (local-set-key (kbd "M-n") 'tabbar-forward)
    (local-set-key (kbd "M-n") 'tabbar-backward)))
;; log
(require 'erc-log)
(erc-log-mode 1)
(setq erc-log-channels-directory "~/.emacs.d/ERClog"
      erc-save-buffer-on-part t
      erc-log-file-coding-system 'utf-8
      erc-log-write-after-send t
      erc-log-write-after-insert t)
(unless (file-exists-p erc-log-channels-directory)
  (mkdir erc-log-channels-directory t))

;; http://www.emacswiki.org/emacs/ErcFilling
;; erc-fill-function有2种风格，默认是er-fill-variable，不过个人觉得erc-fill-static更好看
;; 注意如果使用er-fill-function则my-insert-modify-hook的looking-at匹配一行必须做相应修改
(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 15)

(setq erc-insert-timestamp-function 'erc-insert-timestamp-left)


;; 下面所有配置都是关于颜色的
;; http://www.emacswiki.org/emacs/ErcNickColors
(setq nick-face-list '())
;; Define the list of colors to use when coloring IRC nicks.                                                                     
(setq-default erc-colors-list '("blue" "red" "purple" "gray0" "DodgerBlue" "SeaGreen4" "MediumSlateBlue"  "DeepPink2" "DarkGoldenrod"))

(defun build-nick-face-list ()
  "build-nick-face-list builds a list of new faces using the                                                                     
foreground colors specified in erc-colors-list.  The nick faces                                                                  
created here will be used to format IRC nicks."
  (setq i -1)
  (setq nick-face-list
        (mapcar
         (lambda (COLOR)
           (setq i (1+ i))
           (list (custom-declare-face
                  (make-symbol (format "erc-nick-face-%d" i))
                  (list (list t (list :foreground COLOR)))
                  (format "Nick face %d" i))))
         erc-colors-list)))

(defun my-insert-modify-hook ()
  "This insert-modify hook looks for nicks in new messages and                                                                   
computes md5(nick) and uses substring(md5_value, 0, 4) mod (length                                                               
nick-face-list) to index the face list and produce the same face for a                                                           
given nick each time it is seen.  We get a lot of collisions this way,                                                           
unfortunately, but it's better than some other methods I tried.                                                                  
Additionally, if you change the order or size of the erc-colors-list,                                                            
you'll change the colors used for nicks."
  (if (null nick-face-list) (build-nick-face-list))
  (save-excursion
    (goto-char (point-min))
    ;; (if (looking-at "<\\([^>]*\\)>")   ;;如果erc-fill-function为er-fill-varialbe则应该使用此行而非下一行
    (if (looking-at "[ \t]*<\\([^>]*\\)>")
        (let ((nick (match-string 1)))
          (put-text-property (match-beginning 1) (match-end 1)
                             'face (nth
                                    (mod (string-to-number
                                          (substring (md5 nick) 0 4) 16)
                                         (length nick-face-list))
                                    nick-face-list))))))

;; This adds the ERC message insert hook.                                                                                        
(add-hook 'erc-insert-modify-hook 'my-insert-modify-hook)
