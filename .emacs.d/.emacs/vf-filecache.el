(require 'filecache)
(require 'ido)

(add-to-list 'file-cache-filter-regexps "docs/html")
(add-to-list 'file-cache-filter-regexps "\\.svn-base$")
(add-to-list 'file-cache-filter-regexps "\\.dump$")


(defun file-cache-ido-find-file (file)
  "Using ido, interactively open file from file cache'.
First select a file, matched using ido-switch-buffer against the contents
in `file-cache-alist'. If the file exist in more than one
directory, select directory. Lastly the file is opened."
  (interactive (list (file-cache-ido-read "File: "
                                          (mapcar
                                           (lambda (x)
                                             (car x))
                                           file-cache-alist))))
  (let* ((record (assoc file file-cache-alist)))
    (find-file
     (expand-file-name
      file
      (if (= (length record) 2)
          (car (cdr record))
        (file-cache-ido-read
         (format "Find %s in dir: " file) (cdr record)))))))


(defun file-cache-ido-read (prompt choices)
  (let ((ido-make-buffer-list-hook
         (lambda ()
           (setq ido-temp-list choices))))
    (ido-read-buffer prompt)))
(defmacro fan/file-cache-setup-tree (prefix shortcut directories)
  "Set up the file-cache tree for PREFIX using the keyboard SHORTCUT.
DIRECTORIES should be a list of directory names."
  `(let ((file-cache-alist nil)
         (directories ,directories))
     (file-cache-clear-cache)
     (while directories
       (file-cache-add-directory-using-find (car directories))
       (setq directories (cdr directories)))
     (setq ,(intern (concat "fan/file-cache-" prefix "-alist")) file-cache-alist)
     (defun ,(intern (concat "fan/file-cache-ido-find-" prefix)) ()
       (interactive)
       (let ((file-cache-alist ,(intern (concat "fan/file-cache-" prefix "-alist"))))
         (call-interactively 'file-cache-ido-find-file)))
     (global-set-key (kbd ,shortcut)
                     (quote ,(intern (concat "fan/file-cache-ido-find-" prefix))))))
