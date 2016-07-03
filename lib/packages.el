(require 'package)

(setq-default package-user-dir (concat temporary-file-directory "/.emacs_packages"))

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(unless (package-installed-p 'scala-mode2)
    (package-refresh-contents)
    (ignore-errors (package-install 'scala-mode2)))
