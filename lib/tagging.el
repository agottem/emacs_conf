(setq-default tags-file-name (format "%s/%s" temporary-file-directory ".emacs.root.tags"))


(defvar tagging-root-path (getenv "dev_home") "The default directory to recursively tag")

(defun tagging-update-file-cache ()
    "Refresh the file cache for tagging-root-path"
    (interactive)
    (file-cache-add-directory-recursively tagging-root-path))

(defun tagging-update-tags ()
    "Refresh the tag file for tagging-root-path"
    (interactive)
    (compile
        (format
            "exctags -f %s --languages=C,C++,Make,HTML,Tex --file-scope=no --c-kinds=+cdefgmnstuv -e -R %s"
            tags-file-name
            (expand-file-name tagging-root-path)))
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))

(defun tagging-search-tags ()
    "Search for instances of a symbol"
    (interactive)
    (if (use-region-p)
        (tags-search (format "\\<%s\\>" (buffer-substring-no-properties (mark) (point))))
        (let ((default-tag (find-tag-default)))
            (if default-tag
                (tags-search (format "\\<%s\\>" default-tag))
                (tags-search (format "\\<%s\\>" (read-string "Symbol: ")))))))

(defun tagging-find-tag-now ()
    "Goto symbol without prompting"
    (interactive)
    (let ((default-tag (find-tag-default)))
        (if default-tag
            (find-tag default-tag))))

(defun tagging-find-tag-other-window-now ()
    "Goto symbol in a different window without prompting"
    (interactive)
    (let ((default-tag (find-tag-default)))
        (if default-tag
            (find-tag-other-window default-tag))))
