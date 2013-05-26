(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp")
(require 'org-contacts)

(setq linux-win-location
      (if (eq system-type 'gnu/linux)
          "/home/visayafan/d/"
        "D:/"))
(setq fan/org-contacts-file-location
        (concat linux-win-location "Dropbox/others/contacts.org"))
(add-to-list 'org-contacts-files fan/org-contacts-file-location)

(setq fan/capture-notes
      (concat linux-win-location "visayafan.github.com/Others/diary/notes.org"))
(setq fan/english-newowrds
      (concat linux-win-location "visayafan.github.com/English/NewWords/NewWords04.org"))
(eval-after-load "org-capture"
  '(progn
     (setq org-capture-templates
                  '(
                    ("c" "CONTACTS" entry (file fan/org-contacts-file-location)
                     "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:")
                    ("n" "NOTES" entry (file+datetree fan/capture-notes)
                     "* %^{DESCRIPTION} %^g
     Added: %U %?")
                    ("s" "SITES" entry (file+headline fan/capture-notes "网址收藏")
                     "* %^{DESCRIPTION} %^g
   Added: %U %?")
                    ("e" "ENGLISH" entry (file fan/english-newowrds)
                     "* %^{New Word:}
  %?")
                    ))))

