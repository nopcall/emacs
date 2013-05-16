;; 此模式可以被org-contacts替代
(add-to-list 'load-path "~/.emacs.d/bbdb/lisp")
(require 'bbdb-loaddefs)
(require 'bbdb)
(setq bbdb-file
      (if (eq system-type 'gnu/linux)
          "~/d/Dropbox/others/emacs_bbdb_contacts"
        "d:/Dropbox/others/emacs_bbdb_contacts"))
;; initialization
(bbdb-initialize 'gnus 'message)
(bbdb-mua-auto-update-init 'gnus 'message)
;; size of the bbdb popup
(setq bbdb-pop-up-window-size 10)
;; What do we do when invoking bbdb interactively
(setq bbdb-mua-update-interactive-p '(query . create))
;; Make sure we look at every address in a message and not only the
;; first one
(setq bbdb-message-all-addresses t)
;; use ; on a message to invoke bbdb interactively
(add-hook 'gnus-summary-mode-hook
          (lambda ()
            (define-key gnus-summary-mode-map (kbd ";") 'bbdb-mua-edit-field)))
(setq bbdb-file-coding-system 'chinese-big5)
