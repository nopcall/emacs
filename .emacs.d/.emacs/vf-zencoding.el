(add-to-list 'load-path "~/.emacs.d/zencoding")
(require 'zencoding-mode)
(global-set-key [(super z)] 'zencoding-expand-line)
(global-set-key [(super c)] 'zencoding-preview-abort)
