;; (setq gnus-select-method
;;       '(nnimap "OfflineImap"
;;                (nnimap-address "localhost")
;;                (nnimap-server-port 143)
;;                ))
;; (setq gnus-select-method '(nntp "news.gmane.org"))
;; (setq gnus-secondary-select-methods '((nntp "news.gnus.org")
;;                                       (nntp  "news.aioe.org")
;;                                       (nnimap "Mail"
;;                                               (nnimap-address "localhost")
;;                                               (nnimap-server-port 143)
;;                                               (nnimap-user visayafan)
;;                                               (nnimap-stream network)
;;                                               (nnimap-authenticator login))
;;                                               ;; (nnimap-shell-program "/usr/"))
;;                                       ;; (nnmaildir "" (directory "/home/visayafan/.emacs.d/gnus/Gmail/"))
;;                                       ))


;; (setq gnus-select-method '(nnimap "Mail"
;;                                   (nnimap-address "localhost")
;;                                   (nnimap-server-port 143)
;;                                   (nnimap-stream shell)
;;                                   (imap-shell-program "/usr/lib/dovecot/imap -o mail_location=maildir:$HOME/Maildir")))
;; (setq gnus-select-method '(nntp  "news.gmane.org"))
;; (setq imap-shell-program "/usr/lib/dovecot/imap -c ~/.dovecotrc")
;; (setq gnus-select-method '(nnimap "Mail"
;;                                   (nnimap-stream shell)))

                                      ;; (nntp  "news.gmane.org")
                                      ;; (nnimap "Mail"
                                      ;;         (nnimap-address "localhost.localdomain.com")
                                      ;;         (nnimap-server-port 143)
                                      ;;         (nnimap-stream network)
                                      ;;         (nnimap-authenticator login))
                                              ;; (nnimap-stream shell)
                                              ;; (imap-shell-program "/usr/lib/dovecot/imap -c ~/.dovecotrc"))


;; (add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
;;                                                      (nnimap-stream shell)
;;                                                      (imap-shell-program "/usr/lib/dovecot/imap -c ~/.dovecotrc")))

;; (add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
;;                                                      (nnimap-address "localhost")
;;                                                      (nnimap-server-port 143)
;;                                                      (nnimap-stream network)
;;                                                      (nnimap-authenticator login)))

