(add-hook 'gdb-mode-hook '(lambda ()
                            (define-key c-mode-base-map [f9] 'gud-break)
                            (define-key c-mode-base-map [C-f9] 'gud-remove)
                            (define-key c-mode-base-map [f10] 'gud-next) ;next
                            (define-key c-mode-base-map [f11] 'gud-step) ;step
                            (define-key c-mode-base-map [S-f10] 'gud-until) ;until
                            (define-key c-mode-base-map [C-f11] 'gud-finish) ;jump out of function
                            (define-key c-mode-base-map [C-f5] 'gud-run)     ;run
                            (define-key c-mode-base-map [S-f5] 'gud-cont)    ;continue
                            ))

