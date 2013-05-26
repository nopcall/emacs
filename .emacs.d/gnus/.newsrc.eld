;; -*- mode:emacs-lisp; coding: utf-8-emacs; -*-
;; Gnus startup file.
;; Never delete this file -- if you want to force Gnus to read the
;; .newsrc file (if you have one), touch .newsrc instead.
(setq gnus-newsrc-file-version "Gnus v5.13")

(setq gnus-newsrc-last-checked-date '"Sun, 26 May 2013 21:55:13 +0800")

(setq gnus-server-alist '(("archive" nnml "archive" (nnml-directory "~/.emacs.d/gnus/archive") (nnml-active-file "~/.emacs.d/gnus/archive/active") (nnml-get-new-mail nil) (nnml-inhibit-expiry t))))

(setq gnus-killed-list '("nntp+news.gwene.org:gwene" "alt.usage.english" "cn.comp.hardware" "comp.lang.c" "comp.lang.c++" "nntp+news.gmane.org:gmane.comp.lang.c.general" "cn.bbs.comp.emacs" "nntp+news.gmane.org:gmane.editors.lyx.devel" "nntp+news.gmane.org:gmane.emacs.orgmode" "nntp+news.gmane.org:gmane.emacs.cc-mode.general" "nntp+news.gmane.org:gmane.emacs.gnus.general" "nntp+news.gmane.org:gmane.lisp.china" "nntp+news.gmane.org:gmane.lisp.clisp.general" "nntp+news.gmane.org:gmane.lisp.clisp.devel" "nnmaildir:tech" "nnimap+gmail:INBOX" "nnimap+gmail:INBOX" "nnimap+gmail:INBOX" "nnmaildir:inbox" "nnmaildir:spam" "nntp+news.gwene.org:gwene.uk.co.bbc.news.world" "nntp+news.gwene.org:gwene.cn.coolshell" "nntp+news.gwene.org:gwene.uk.co.bbci.news.world" "nntp+news.gwene.org:gwene.com.google.news"))

(setq gnus-zombie-list '("nntp+news.gmane.org:gwene.com.jagodibuja" "nntp+news.gmane.org:gwene.org.yourwildlife" "nntp+news.gmane.org:gwene.com.stratechery" "nntp+news.gmane.org:gwene.com.eveonline.devblogs" "nntp+news.gmane.org:gwene.com.smugtownbeacon.latest-stories" "nntp+news.gmane.org:gmane.comp.sysutils.backup.bareos.user" "nntp+news.gmane.org:gwene.com.udn.udnrss.breakingnews1" "nntp+news.gmane.org:gwene.ru.spb.gov.knvsh.contests" "nntp+news.gmane.org:gwene.com.udn.udnrss.breakingnews6" "nntp+news.gmane.org:gwene.org.aeracode.category.south"))

(setq gnus-topic-topology '(("Gnus" visible) (("MISC" invisible nil nil)) (("C/C++" invisible nil nil)) (("EMACS" invisible nil nil)) (("LISP" invisible nil nil)) (("EMAIL" invisible nil nil))))

(setq gnus-topic-alist '(("EMAIL" "nnml+archive:mail-2013") ("LISP") ("EMACS") ("C/C++") ("MISC" "nndraft:drafts" "nnml+archive:news-2013") ("Gnus" "nnmaildir:junk")))
