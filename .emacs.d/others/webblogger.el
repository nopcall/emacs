;;; weblogger.el - Weblog maintenance via XML-RPC APIs

;; Copyright (C) 2002-2007 Mark A. Hershberger.
;; Inspired by code Copyright (C) 2001 by Simon Kittle.
;; Parts Copyright (C) 2007 Wickersheimer Jeremy.
;; Parts Copyright (C) 2009 Gabriel Saldana

;; Author: Mark A. Hershberger <mah@everybody.org>
;; Version: 1.6
;; Created: 2002 Oct 11
;; Keywords: weblog blogger cms movable type openweblog blog
;; URL: http://elisp.info/package/weblogger/

;; This file is not yet part of GNU Emacs.

;; weblogger.el free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; weblogger.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; weblogger.el implements the Blogger, MetaWeblog, Movable Type, and
;; LiveJournal APIs to talk to server-side weblog software.
;;
;;; Starting Out:
;;
;; If you don't yet have a weblog, you can set one up for free on
;; various services.  (I suggest OpenWeblog.com, but then I run that
;; site :) )
;;
;; To set up your profile:
;;
;;    M-x weblogger-setup-weblog RET
;; You will be prompted for some information.  You can save this setup
;; using M-x customize-save-customized. *** FIXME: Make sure this works!

