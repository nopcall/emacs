;;当 % 在括号上按下时，那么匹配括号，否则输入一个 %。你只需要在 .emacs 文件里加入这些东西就可以达到目的：
;; (global-set-key "%" 'match-paren)          
;; (defun match-paren (arg)
;;   "Go to the matching paren if on a paren; otherwise insert %."
;;   (interactive "p")
;;   (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;         ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;         (t (self-insert-command (or arg 1)))))


;; (add-to-list 'load-path "~/.emacs.d/twittering-mode")
;; (require 'twittering-mode)
;; ;; (setq twittering-use-master-password t)
;; (setq twittering-allow-insecure-server-cert t)
;; (setq twittering-oauth-use-ssl nil)
;; (setq twittering-use-ssl nil)
;; (twittering-enable-unread-status-notifier)
;; (setq-default twittering-icon-mode t)
;; (setq twittering-initial-timeline-spec-string '(":home@sina"))



