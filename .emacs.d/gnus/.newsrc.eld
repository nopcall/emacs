;; -*- mode:emacs-lisp; coding: utf-8-emacs; -*-
;; Gnus startup file.
;; Never delete this file -- if you want to force Gnus to read the
;; .newsrc file (if you have one), touch .newsrc instead.
(setq gnus-newsrc-file-version "Gnus v5.13")

(setq gnus-newsrc-last-checked-date '"Wed, 15 May 2013 11:00:35 +0800")

(setq gnus-newsrc-alist '(("comp.lang.c" 3 nil) ("comp.lang.c++" 3 nil) ("nntp+news.gmane.org:gmane.emacs.orgmode" 3 ((72066 . 72067)) ((seen (72071 . 72170)) (cache 72080 72135)) "nntp:news.gmane.org") ("nntp+news.gmane.org:gmane.comp.lang.c.general" 3 nil nil "nntp:news.gmane.org") ("nnml+archive:news-2013" 3 nil nil (nnml "archive" (nnml-directory "~/.emacs.d/gnus/archive") (nnml-active-file "~/.emacs.d/gnus/archive/active") (nnml-get-new-mail nil) (nnml-inhibit-expiry t))) ("nndraft:drafts" 1 nil nil (nndraft "") ((gnus-dummy (gnus-draft-mode))))))

(setq gnus-server-alist '(("archive" nnml "archive" (nnml-directory "~/.emacs.d/gnus/archive") (nnml-active-file "~/.emacs.d/gnus/archive/active") (nnml-get-new-mail nil) (nnml-inhibit-expiry t))))

(setq gnus-killed-list '("nntp+news.gwene.org:gwene.uk.co.bbc.news.world" "nntp+news.gwene.org:gwene.cn.coolshell" "nntp+news.gwene.org:gwene.uk.co.bbci.news.world" "nntp+news.gwene.org:gwene.com.google.news"))
