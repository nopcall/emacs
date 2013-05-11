;;;;ECB
(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(require 'ecb)
(setq ecb-layout-window-sizes nil)
(setq ecb-options-version "2.40")
(setq ecb-tip-of-the-day nil)
;; (require 'ecb-autoloads)
(setq stack-trace-on-error nil)
;; (ecb-activate)
;; (ecb-byte-compile)

(global-set-key [f9] 'ecb-activate)
(global-set-key [C-f9] 'ecb-deactivate)
;; 各窗口间切换      
(global-set-key [M-left] 'windmove-left)      
(global-set-key [M-right] 'windmove-right)      
(global-set-key [M-up] 'windmove-up)      
(global-set-key [M-down] 'windmove-down)      

;; 设置ECB窗口的宽度
(setq ecb-windows-width 0.25)
(setq ecb-compile-window-height 0.4)

(add-hook 'ecb-activate-hook 'vf-show-method-window-only)
;; ECB开启后只显示一个最大化的method窗口
(defun vf-show-method-window-only ()
  (ecb-maximize-window-methods))


