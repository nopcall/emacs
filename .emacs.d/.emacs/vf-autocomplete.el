;; 参考http://blog.csdn.net/winterttr/article/details/7524336
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/auto-complete/auto-complete")
(add-to-list 'load-path "~/.emacs.d/auto-complete/fuzzy-el")

(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/auto-complete/dict")
(ac-config-default)

;; 用来修正显示帮助时位置不正常
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t
;; 显示帮助
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)

;; 设置tab键的使用模式
(setq ac-dwim t)

;; 如果ac-auto-start为nil则表示只有按下触发键后才会补全
(setq ac-auto-start nil)
;; 补全键设置为TAB
(ac-set-trigger-key "TAB")

;; 使用ac时，我发现，并不是所有的按键都能触发ac的自动补全功能的，例如backspace之后，ac的补全就消失了，除非再次输入一个按键。其实，这些是可以由我们控制的，例如：这里将backspace的删除后仍旧可以触发ac补全：
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

;; 就是在你输入错误信息的时候，仍旧采用模糊匹配去给出合理的补全关键字。
(setq ac-fuzzy-enable t)

;; 进入graphviz-dot-mode时启用auto complete
(add-to-list 'ac-modes 'graphviz-dot-mode)

(defun graphviz-dot-mode-setup ()
  (setq ac-sources '(ac-source-yasnippet ac-source-dictionary ac-source-words-in-same-mode-buffers)))
(add-hook 'graphviz-dot-mode-hook 'graphviz-dot-mode-setup)

;; ac-comphist.dat 保存目录（用于保存补全历史记录）
(setq ac-comphist-file "~/.emacs.d/auto-complete")

