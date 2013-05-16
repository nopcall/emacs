(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp")
(require 'org-contacts)
(setq fan/org-contacts-file-location
      (if (eq system-type 'gnu/linux)
          "~/d/Dropbox/others/org-contacts-file.org"
        "D:/Dropbox/others/org-contacts-file.org"))
(setq org-contacts-files fan/org-contacts-file-location)

(add-to-list 'org-capture-templates
             '("c" "Contacts" entry (file fan/org-contacts-file-location)
               "** %(org-contacts-template-name)
                :PROPERTIES
                :EMAIL: %(org-contacts-template-email)
                :END:"))

