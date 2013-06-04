(load-file "~/.emacs.d/common.el")
(if (eq system-type 'gnu/linux)
    (progn
      (load-file "~/.emacs.d/.emacs/vf-linux.el"))
  (progn
    (load-file "~/.emacs.d/.emacs_windows.el")))
