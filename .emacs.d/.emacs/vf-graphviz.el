(add-to-list 'load-path "~/.emacs.d/others")

(autoload 'graphviz-dot-mode "graphviz-dot-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))
(setq graphviz-dot-auto-indent-on-newline nil)

