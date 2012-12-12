;; -*- mode:emacs-lisp; coding: utf-8-emacs; -*-
;; Gnus startup file.
;; Never delete this file -- if you want to force Gnus to read the
;; .newsrc file (if you have one), touch .newsrc instead.
(setq gnus-newsrc-file-version "Gnus v5.13")

(setq gnus-newsrc-last-checked-date '"Wed, 12 Dec 2012 23:34:20 +0800")

(setq gnus-newsrc-alist '(("nndraft:drafts" 1 nil nil (nndraft "") ((gnus-dummy (gnus-draft-mode)))) ("comp.lang.c" 3 ((1 . 105263) 105276 105340 105343 105345 (105347 . 105348) 105352 105357 105367 (105373 . 105374) 105376 (105384 . 105389) (105391 . 105394) (105396 . 105399) (105401 . 105402) 105423 (105425 . 105428) (105431 . 105434) (105436 . 105437) 105442 105456 105458 105461 105471 105473 105480 105483 (105490 . 105491) (105494 . 105495) (105497 . 105500) 105503 105505 (105509 . 105511) (105513 . 105514) 105518 (105526 . 105536) 105538 105540 105542 (105544 . 105547) 105549 (105552 . 105553) (105555 . 105559) (105569 . 105571) 105581 105592 105612 105615 105662 105676 105764 105766 (105771 . 105772) 105777 105785 (105791 . 105792) (105796 . 105797) 105799 105804 (105806 . 105808) (105810 . 105812) 105818 (105832 . 105839) (105842 . 105844) (105846 . 105847) (105849 . 105850) 105852 105854 105856 (105865 . 105866) 105878 105880 106151 106289 106297)) ("comp.lang.lisp" 3 ((1 . 41418) (47440 . 47444) 47447 47455 (47460 . 47461) (47464 . 47465) 47497 47656)) ("comp.emacs" 3 nil) ("comp.lang.c++.moderated" 3 ((1 . 18710) 18714 18716 (18719 . 18720) 18728 18731 18735) ((seen (18711 . 19016)) (cache 18734))) ("comp.lang.python" 3 nil) ("comp.lang.c++" 3 ((1 . 67440)) ((seen (66602 . 66919) (66923 . 66995) (66997 . 67015) (67019 . 67122) (67124 . 67442)) (dormant 66814))) ("alt.os.linux.ubuntu" 3 ((1 . 108338)) ((seen (108338 . 111963)))) ("alt.jokes" 3 nil) ("alt.music" 3 nil)))

(setq gnus-server-alist '(("archive" nnfolder "archive" (nnfolder-directory "~/Mail/archive") (nnfolder-active-file "~/Mail/archive/active") (nnfolder-get-new-mail nil) (nnfolder-inhibit-expiry t))))

(setq gnus-killed-list '("nntp+news.aioe.org:comp.lang.c++" "nntp+news.aioe.org:comp.lang.lisp" "nntp+news.aioe.org:comp.lang.c.moderated" "nntp+news.aioe.org:comp.lang.c" "nntp+news.aioe.org:comp.lang.python" "nntp+news.aioe.org:comp.emacs" "nnrss:CoolShell.cn" "nnrss:\277\341\277\307 - CoolShell.cn"))

(setq gnus-zombie-list '("nntp+news.gmane.org:gwene.org.sciencefiles"))
