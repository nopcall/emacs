(load-file "~/.emacs.d/common.el")
(if (eq system-type 'gnu/linux)
    (progn
      (load-file "~/.emacs.d/.emacs/vf-linux.el"))
  (progn
    (load-file "~/.emacs.d/.emacs_windows.el")))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "文泉驿等宽微米黑"))))
 '(ac-yasnippet-candidate-face ((t (:background "sandybrown" :foreground "dark green"))))
 '(dired-marked ((t nil)))
 '(minimap-font-face ((default (:height 20 :family "DejaVu Sans Mono")) (nil (:height 1.0))))
 '(minimap-semantic-function-face ((t (:inherit (font-lock-function-name-face minimap-font-face) :background "gray90" :box (:line-width 1 :color "black") :height 3.5))))
 '(minimap-semantic-type-face ((t (:inherit (font-lock-function-name-face minimap-font-face) :background "gray90" :box (:line-width 1 :color "black") :height 3.5))))
 '(minimap-semantic-variable-face ((t (:inherit (font-lock-function-name-face minimap-font-face) :background "gray90" :box (:line-width 1 :color "black") :height 3.5))))
 '(region ((t (:background "gtk_selection_bg_color" :foreground "gtk_selection_fg_color"))))
 '(tabbar-selected-face ((t (:inherit tabbar-default-face :background "#102e4e" :foreground "green" :box (:line-width 2 :color "#102e4e" :style released-button)))))
 '(tabbar-unselected-face ((t (:inherit tabbar-default-face :foreground "#102e4e" :box (:line-width 2 :color "white" :style pressed-button)))))
 )
