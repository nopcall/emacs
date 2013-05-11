(add-to-list 'load-path "~/.emacs.d/minimap")
(require 'minimap)
(setq minimap-hide-scroll-bar nil)
(setq minimap-update-delay 0.5)
(setq minimap-width-fraction 0.2)
(global-set-key "\C-cmm" 'minimap-create)
(global-set-key "\C-cmk" 'minimap-kill)
