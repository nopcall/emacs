;; 当被标记DONE时记录下时间
(setq org-log-done 'time)

(defun org-summary-todo (n-done n-not-done)
  ;; 当所有子项目都标记为Done的时候，父项目也被标记为Done
  (let (org-log-done org-log-states)   ; turn off logging.
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(setq org-todo-keywords
      ;; 分组切换 C-S-right/left 
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "BUG(b)" "|" "FIXED(f)")))

(setq org-tag-alist '(("Read" . ?r)
                      ("C/CC" . ?c)
                      ("Python" . ?p)
                      ("Lisp" . ?l)
                      ("English" . ?e)
                      ))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))
; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;;(require 'calendar)
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)
(setq mark-diary-entries-in-calendar t)
(setq mark-holidays-in-calendar nil)
(setq view-calendar-holidays-initially nil)
(defadvice exit-calendar (before my-advice-close-diary ())
  "save and close the _diary buffer to avoid open it when
starting emacs next time."
  (let ((bf (find-file-noselect diary-file t)))
    (and bf
         (save-excursion
           (with-current-buffer bf (save-buffer) (kill-buffer nil))))))
(ad-activate 'exit-calendar)
;;I don't care these holidays
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq org-export-html-validation-link nil)
(provide 'vf-org-gtd)
