(org-remember-insinuate)

(setq org-default-notes-file  "~/d/todo.org")
(define-key global-map [S-M-f12] 'org-remember)

(setq org-remember-templates
      '(("todo" ?t "* TODO %^{to do what(briefly)} \n %?" "~/d/todo.org" "todo")
        ("idea" ?i "* TODO %^{what's your idea (briefly)} \n %?" "~/d/todo.org" "idea")
        ("to read" ?a "* TODO %^{name of the article}\n %?" "~/d/todo.org" "to read")
        ("movie" ?m "* TODO %^{movie name}\n %?" "~/d/todo.org" "movie")
        ("english" ?e "* %^{enter the word or phrase}\n %?" "~/d/todo.org" "english")
        ("sites" ?s "* %^{name of the site}\n %?" "~/d/todo.org" "sites")
        ))

(provide 'vf-org-remember)
