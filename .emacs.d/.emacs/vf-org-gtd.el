(setq org-log-done 'time)               ;;; 当被标记DONE时记录下时间
;; 当所有子项目都标记为Done的时候，父项目也被标记为Done
(defun org-summary-todo (n-done n-not-done)
  (let (org-log-done org-log-states)   ; turn off logging.
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
;; 分组切换 C-S-right/left 
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "BUG(b)" "|" "FIXED(f)")))
(setq org-tag-alist '(("Read" . ?r)
                      ("C/CC" . ?c)
                      ("Python" . ?p)
                      ("Lisp" . ?l)
                      ("English" . ?e)
                      ))
