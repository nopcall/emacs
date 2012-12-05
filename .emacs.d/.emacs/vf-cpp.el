(add-hook 'c-mode-hook 'linux-ccc)
(add-hook 'c++-mode-hook 'linux-ccc)
;; both c and cpp
(defun linux-ccc ()
  (interactive)
  (define-key c-mode-map (kbd "C-;")  'v-c-comment-currentline)
  (define-key c-mode-map [return] 'newline-and-indent)
  (define-key c-mode-map (kbd "<f7>") 'smart-compile)
  (define-key c-mode-map (kbd "<f5>") 'gdb)
  (define-key c++-mode-map (kbd "C-;")  'v-c-comment-currentline)
  (define-key c++-mode-map [return] 'newline-and-indent)
  (define-key c++-mode-map (kbd "<f7>") 'smart-compile)
  (define-key c++-mode-map (kbd "<f5>") 'gdb)
  ;; 在菜单中加入当前Buffer的函数索引
  (imenu-add-menubar-index)
  ;; 在状态条上显示当前光标在哪个函数体内部
  (which-function-mode)
  ;; TAB键的宽度设置为4
  (setq c-basic-offset 4)
  ;; 设置C程序的对齐风格
  (c-set-style "K&R")
  ;; 输入;时自动添加新行 C-c C-a
  ;; (c-toggle-auto-newline 1)
  ;; M-f移动时将HelloWorld看成两个单词 C-c C-w
  (subword-mode 1)
  ;; hungry-delete
  (c-toggle-hungry-state 1)
  )
;; 注释当前行 c++
(defun v-c-comment-currentline ()
  (interactive)
  (move-beginning-of-line 1)
  (insert "// "))
;;智能编译
(defun smart-compile()
  ;;  "比较智能的C/C++编译命令,如果当前目录有makefile则用make -k编译，否则，如果是
  ;;处于c-mode，就用gcc -Wall编译，如果是c++-mode就用g++ -Wall编译"
  (interactive)
  ;; 查找 Makefile
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
        (command nil))
    (if (not (null
              (find t candidate-make-file-name :key
                    '(lambda (f) (file-readable-p f)))))
        (setq command "mingw32-make.exe -k ")
      ;; 没有找到 Makefile ，查看当前 mode 是否是已知的可编译的模式
      (if (null (buffer-file-name (current-buffer)))
          (message "Buffer not attached to a file, won't compile!")
        (if (eq major-mode 'c-mode)
            (setq command
                  (concat "gcc -g -Wall -o "
                          (file-name-sans-extension
                           (file-name-nondirectory buffer-file-name))
                          " "
                          (file-name-nondirectory buffer-file-name)
                          ;;               " -lm "
                          ))
          (if (eq major-mode 'c++-mode)
              (setq command
                    (concat "g++ -std=c++0x -g -Wall -o "
                            (file-name-sans-extension
                             (file-name-nondirectory buffer-file-name))
                            " "
                            (file-name-nondirectory buffer-file-name)
                            ;;             " -lm "
                            ))))))
    (if (not (null command))
        (let ((command (read-from-minibuffer "Compile command: " command)))
          (compile command)))))
;shell,gdb退出后，自动关闭该buffer
(add-hook 'shell-mode-hook 'mode-hook-func)
(add-hook 'gdb-mode-hook 'mode-hook-func)
(defun mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
                        #'kill-buffer-on-exit))
(defun kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

(provide 'vf-cpp)
