(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
;; (yas/initialize)
(yas-global-mode 1)

(setq yas-prompt-functions (quote (yas/dropdown-prompt yas/completing-prompt yas/ido-prompt yas/x-prompt yas-dropdown-prompt yas/no-prompt)))
(setq yas-snippet-dirs '("~/.emacs.d/yasnippet/snippets"))
(setq yas-trigger-key "<tab>")


