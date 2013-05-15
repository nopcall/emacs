(add-to-list 'load-path "~/.emacs.d/bbdb3/lisp")
(add-to-list 'load-path "~/.emacs.d/others")
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(setq bbdb-north-american-phone-numbers-p nil)

(setq bbdb-file
      (if (eq system-type 'gnu/linux)
          "~/d/Dropbox/others/emacs_bbdb_contacts"
        "d:/Dropbox/others/emacs_bbdb_contacts"))
      
