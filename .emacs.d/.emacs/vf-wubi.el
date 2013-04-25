(add-to-list 'load-path "~/.emacs.d/wubi")

(require 'wubi)
;; add user's Wubi phrases
(wubi-load-local-phrases)

(register-input-method
 "chinese-wubi" "Chinese-GB" 'quail-use-package
 "WuBi" "WuBi"
 "wubi")

(if (< emacs-major-version 21)
    (setup-chinese-gb-environment)
  (set-language-environment 'Chinese-GB))

;; (setq default-input-method "chinese-wubi")
(setq default-input-method "german")
;; (global-set-key [?\s- ] 'toggle-input-method)
;; (global-set-key [?\S- ] 'toggle-input-method)
(global-set-key [?\C-\\] 'set-input-method)
(provide 'vf-wubi)
