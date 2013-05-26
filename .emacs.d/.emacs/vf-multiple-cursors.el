(add-to-list 'load-path "~/.emacs.d/multiple-cursors")
(require 'multiple-cursors)
;; 保存.mc-list.el的位置（用于保存用户使用习惯的配置文件)
(setq mc/list-file "~/.emacs.d/.mc-lists.el")
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-S-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C->") 'mc/mark-all-in-region)