;; *** FIXME This section is complete fantasy at the moment.
;; ;; If you already have a weblog, and your weblog supports RSD
;; ;; (http://archipelago.phrasewise.com/rsd), you can use
;; ;;
;; ;;    M-x weblogger-discover-server RET url RET
;; ;;
;; ;; where url is the URL of your weblog.  This will set up a
;; ;; ~/.webloggerrc file for you if you let it.

;; You can also set up your server information using
;;
;;    M-x customize-group RET weblogger RET
;;
;;; Keymaps:
;;
;; I use the following commands in my .emacs file:
;;
;; (load-file "weblogger.el")
;; (global-set-key "\C-cbs" 'weblogger-start-entry)
;;
;; C-c b s will then switch to a new buffer where you can compose a
;; entry.
;;
;; C-x C-s    -- post-and-publish current buffer to the weblog.
;;               Calling weblogger-publish-entry with an prefix argument
;;               (i.e. C-u C-x C-s) will prompt for which weblog
;;               to use.
;;
;; C-c C-c    -- save as draft and bury the buffer.
;;
;; C-c C-n    -- post (but not publish) the current entry and
;;               load the next entry.
;;
;; C-c C-p    -- post (but not publish) the current entry and
;;               load the previous entry.
;;
;; C-c C-k    -- delete the current entry.
;;
;; M-g        -- synchronise weblogger.el's idea of the entries available
;;               with the weblog server.
;;
;; C-c C-t m  -- edit the main template.
;;
;; C-c C-t a  -- edit the Archive Index template
;;
;; C-c C-s s  -- Change the server being used.
;;
;; C-c C-s w  -- Change the weblog.
;;
;; C-c C-s u  -- Change the user (re-login).
;;
;;
;; Notes:
;; ----
;;
;; This code was originally based on Simon Kittle's blogger.el
;; (http://www.tswoam.co.uk/files/blogger.el.txt), but where his
;; code calls a Perl program, this code uses xml-rpc.el.  You can
;; get xml-rpc.el from <http://elisp.info/package/xml-rpc/>
;;
;; Differences between SK's blogger.el and weblogger.el
;;
;; - Doesn't need any external programs.  Uses xml-rpc.el.
;; - I've added a bunch of defcustom's here to make this integrate
;;   better with Emacs Customization interface. 
;; - Created a *weblogger-entry* mode.
;; - Made selection of a weblog more intuitive.  It queries the
;;   server and allows the user to choose the name of the
;;   weblog from a list.
;; - Prompt for weblog on initial entry if weblogger-id isn't set.
;; - Can "ping" http://weblogs.com/ and http://blo.gs/ whenever
;;   you update.
;; - Can "scroll" through entries on the weblog server and edit them.
;; - Many other features.
;;
;;  TODO:
;;  * Categories [done for metaWebBlog]
;;  * RSD
;;  * Weblog creation using OpenWeblog.com
;;  * Menus
;;  * Toolbar
;;
;; Bugs/Features:
;;
;;  * When you delete a entry it gets deleted, but it doesn't
;;    disappear from your entry ring until you sync (M-g) with the
;;    server.  But this could be construed as a (mis)feature.
;;  * If the server isn't reachable, (weblogger-determine-capabilities)
;;    will get the wrong information.
;;  * Changed titles aren't put in the weblogger post ring.

(require 'xml-rpc)
(require 'message)
(require 'ring)

(defgroup weblogger nil
  "Edit Weblogs with Emacs."
  :group 'emacs)

(defvar weblogger-blogger-app-key "07C72E6970E0FBA5DE21BA9F4800C44534C19870"
  "The appkey to send to weblog server.  Generally this shouldn't be changed.")

(defcustom weblogger-server-username nil
  "Your weblog server username.  You will be prompted if this is left nil."
  :group 'weblogger
  :type 'string)

(defcustom weblogger-server-password nil
  "Your password.  You will be prompted if this is left nil."
  :group 'weblogger
  :type 'string)

(defcustom weblogger-server-url "http://www.openweblog.com/xmlrpc/"
 "Server you want to use.  If this is an OpenWeblog.com site, leave this
at the default.  Otherwise, you will need to change it."
  :group 'weblogger
  :type 'string)

(defcustom weblogger-weblog-id nil
  "Your weblog ID.  For many weblog servers, you can leave this
nil and weblogger.el will prompt you for the weblog.  If it is a
Manila site, you need to provide the URL of your site."
  :group 'weblogger
  :type 'string)

(defcustom weblogger-max-entries-in-ring 20
  "Maximum number of entries that will be retrieved from the
server.  There may be a server-side limitation to this number."
  :group 'weblogger
  :type 'integer)

(defcustom weblogger-ping-urls '("http://rpc.weblogs.com/RPC2")
  "List of URLs to ping using the XML-RPC interface defined at 
<http://www.xmlrpc.com/weblogsCom>."
  :group 'weblogger
  :type 'list)

(defcustom weblogger-save-password nil
  "Whether to save to the password or not."
  :group 'weblogger
  :type 'boolean)

(defcustom weblogger-config-alist ()
  "Alist of possible configurations."
  :group 'weblogger
  :type '(alist :key-type 'string :value-type 'alist))

(defcustom weblogger-blogger-firstline-title nil
  "Look for the title in the first line surrounded by <title> tags when using the Blogger API."
  :group 'weblogger
  :type 'boolean)

(defvar weblogger-config-name "default"
  "Name of  the default configuration.")

(defvar weblogger-entry-list nil
  "List of weblog entries that we know about. Chronological
order, with newest first.")

(defvar weblogger-category-list nil
  "List of categories that we know about.")

(defvar weblogger-tag-list nil
  "List of tags that we know about.")

(defvar weblogger-server-userid nil
  "Server-side ID of logged in user.")

(defvar *weblogger-entry* nil
  "The buffer where we compose entries")

(defvar weblogger-entry-mode-hook nil
  "Hook to run after starting up weblogger mode.")

(defvar weblogger-start-edit-entry-hook
  (lambda ()
    (message-goto-body)
    (replace-string "\r" "" nil (point) (point-max)))
  "Hook to run after loading an entry in buffer for editting.")

(defvar weblogger-new-entry-hook '(weblogger-ping-weblogs)
  "Hook to run after sending a new entry.  Typically, this is
where you would put weblogger-ping-weblogs to let weblog
aggregators know that you have updated.")

(defvar weblogger-edit-entry-hook nil
  "Hook to run after updating an entry.")

(defvar weblogger-entry-mode-map nil
  "Keymap for weblogger-entry-mode.")

(defvar weblogger-template-mode-map nil
  "Keymap for weblogger-template-mode.")

(defvar weblogger-entry-ring nil
  "Ring that holds all the entries.")

(defvar weblogger-category-ring nil
  "Ring that holds all the categories.")

(defvar weblogger-tag-ring nil
  "Ring that holds all the tags.")

(defvar weblogger-ring-index 0
  "Pointer to the index on the ring")

(defconst weblogger-no-capabilities '(("blogger.newPost" . nil)
				      ("blogger.getPost" . nil)
				      ("blogger.editPost" . nil)
				      ("blogger.getRecentPosts" . nil)
				      ("blogger.getUsersBlogs" . nil)
				      ("blogger.getUserInfo" . nil)
				      ("blogger.deletePost" . nil)
				      ("blogger.getTemplate" . nil)
				      ("blogger.setTemplate" . nil)
				      ("metaWeblog.getPost" . nil)
				      ("metaWeblog.newPost" . nil)
				      ("metaWeblog.editPost" . nil)	
				      ("metaWeblog.newMediaObject" . nil)	
				      ("metaWeblog.getRecentPosts" . nil)
				      ("metaWeblog.getCategories" . nil)
				      ("metaWeblog.newMediaObject" . nil)
				      ("metaWeblog.deletePost" . nil)
				      ("metaWeblog.getTemplate" . nil)
				      ("metaWeblog.setTemplate" . nil)
				      ("metaWeblog.getUsersBlogs" . nil)
				      ("mt.getCategoryList" . nil)
				      ("mt.getRecentPostTitles" . nil)
				      ("mt.setPostCategories" . nil)
				      ("mt.getPostCategories" . nil)
				      ("mt.getTrackbackPings" . nil)
				      ("mt.supportedMethods" . nil)
				      ("mt.publishPost" . nil)
				      ("mt.supportedTextFilters" . nil)))

(defvar weblogger-capabilities weblogger-no-capabilities
  "Known capabilities of the remote host")

(defvar weblogger-default-title ""
  "The Default title to use when making an entry.  This is added
if your weblog server supports titles on entries but you haven't
set one.  Set to \"\" for no title.")

(defvar weblogger-default-categories nil
   "The default list of categories when making an entry.  This is
added if your weblog server supports categories on entries but you
haven't set one.  Set to nil for no category.")

(defvar weblogger-default-tags nil
  "The default list of tags when making an entry. This is added if 
your weblog server supports tags on entries but you aven't set one.
Set to nil for no tags.")

(defvar weblogger-api-new-entry nil)
(defvar weblogger-api-send-edits nil)
(defvar weblogger-api-list-entries nil)
(defvar weblogger-api-list-categories nil)

(defvar weblogger-weblog-alist nil
  "Weblogs the user can use on the server.")
(defvar weblogger-texttype-alist nil
  "Texttypes supported by the server.")

(defvar menu-bar-weblogger-menu nil)

(defconst weblogger-version "1.3"
  "Current version of weblogger.el")

(unless weblogger-entry-mode-map
  (setq weblogger-entry-mode-map
    (let ((map (copy-keymap message-mode-map))
	  (server-map (make-sparse-keymap))
	  (template-map (make-sparse-keymap)))
      (define-key map "\C-c\C-c" 'weblogger-send-entry)
      (define-key map "\C-x\C-s" 'weblogger-publish-entry)
      (when (fboundp 'unicode-smart-double-quote)
	(define-key map "\"" 'unicode-smart-double-quote)
	(define-key map "'" 'unicode-smart-single-quote)
	(define-key map "-" 'unicode-smart-hyphen)
	(define-key map "." 'unicode-smart-period))
      (define-key map "\C-c\C-n" 'weblogger-next-entry)
      (define-key map "\C-c\C-p" 'weblogger-prev-entry)
      (define-key map "\C-c\C-k" 'weblogger-delete-entry)
      (define-key map "\M-g"     'weblogger-fetch-entries)
      (define-key template-map "m" 'weblogger-edit-main-template)
      (define-key template-map "a" 'weblogger-edit-archive-template)
      (define-key map "\C-c\C-t" template-map)
      (define-key map "\C-c\C-o" 'weblogger-change-server)
      (define-key map "\C-c\C-w" 'weblogger-change-weblog)
      (define-key map "\C-c\C-u" 'weblogger-change-user)
      map)))

(unless weblogger-template-mode-map
  (setq weblogger-template-mode-map (copy-keymap text-mode-map))
  (define-key weblogger-template-mode-map "\C-x\C-s" 'weblogger-save-template))

(unless menu-bar-weblogger-menu 
  (easy-menu-define
    menu-bar-weblogger-menu weblogger-entry-mode-map ""
    '("Weblogger"
      ["Send weblog entry" weblogger-send-entry t]
      ["Save weblog entry" weblogger-save-entry nil t]
      ["--" nil nil]
      ["Delete entry"      weblogger-delete-entry t]
      ["--" nil nil]
      ["Previous entry"    weblogger-prev-entry t]
      ["Next entry"        weblogger-next-entry t]
      ["--" nil nil]
      ["Edit Main Template" weblogger-edit-main-template t]
      ["Edit Archive Template" weblogger-edit-main-template t]
      ["--" nil nil]
      ["Change Weblog"    weblogger-change-weblog t])))

(defun weblogger-select-configuration (&optional config)
  "Select a previously saved configuration."
  (interactive)
  (let* ((completion-ignore-case t)
	 (seq 0)
	 (configs (mapcar
		   (lambda (config)
		     (cons (car config) (setq seq (1+ seq))))
		   weblogger-config-alist))
	 (conf (cdr (assoc
		     (or config 
			 (if (= 1 (length configs))
			     (caar configs)
			   (completing-read 
			    "Config Name: " configs nil t)))
		     weblogger-config-alist)))
	 (username (cdr (assoc "user" conf)))
	 (password (cdr (assoc "pass" conf)))
	 (url      (cdr (assoc "server-url" conf)))
	 (weblog   (cdr (assoc "weblog" conf))))
    (when username
      (setq weblogger-server-username username))
    (when password
      (setq weblogger-server-password password))
    (when url
      (setq weblogger-server-url url))
    (when weblog
      (setq weblogger-weblog-id weblog))
    (weblogger-determine-capabilities)
    (weblogger-weblog-alist t)))

(defun weblogger-setup-weblog ()
  "Create a profile for a weblog."
  (interactive)
  (weblogger-change-server)
  (let ((user   (weblogger-server-username t))
	(pass   (weblogger-server-password t))
	(weblog (weblogger-weblog-id       t)))
    (setq weblogger-config-name
	  (read-from-minibuffer
	   (format "Name this configuration (\"%s\"): "
		   weblogger-config-name)
	   weblogger-config-name))
    (let ((conf (assoc weblogger-config-name weblogger-config-alist))
	  (settings (delq nil
			  (list
			   (cons "user"       user)
			   (cons "server-url" weblogger-server-url)
			   (when weblogger-save-password
			     (cons "pass"     pass))
			   (cons "weblog"     weblog)))))
      (if conf
	  (setcdr conf settings)
	(setq weblogger-config-alist
	      (append weblogger-config-alist 
		      (list
		       (cons weblogger-config-name
			     settings)))))))
  (weblogger-save-configuration))

(defun weblogger-save-configuration ()
  "Save the current configuration using the name from CONFIG in
the filename in weblogger-config-file."
  (customize-save-variable 'weblogger-config-alist
			   weblogger-config-alist))
;;   (save-excursion
;;     (set-buffer (find-file weblogger-config-file))
;;     (erase-buffer)
;;     (insert "(setq weblogger-config-alist")
;;     (print weblogger-config-alist 'insert)
;;     (insert ")\n")))


(defun weblogger-change-server ()
  "Change the server-url."
  (interactive)
  (setq weblogger-server-url
	(read-from-minibuffer "Server Endpoint (URL): " weblogger-server-url))
  (weblogger-determine-capabilities))

(defun weblogger-change-user ()
  "Change username and password."
  (interactive)
  (weblogger-server-username t)
  (weblogger-server-password t))

(defun weblogger-change-weblog ()
  "Change the weblog."
  (interactive)
  (let ((point-save (point)))
    (weblogger-weblog-id t)
    (message-remove-header "Newsgroup")
    (message-add-header (concat "Newsgroup: " 
				(weblogger-weblog-name-from-id 
				 (weblogger-weblog-id))))
    (goto-char point-save)))

(defun weblogger-change-texttype ()
  "Change Text Type."
  (interactive)
  (let ((point-save (point)))
    (message-remove-header "X-TextType")
    (message-add-header (concat "X-TextType: " 
				(weblogger-texttype-name-from-id 
				 (weblogger-select-texttype))))
    (goto-char point-save)))

(defun weblogger-entry-mode ()
  "Major mode for editing text for Weblogger.  Based on message-mode."
  (interactive)
  (message-mode)
  (message-disassociate-draft)
  (use-local-map weblogger-entry-mode-map)
  (setq mode-name "weblogger-entry")
  (setq major-mode 'weblogger-entry-mode)
  (unless weblogger-entry-ring
    (setq weblogger-entry-ring (make-ring weblogger-max-entries-in-ring)))
  (run-hooks 'weblogger-entry-mode-hook))

(defun weblogger-template-mode ()
  "Major mode for editing templates for Weblogger. Based on text-mode."
  (interactive)
  (text-mode)
  (use-local-map weblogger-template-mode-map)
  (setq mode-name "weblogger-template")
  (setq major-mode 'weblogger-template-mode))

(defun weblogger-edit-template (type)
  "Edit a Template. TYPE indicates which one."
  (setq *weblogger-template* (switch-to-buffer "*weblogger-template*"))
  (weblogger-template-mode)
  (erase-buffer)
  (insert (xml-rpc-method-call
	   weblogger-server-url
	   'blogger.getTemplate 
	   weblogger-blogger-app-key
	   (weblogger-weblog-id)
	   (weblogger-server-username)
	   (weblogger-server-password)
	   type))
  (set-buffer-modified-p nil)
  (goto-char (point-min))
  (setq weblogger-template-type type))

(defun weblogger-save-template ()
  "Save a Template. TYPE indicates which one."
  (interactive)
  (if (buffer-modified-p)
      (progn (xml-rpc-method-call
	      weblogger-server-url
	      'blogger.setTemplate 
	      weblogger-blogger-app-key
	      (weblogger-weblog-id)
	      (weblogger-server-username)
	      (weblogger-server-password)
	      (buffer-substring-no-properties (point-min) (point-max))
	      weblogger-template-type)
	     (set-buffer-modified-p nil))))

(defun weblogger-edit-main-template ()
  "Edit the main template"
  (interactive)
  (weblogger-edit-template "main"))

(defun weblogger-edit-archive-template ()
  "Edit the template for archive listings"
  (interactive)
  (weblogger-edit-template "archive"))

(defun weblogger-start-entry (&optional prompt)
  "Start creating a weblog entry in the *weblogger-entry* buffer.
With a prefix, it will check the available weblogs on the server
and prompt for the weblog to post to if multiple ones are
available."
  (interactive "P")
  (if prompt (weblogger-weblog-id prompt))
  (unless weblogger-entry-ring
    (setq weblogger-entry-ring (make-ring weblogger-max-entries-in-ring)))
  (ring-insert weblogger-entry-ring '(("content" "")))
  (setq weblogger-ring-index 0)
  (weblogger-edit-entry))

(defun weblogger-entry-setup-headers (entry &optional body-line)
  "Add any pertinant headers to the weblog entry."
  (let ((entry-id (when (cdr (assoc  "entry-id" entry))
		    (if (stringp (cdr (assoc  "entry-id" entry)))
			(cdr (assoc  "entry-id" entry))
		      (int-to-string (cdr (assoc  "entry-id" entry))))))
	(content  (or (cdr (assoc "content"     entry))
		      ""))
	(title    (cdr (assoc "title"       entry))))

    (mapcar 'message-add-header
	    (delq nil
		  (mapcar
		   (lambda (bit)
		     (when (car (cdr-safe bit))
		       (concat (car bit) ": "
			       (cadr bit))))
		   (list
		    (list "Message-ID"
			  (when entry-id
			    (format "<%s/%s@%s>"
				    entry-id
				    (weblogger-weblog-id)
				    (url-host (url-generic-parse-url weblogger-server-url)))))
		    (list "Date"
			  (let ((date (cdr (assoc "dateCreated" entry))))
                (if (stringp date)
                  (fix-datetime-decrease-8-hour date)
                  nil)))
		    (list "In-Reply-To"
			  (let ((hold nil))
			    (mapcar
			     (lambda (p)
			       (setq hold (concat hold p ", ")))
			     (cdr (assoc "trackbacks"  entry)))
			    (when hold hold)))
		    (list "X-URL"
			  (cdr (assoc "url" entry)))
            (list "Permlink"
              (cdr (assoc "wp_slug" entry)))
		    (list "X-TextType"
			  (cdr (assoc "texttype" entry)))
		    (list "Subject" title)
		    (list "Categories"
                          (let ((cats (cdr (assoc "categories"  entry))))
                            (when (> (length cats) 0)
                              (mapconcat
                               (lambda (p) p)
                               cats ", "))))
            (list "Tags" (let ((tags (cdr (assoc "mt_keywords" entry))))
                           (if (and (> (length tags) 0) (not (stringp tags)))
                             (mapconcat
                               (lambda(p) p)
                               tags
                               ", ")
                             tags
                             )))
;		    (list "Tags" 	;tags support
;                          (let ((tags (cdr (assoc "mt_keywords"  entry))))
;                            (when (> (length tags) 0)
;                              (mapconcat
;                               (lambda (p) p)
;                               tags ", "))))
		    (list "From"
			  (or (cdr (assoc "authorName"  entry))
			      weblogger-server-username))
		    (list "Newsgroup"
			  (concat (weblogger-weblog-name-from-id 
				   (weblogger-weblog-id))))))))

    (goto-char (point-max))
    (when body-line
      (insert mail-header-separator "\n"))))

(defun weblogger-send-entry (&optional arg)
  "Send but not publish the current entry.  With optional argument, prompts
for the weblog to use."
  (interactive)
  (weblogger-save-entry nil arg)
  (bury-buffer))

(defun weblogger-publish-entry (&optional arg)
  "Publish the current entry.  With optional argument, prompts
for the weblog to use."
  (interactive)
  (set-buffer-modified-p t)
  (weblogger-save-entry t arg)
  (bury-buffer))


(defun weblogger-save-entry (&optional publishp &optional arg)
  "Publish the current entry is publishp is set.  With optional
argument, prompts for the weblog to use."
  (interactive)
  (if (not (equal (current-buffer) *weblogger-entry*))
      (message 
       "You are not in the *weblogger-entry* buffer.")
    (let ((entry (weblogger-entry-buffer-to-struct)))
      (cond ((and (buffer-modified-p)
		  (not (string-equal (cdr (assoc "content" entry)) "")))
	     (weblogger-server-username arg)
	     (weblogger-server-password arg)
	     (weblogger-weblog-id arg)
	     (cond ((cdr (assoc "entry-id" entry))
		    (weblogger-update-ring entry)
		    (weblogger-api-send-edits entry publishp)
		    (set-buffer-modified-p nil))
		   (t
		    (weblogger-entry-setup-headers 
		     (weblogger-api-new-entry entry publishp)))))
	    (t (message "Nothing to post."))))))

(defun weblogger-update-ring (entry)
  "Update the entry ring with the contents of ENTRY"
  (let ((ring-entry (ring-ref
		     weblogger-entry-ring
		     weblogger-ring-index)))
    (mapcar (lambda (el)
	      (let ((field (assoc (car el) ring-entry)))
		(when field
		  (setcdr field (cdr el)))))
	    entry)))

(defun weblogger-server-username (&optional prompt)
  "Get the username.  If you've not yet logged in then prompt for
it."
  (setq weblogger-server-username
	(progn (when (and
		      (assoc weblogger-config-name weblogger-config-alist)
		      (not weblogger-server-username))
		 (weblogger-select-configuration weblogger-config-name))
	       (if (or prompt (not weblogger-server-username))
		   (read-from-minibuffer "Username: " weblogger-server-username)
		 weblogger-server-username))))

(defun weblogger-server-password (&optional prompt)
  "Get the password.  If you've not yet logged in then prompt for
it"
  (setq weblogger-server-password
	(if (or prompt (not weblogger-server-password))
	    (if weblogger-server-password
		(read-passwd "Password for weblog server: "
			     nil weblogger-server-password)
	      (read-passwd "Password for weblog server: " nil))
	    weblogger-server-password)))

(defun weblogger-weblog-id (&optional prompt)
  "Get the weblog ID."
  (setq weblogger-weblog-id
	(progn (when (and
		      (assoc weblogger-config-name weblogger-config-alist)
		      (not weblogger-weblog-id))
		 (weblogger-select-configuration weblogger-config-name))
	       (if (or prompt
		       (not weblogger-weblog-id))
		   (weblogger-select-weblog prompt)
		 weblogger-weblog-id))))

(defun weblogger-api-blogger-get-content (struct)
  "Return the content for this post, optionally inserting the
title in the first row if weblogger-blogger-firstline-title is
set."
  (if weblogger-blogger-firstline-title
      (concat "<title>"
	      (cdr (assoc "title" struct))
	      "</title>\n"
	      (cdr (assoc "content" struct)))
      (cdr (assoc "content" struct))))

(defun weblogger-api-blogger-send-edits (struct &optional publishp)
  "Blogger API method to post edits to an entry specified by
STRUCT.  If PUBLISHP is non-nil, publishes the entry as well."
  (xml-rpc-method-call
   weblogger-server-url
   'blogger.editPost
   weblogger-blogger-app-key
   (cdr (assoc "entry-id" struct))
   (weblogger-server-username)
   (weblogger-server-password)
   (weblogger-api-blogger-get-content struct)
   publishp))

(defun weblogger-api-meta-send-edits (struct &optional publishp)
  "MetaWeblog API method to post edits to a entry specified by
STRUCT.  If PUBLISHP is non-nil, publishes the entry as well."
  (xml-rpc-method-call
   weblogger-server-url
   'metaWeblog.editPost
   (cdr (assoc "entry-id" struct))
   (weblogger-server-username)
   (weblogger-server-password)
   (weblogger-struct-to-request struct)
   publishp))

(defun weblogger-api-new-entry (struct publishp)
  "Publish a new entry (STRUCT) using the best method available."
  (run-hooks 'weblogger-new-entry-hook)
  (unless weblogger-api-new-entry
    (weblogger-determine-capabilities))
  (ring-insert
   weblogger-entry-ring
   (add-to-list
    'struct 
    (cons "entry-id" (eval `(,weblogger-api-new-entry struct publishp)))))
  (setq weblogger-ring-index 0)
  (ring-ref weblogger-entry-ring weblogger-ring-index))

(defun weblogger-api-send-edits (struct publishp)
  "Update an entry (in STRUCT) using the best method available."
  (run-hooks 'weblogger-edit-entry-hook)
  (unless weblogger-api-send-edits
    (weblogger-determine-capabilities))
  (eval `(,weblogger-api-send-edits struct publishp)))

(defun weblogger-api-list-entries (count)
  "Get a list of entries."
  (unless weblogger-api-list-entries
    (weblogger-determine-capabilities))
  (eval `(,weblogger-api-list-entries count)))

(defun weblogger-api-list-categories ()
  "Get a list of categories."
  (unless weblogger-api-list-categories
    (weblogger-determine-capabilities))
  (eval `(,weblogger-api-list-categories)))

(defun weblogger-api-blogger-new-entry (struct publishp)
  "Post a new entry from STRUCT.  If PUBLISHP is non-nil, publishes the
entry as well."
  (xml-rpc-method-call
   weblogger-server-url
   'blogger.newPost
   weblogger-blogger-app-key
   (weblogger-weblog-id)
   (weblogger-server-username)
   (weblogger-server-password)
   (weblogger-api-blogger-get-content struct)
   publishp))

(defun weblogger-api-meta-new-entry (struct publishp)
  "Post a new entry (STRUCT).  If PUBLISHP is non-nil, publishes
the entry as well."
  (xml-rpc-method-call
   weblogger-server-url
   'metaWeblog.newPost
   (weblogger-weblog-id)
   (weblogger-server-username)
   (weblogger-server-password)
   (weblogger-struct-to-request struct)
   publishp))

(defun weblogger-select-weblog (&optional fetch)
  "Allows the user to select a weblog and returns the weblog ID.
If there is only one weblog owned by the user on the server, then
that weblog is returned.  With FETCH defined, the server is
re-queried for a list of weblogs the user owns"
  (weblogger-weblog-id-from-weblog-name
   (let* ((completion-ignore-case t)
	  (seq 0)
	  (webloglist (mapcar
		     (lambda (weblog)
		       (cons weblog (setq seq (1+ seq))))
		     (weblogger-list-weblog-names fetch))))
     (if (= 1 (length webloglist))
	 (caar webloglist)
       (completing-read 
	"Weblog: " webloglist nil t)))))

(defun weblogger-weblog-id-from-weblog-name (name)
  "Returns the weblog id given the name."
  (cdr (assoc name
	 (mapcar 
	  (lambda (weblog)
	    (cons (cdr (assoc "blogName" weblog))
		  (cdr (assoc "blogid" weblog))))
	  (weblogger-weblog-alist)))))

(defun weblogger-weblog-name-from-id (id)
  "Returns the weblog name given the id."
  (cdr (assoc id
	 (mapcar 
	  (lambda (weblog)
	    (cons (cdr (assoc "blogid" weblog))
		  (cdr (assoc "blogName" weblog))))
	  (weblogger-weblog-alist)))))

(defun weblogger-texttype-name-from-id (id)
  "Returns the texttype name given the id."
  (cdr (assoc id
	 (mapcar 
	  (lambda (texttype)
	    (cons (cdr (assoc "key" texttype))
		  (cdr (assoc "label" texttype))))
	  (weblogger-texttype-alist)))))

(defun weblogger-texttype-id-from-name (name)
  "Returns the texttype id given the name."
  (cdr (assoc name
	 (mapcar 
	  (lambda (texttype)
	    (cons (cdr (assoc "label" texttype))
		  (cdr (assoc "key" texttype))))
	  (weblogger-texttype-alist)))))

(defun weblogger-list-texttype-names (&optional fetch)
  "Returns a list of texttype names."
  (mapcar 
   (lambda (texttype)
     (cdr (assoc "label" texttype)))
   (weblogger-texttype-alist fetch)))

(defun weblogger-texttype-alist (&optional fetch)
  "Returns the alist of texttypes allowed by the server."
  (when (cdr (assoc "mt.supportedTextFilters" weblogger-capabilities))
    (when (or fetch (not weblogger-texttype-alist))
      (setq weblogger-texttype-alist
	    (xml-rpc-method-call 
	     weblogger-server-url
	     'mt.supportedTextFilters)))
    weblogger-texttype-alist))

(defun weblogger-select-texttype (&optional fetch)
  "Allows the user to select a texttype for entries."
  (weblogger-texttype-id-from-name
   (let* ((completion-ignore-case t)
	  (seq 0)
	  (ttlist (mapcar
		   (lambda (texttype)
		     (cons texttype (setq seq (1+ seq))))
		   (weblogger-list-texttype-names fetch))))
     (if (= 1 (length ttlist))
	 (caar ttlist)
       (completing-read 
	"TextType: " ttlist nil t)))))

(defun weblogger-server-url-from-id (id)
  "Returns the weblog URL given the id."
  (cdr (assoc id
	      (mapcar
	       (lambda (weblog)
		 (cons (cdr (assoc "blogid" weblog))
		       (cdr (assoc "url" weblog))))
	       (weblogger-weblog-alist)))))

(defun weblogger-list-weblog-names (&optional fetch)
  "Returns a list of weblog names."
  (mapcar 
   (lambda (blog)
     (cdr (assoc "blogName" blog)))
   (weblogger-weblog-alist fetch)))

(defun weblogger-weblog-alist (&optional fetch)
  "Returns the alist of weblogs owned by a user on the server."
  (setq weblogger-weblog-alist
	(if (or fetch (not weblogger-weblog-alist))
	    (xml-rpc-method-call