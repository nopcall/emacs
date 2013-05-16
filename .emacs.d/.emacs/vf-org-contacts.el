(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp")
(require 'org-contacts)
(setq fan/org-contacts-file-location
      (if (eq system-type 'gnu/linux)
          "/home/visayafan/d/Dropbox/others/contacts.org"
        "D:/Dropbox/others/contacts.org"))
(add-to-list 'org-contacts-files fan/org-contacts-file-location)

(eval-after-load "org-capture"
  '(progn
     (add-to-list 'org-capture-templates
                  '("c" "Contacts" entry (file fan/org-contacts-file-location)
                    "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:"))))

