(add-to-list 'load-path "~/.emacs.d/matlab-emacs/matlab-emacs")
(require 'matlab-load)
(setq matlab-shell-command "/usr/local/MATLAB/R2010b/bin/matlab")
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
;; turn off auto-verify on save
(setq matlab-verify-on-save-flag nil)
(defun my-matlab-mode-hook ()
  (setq fill-column 76))		; where auto-fill should wrap
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(global-font-lock-mode t)
;; (matlab-mode-hilit)
(autoload 'tlc-mode "tlc" "tlc Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.tlc$" . tlc-mode))
(setq tlc-indent-function t)

(add-hook 'matlab-mode-hook
          '(lambda ()
             (define-key matlab-mode-map (kbd "M-s") 'ido-switch-buffer)))
