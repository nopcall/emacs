;;���ļ�ר��Ϊ����windows

;; win7��ʹ��windowspages������������ʱ��Ҫ�õ��˿�ݼ������Խ�ֹ
(global-unset-key [(control meta right)])
(global-unset-key [(control meta left)])

;; (setq browse-url-browser-function 'browse-url-generic-program)
(setq browse-url-generic-program (executable-find "chrome.exe"))

;; gnupg
(custom-set-variables 
   '(epa-file-name-regexp "\\.gpg\\(~\\|\\.~[0-9]+~\\)?\\'") 
   '(epg-gpg-program "c:/Program Files/GNU/GnuPG/pub/gpg2.exe")) 

;; ���Խ��win7�����ٶ�
(setq w32-get-true-file-attributes nil)
;; (server-start)

;; ��PATH��exec-path������ⲿ����·������
(defun vf-add-to-exec-path (path)
  " �ο���http://blog.csdn.net/winterttr/article/details/7273283"
  (setenv "PATH" (concat (expand-file-name path)
                         path-separator
                         (getenv "PATH")))
  (setq exec-path
        (cons (expand-file-name path)
              exec-path)))
(mapc #'vf-add-to-exec-path
      (reverse
       '("C:/Program Files/Git/bin"
         "D:/VFInstall/SBCL"
         )))
;; ���win��ѡ�������ǰ��ɫ
(custom-set-faces
 '(region ((t (:background "yellow" :foreground "blue")))))

(setq warning-minimum-level :error)
;(setq temp-buffer-show-function (function ignore)) 
(setq byte-compile-warnings nil)
;; eshell�����ļ�
(setq eshell-aliases-file "~/.emacs.d/eshell/alias-win32")

;; ���shell���� 
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(load-file "~/.emacs.d/.emacs/vf-font.el")

(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(prefer-coding-system 'gbk)
