;; ido makes competing buffers and finding files easier
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(require 'ido) 
(ido-mode 'both) ;; for buffers and files
(setq 
 ido-save-directory-list-file "~/.emacs.d/ido/ido.last"

 ;; ido-ignore-buffers ;; ignore these guys
 ;; '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
 ;; ido-work-directory-list '("~/" "~/study" "~/visayafan.github.com")
 ido-case-fold  t                 ; be case-insensitive
 ido-enable-last-directory-history t ; remember last used dirs
 ido-max-work-directory-list 30   ; should be enough
 ido-max-work-file-list      50   ; remember many
 ido-use-filename-at-point nil    ; don't use filename at point (annoying)
 ido-use-url-at-point nil         ; don't use url at point (annoying)

 ido-enable-flex-matching nil     ; don't try to be too smart
 ido-max-prospects 8              ; don't spam my minibuffer
 ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; use M-k to kill-buffer rather than C-x k
(global-unset-key (kbd "C-x k"))
(global-set-key (kbd "M-k") 'ido-kill-buffer)
;; use M-s to switch between buffer rather than the default C-x b
;; (global-unset-key (kbd "C-x b"))
;; (global-set-key (kbd "M-q") 'ido-switch-buffer)

(global-set-key (kbd "M-s") 'ido-switch-buffer)


