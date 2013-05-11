;; Emacs自带的SGML
;; (defun rst--inside-tag-p ()
;;   (save-excursion
;;     (not (null (sgml-get-context)))))
;; (defun rename-sgml-tag ()
;;   (interactive)
;;   (if (not (rst--inside-tag-p))
;;       (error "Place point inside tag to rename."))
;;   (let ((context (car (last (sgml-get-context)))))
;;     (if (looking-at "</")
;;         (setq context (car (last (sgml-get-context)))))
;;     (goto-char (aref context 2))
;;     (let* ((tag-name (aref context 4))
;;            (num-chars (length tag-name))
;;            (master-start (1+ (point)))
;;            (mirror-end (save-excursion
;;                          (sgml-skip-tag-forward 1)
;;                          (1- (point)))))
;;       (forward-char 1)
;;       (set-mark (+ (point) num-chars))
;;       (mm/create-master master-start (+ master-start num-chars))
;;       (mm/add-mirror (- mirror-end num-chars) mirror-end))))

(add-hook 'sgml-mode-hook
         (lambda ()
           (define-key sgml-mode-map "\C-c\C-e" 'sgml-close-tag)
           ;; (define-key sgml-mode-map "\C-c\C-r" 'rename-sgml-tag)
           (define-key sgml-mode-map "\C-\M-a" 'sgml-skip-tag-forward)
           (define-key sgml-mode-map "\C-\M-e" 'sgml-skip-tag-backward)))



