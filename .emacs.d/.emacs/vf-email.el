(setq mail-user-agent 'gnus-user-agent)
(setq sendmail-program (executable-find "msmtp"))
(if sendmail-program
    (progn ;; send mail using msmtp
      (setq send-mail-function 'sendmail-send-it)
      (setq message-send-mail-function 'message-send-mail-with-sendmail))
  (progn ;; Use emacs smtp client smtpmail
    (setq send-mail-function 'smtpmail-send-it)
    (setq message-send-mail-function 'message-smtpmail-send-it)))
(setq compose-mail-user-agent-warnings nil)
