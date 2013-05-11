(add-to-list 'load-path "~/.emacs.d/wubi")

(require 'wubi)
;; add user's Wubi phrases
(wubi-load-local-phrases)

(setq wubi-phrases-file "~/.emacs.d/wubi/wubi-phrases.txt")
(setq wubi-phrases-file-el "~/.emacs.d/wubi/.wubi-phrases.el")

(register-input-method "chinese-wubi" "Chinese-GB" 'quail-use-package "WuBi" "WuBi" "wubi")

(if (< emacs-major-version 21)
    (setup-chinese-gb-environment)
  (set-language-environment 'Chinese-GB))
