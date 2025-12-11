(setq-default inhibit-splash-screen             1)
(setq-default visible-bell                      1)
(setq-default inhibit-eol-conversion            nil)
(setq-default default-buffer-file-coding-system 'utf-8-unix)
(setq-default line-number-mode                  1)
(setq-default column-number-mode                1)
(setq-default fill-column                       100)
(setq-default c-default-style                   "user")

(defvar settings-backup-dir   (file-name-concat user-emacs-tmp-directory "backups/"))
(defvar settings-autosave-dir (file-name-concat user-emacs-tmp-directory "autosaves/"))
(defvar settings-locks-dir    (file-name-concat user-emacs-tmp-directory "locks/"))

(make-directory settings-backup-dir   t)
(make-directory settings-autosave-dir t)
(make-directory settings-locks-dir    t)

(setq backup-directory-alist         `((".*" . ,settings-backup-dir)))
(setq auto-save-file-name-transforms `((".*" ,settings-autosave-dir t)))
(setq auto-save-list-file-prefix     settings-autosave-dir)
(setq lock-file-name-transforms      `((".*" ,settings-locks-dir t)))
(setq project-list-file              (file-name-concat user-emacs-tmp-directory "projects.el"))
(setq custom-file                    (file-name-concat user-emacs-tmp-directory "customizations.el"))
(setq tramp-persistency-file-name    (file-name-concat user-emacs-tmp-directory "tramp"))
(setq transient-history-file         (file-name-concat user-emacs-tmp-directory "tramp/history.el"))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq initial-major-mode 'text-mode)

(setq-default whitespace-line-column nil)
(setq-default whitespace-style       '(face trailing tabs empty lines-tail))
(global-whitespace-mode              1)

(setq org-directory          (format "%s/%s" (getenv "dev_home") "org"))
(setq org-agenda-files       (list (format "%s/%s" (getenv "dev_home") "org")))
(setq org-default-notes-file (format "%s/%s/%s" (getenv "dev_home") "org" "notes.org"))

(setq python-shell-interpreter      "python3")
(setq python-shell-interpreter-args "-i")

(setq eldoc-display-functions '(eldoc-display-in-buffer))

(show-paren-mode      1)
(menu-bar-mode        0)
(tool-bar-mode        0)
(electric-pair-mode   1)
(electric-indent-mode 1)
(which-key-mode       1)

(global-highlight-parentheses-mode)
(global-tree-sitter-mode)
(global-diff-hl-mode)
(global-corfu-mode)

(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)


(defun settings-c-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)
    (styles-c-mode)

    (setq c-syntactic-indentation 1)
    (setq c-basic-offset          4)
    (setq tab-width               4)
    (setq indent-tabs-mode        nil)
    (setq c-tab-always-indent     1)
    (setq require-final-newline   'visit-save)

    (when-let* ((project (project-current))
                (root    (project-root project)))
        (if (or (file-exists-p (expand-file-name "compile_commands.json" root))
                (file-exists-p (expand-file-name "build/compile_commands.json" root)))
            (eglot-ensure)
            (message "Generate compile_commands.json or build/compile_commands.json to activate eglot"))
        )

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-python-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)
    (eglot-ensure)

    (setq tab-width               4)
    (setq indent-tabs-mode        nil)
    (setq require-final-newline   'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-r-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)
    (ess-r-mode)

    (setq tab-width               4)
    (setq indent-tabs-mode        nil)
    (setq require-final-newline   'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-gmake-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)

    (setq tab-width             4)
    (setq require-final-newline 'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-makefile nil 'local))

(defun settings-js-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)
    (styles-c-mode)

    (setq c-syntactic-indentation 1)
    (setq c-basic-offset          4)
    (setq tab-width               4)
    (setq indent-tabs-mode        nil)
    (setq c-tab-always-indent     1)
    (setq require-final-newline   'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-html-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)

    (setq tab-width             4)
    (setq indent-tabs-mode      nil)
    (setq require-final-newline 'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-css-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)

    (setq tab-width             4)
    (setq indent-tabs-mode      nil)
    (setq require-final-newline 'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-xml-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)

    (setq tab-width             4)
    (setq indent-tabs-mode      nil)
    (setq require-final-newline 'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-latex-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)

    (setq tex-indent-basic      4)
    (setq tab-width             4)
    (setq indent-tabs-mode      nil)
    (setq require-final-newline 'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-lisp-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)

    (setq lisp-indent-offset    4)
    (setq tab-width             4)
    (setq indent-tabs-mode      nil)
    (setq require-final-newline 'visit-save)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-org-mode-config ()
    (setq org-log-done 'time)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-markdown-mode-config ()
    (gptel-mode)

    (setq tab-width        4)
    (setq indent-tabs-mode nil)

    (add-hook 'before-save-hook 'sanitize-standardize-source-file nil 'local))

(defun settings-text-mode-config ()
    (set-buffer-file-coding-system 'utf-8-unix nil 1)

    (setq indent-tabs-mode t)
    (setq tab-width        4))


(add-hook 'c-mode-hook              'settings-c-mode-config)
(add-hook 'python-mode-hook         'settings-python-mode-config)
(add-hook 'r-mode-hook              'settings-r-mode-config)
(add-hook 'makefile-gmake-mode-hook 'settings-gmake-mode-config)
(add-hook 'js-mode-hook             'settings-js-mode-config)
(add-hook 'html-mode-hook           'settings-html-mode-config)
(add-hook 'css-mode-hook            'settings-css-mode-config)
(add-hook 'xml-mode-hook            'settings-xml-mode-config)
(add-hook 'latex-mode-hook          'settings-latex-mode-config)
(add-hook 'lisp-mode-hook           'settings-lisp-mode-config)
(add-hook 'org-mode-hook            'settings-org-mode-config)
(add-hook 'markdown-mode-hook       'settings-markdown-mode-config)
(add-hook 'text-mode-hook           'settings-text-mode-config)

(add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)


(setq auto-mode-alist (append '(
                                   ("\\.c$"     . c-mode)
                                   ("\\.cpp$"   . c-mode)
                                   ("\\.cc$"    . c-mode)
                                   ("\\.cxx$"   . c-mode)
                                   ("\\.h$"     . c-mode)
                                   ("\\.hpp$"   . c-mode)

                                   ("\\.py$"    . python-mode)

                                   ("\\.mk$"    . makefile-gmake-mode)
                                   ("Makefile$" . makefile-gmake-mode)
                                   ("makefile$" . makefile-gmake-mode)

                                   ("\\.R$"     . r-mode)

                                   ("\\.patch$" . diff-mode)

                                   ("\\.csv$"   . csv-mode)

                                   ("\\.js$"    . js-mode)

                                   ("\\.html$"  . html-mode)
                                   ("\\.htm$"   . html-mode)
                                   ("\\.css$"   . css-mode)
                                   ("\\.xml$"   . xml-mode)

                                   ("\\.tex$"   . latex-mode)

                                   ("\\.el$"    . lisp-mode)
                                   ("\\.emacs$" . lisp-mode)

                                   ("\\.org$"   . org-mode)

                                   ("\\.gpt$"   . markdown-mode)
                                   ("\\.md$"    . markdown-mode)

                                   ("\\.stab$"  . text-mode)
                                   ("\\.txt$"   . text-mode))))
