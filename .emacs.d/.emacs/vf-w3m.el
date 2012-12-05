(add-to-list 'load-path "~/.emacs.d/emacs-w3m")
(require 'w3m-load)
;; (require 'mime-w3m)
(setq mm-text-html-renderer 'w3m)
(setq w3m-default-display-inline-images t)
(setq w3m-default-save-directory "~/.emacs.d/w3m/")
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
;; ;;Enable Cookies
;; (setq w3m-use-cookies t)
;; ;;Follow links in W3M
;; (setq browse-url-browser-function 'w3m-browse-urlbrowse-url-new-window-flag t)
;; (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; ;; (global-set-key "\C-xm" 'browse-url-at-point)
;; (autoload 'browse-url-interactive-arg "browse-url")
;; ;;Set default download directory
;; (let ((d "~/downloads/"))(setq w3m-default-save-directory(or(and(file-directory-p d)d)w3m-default-directory)))
;; ;;W3M doesn't name buffers very intelligently. Let's fix that:
;; (add-hook 'w3m-display-hook(lambda (url)(rename-buffer(format "*w3m: %s*" (or w3m-current-titlew3m-current-url)) t)))

(provide 'vf-w3m)
