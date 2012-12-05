;; (add-to-list 'load-path "~/.emacs.d/ibus-el-0.2.1")
(require 'ibus)
;; Turn on ibus-mode automatically after loading .emacs
(add-hook 'after-init-hook 'ibus-mode-on)
;; ;; Use C-SPC for Set Mark command
;; (ibus-define-common-key ?\C-\s nil)
;; ;; Use C-/ for Undo command
;; (ibus-define-common-key ?\C-/ nil)
;; ;; Change cursor color depending on IBus status
;; (setq ibus-cursor-color '("red" "blue" "limegreen"))
;; Use s-SPC to toggle input status
(global-set-key (kbd "S-SPC") 'ibus-toggle)

(provide 'vf-ibus)
