(org-remember-insinuate)

(setq org-default-notes-file  "~/.emacs.d/GDT/.notes.org")
(define-key global-map [M-f12] 'org-remember)
(setq org-remember-templates
      '(("TODO" ?t "* TODOS %^{TO DO What(Briefly)} \n %?" "~/.emacs.d/GDT/.notes.org" "TODO")
	("IDEA" ?i "* TODO %^{What's your IDEA (Briefly)} \n %?" "~/.emacs.d/GDT/.notes.org" "IDEA")
	("MOVIE" ?m "* TODO %^{Enter the Movie Name}\n %?" "~/.emacs.d/GDT/.notes.org" "MOVIE")
    ("SITES" ?s "* %^{Enter the Name of the Site}\n %?" "~/.emacs.d/GDT/.notes.org" "SITES")
    ("BlogToPublish" ?b "* %^{Enter the Name of the Blog}\n %a %?" "~/.emacs.d/GDT/.notes.org" "BlogToPublish")
    ("Articles to Read" ?a "* TODO %^{Enter the Name of the Article}\n %?" "~/.emacs.d/GDT/.notes.org" "Articles to Read")
    ("Command" ?c "* %^{Enter the Name of the Command}\n %?" "~/.emacs.d/GDT/.notes.org" "Linux Command")
    ("English" ?e "* %^{Enter the word or phrase}\n %?" "~/.emacs.d/GDT/.notes.org" "English")
    ("DIARY" ?d "* %T\n %?" "~/.diary.org")
	))

(provide 'vf-org-remember)