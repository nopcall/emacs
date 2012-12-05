;;;;ECB
(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(require 'ecb)
(setq ecb-tip-o/-the-day nil)
;; (require 'ecb-autoloads)
(setq stack-trace-on-error nil)
;; (ecb-activate)
;; (ecb-byte-compile)

;; (setq stack-trace-on-error t)
;; 隐藏和显示ECB窗口
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
;; 使某一ecb窗口最大化
(define-key global-map "\C-c1" 'ecb-maximize-window-directories)
(define-key global-map "\C-c2" 'ecb-maximize-window-sources)
(define-key global-map "\C-c3" 'ecb-maximize-window-methods)
(define-key global-map "\C-c4" 'ecb-maximize-window-history)
;; 恢复原始窗口布局
(define-key global-map "\C-c0" 'ecb-restore-default-window-sizes)
(global-set-key [f9] 'ecb-activate)
;; 各窗口间切换      
(global-set-key [M-left] 'windmove-left)      
(global-set-key [M-right] 'windmove-right)      
(global-set-key [M-up] 'windmove-up)      
(global-set-key [M-down] 'windmove-down)      

(provide 'vf-ecb)
