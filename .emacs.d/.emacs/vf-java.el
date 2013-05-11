;; Set the debug option to enable a backtrace when a  
;; problem occurs.  
;; 当有问题出现显示错误信息，便于调试  
(setq debug-on-error t)  
;; Update the Emacs load-path to include the path to  
;; the JDE and its require packages. This code assumes  
;; that you have installed the packages in the emacs/site  
;; subdirectory of your home directory.  
;; 加载所需的package  
(add-to-list 'load-path (expand-file-name "~/.emacs.d/javaIDE/jdee-2.4.0.1/lisp"))  
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet-1.0pre7/semantic"))  
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet-1.0pre7/speedbar"))  
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet-1.0pre7/eieio"))  
(add-to-list 'load-path (expand-file-name "~/.emacs.d/javaIDE/elib-1.0"))  
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet-1.0pre7/common"))  
;; If you want Emacs to defer loading the JDE until you open a  
;; Java file, edit the following line  
;; 不自动加载jde-mode  
(setq defer-loading-jde t)  
;; to read:  
;;  (setq defer-loading-jde t)  
;; 编辑.java文件时加载jde  
(if defer-loading-jde  
    (progn  
      (autoload 'jde-mode "jde" "JDE mode." t)  
      (setq auto-mode-alist  
            (append  
             '(("\\.java\\'" . jde-mode))  
             auto-mode-alist)))  
;; 设置局部快捷键
  (require 'jde))

(define-prefix-command 'ctl-c-ctl-v-map)
(global-set-key (kbd "C-c C-v") 'ctl-c-ctl-v-map)
(global-set-key (kbd "C-c C-v g m") 'jde-gen-main-method)
(global-set-key (kbd "C-c C-v g p") 'jde-gen-println)
(global-set-key (kbd "C-c C-v g C") 'jde-gen-class)
(global-set-key (kbd "C-c C-v g c") 'jde-gen-inner-class)
(global-set-key (kbd "C-c C-v g a l") 'jde-gen-action-listener)
(global-set-key (kbd "C-c C-v g w l") 'jde-gen-window-listener)

                      ;