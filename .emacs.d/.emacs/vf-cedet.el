(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")    
;; (load-file "~/.emacs.d/cedet-bzr/cedet-devel-load.el")
;; ;; 各个mode的功能见：http://emacser.com/cedet.htm
;; (semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; 打开这个mode后，semantic会在类/函数等tag上方加一条蓝色的线，源文件很大的时候用它可以提示出哪些是类和函数的头。
(global-semantic-decoration-mode)
;; 这个mode打开后，光标在某处停留一段时间后，semantic会自动提示此处可以补全的内容。
;; (global-semantic-idle-completions-mode)

;; (semantic-load-enable-excessive-code-helpers)
;; (global-semantic-highlight-func-mode)

(semantic-load-enable-semantic-debugging-helpers)

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
;; windows环境下配置成自己编译器目录
(defconst cedet-win32-include-dirs
  (list "C:/MinGW/include"
        "C:/MinGW/include/c++/3.4.5"
        "C:/MinGW/include/c++/3.4.5/mingw32"
        "C:/MinGW/include/c++/3.4.5/backward"
        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))


;; 跳转 F12
(global-set-key [f12] 'semantic-ia-fast-jump)
;; 跳回 Shift-F12
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;; C-M 代码提示
(define-key c-mode-base-map [(control m)] 'semantic-ia-complete-symbol-menu)


;; Enable source code folding
(global-semantic-tag-folding-mode 1)
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , =") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c . -") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-c . =") 'semantic-tag-folding-show-all)

;; 设置semantic cache临时文件的路径，避免到处都是临时文件
(setq semanticdb-default-save-directory "~/.emacs.d/semantic.cache") 
