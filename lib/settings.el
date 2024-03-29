(setq-default inhibit-splash-screen             1)
(setq-default visible-bell                      1)
(setq-default inhibit-eol-conversion            nil)
(setq-default default-buffer-file-coding-system 'utf-8-unix)
(setq-default line-number-mode                  1)
(setq-default column-number-mode                1)
(setq-default fill-column                       100)
(setq-default c-default-style                   "user")

(setq custom-file (concat user-emacs-directory "customizations.el"))

(setq default-major-mode             'text-mode)
(setq backup-directory-alist         `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*"   ,temporary-file-directory 1)))
(setq auto-save-list-file-prefix     temporary-file-directory)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default whitespace-line-column nil)
(setq-default whitespace-style       '(face lines-tail))
(global-whitespace-mode              1)

(setq org-directory          (format "%s/%s" (getenv "dev_home") "org"))
(setq org-agenda-files       (list (format "%s/%s" (getenv "dev_home") "org")))
(setq org-default-notes-file (format "%s/%s/%s" (getenv "dev_home") "org" "notes.org"))

(show-paren-mode                1)
(menu-bar-mode                  0)
(tool-bar-mode                  0)
(electric-pair-mode             1)
(electric-indent-mode           1)

(put 'downcase-region 'disabled nil)


(defun settings-c-mode-config ()
    (when(eq major-mode 'c-mode)
        (set-buffer-file-coding-system 'utf-8-unix nil 1)
        (bindings-c-mode               1)
        (styles-c-mode)

        (setq c-syntactic-indentation 1)
        (setq c-basic-offset          4)
        (setq tab-width               4)
        (setq indent-tabs-mode        nil)
        (setq c-tab-always-indent     1)
        (setq require-final-newline   'visit-save)))

(defun settings-c-mode-sanitize ()
    (when(eq major-mode 'c-mode)
        (sanitize-implicit-utf-8-unix)))


(defun settings-gmake-mode-config ()
    (when(eq major-mode 'makefile-gmake-mode)
        (set-buffer-file-coding-system 'utf-8-unix nil 1)
        (bindings-dev-mode             1)

        (set
            (make-local-variable 'whitespace-style)
            '(tabs spaces space-mark tab-mark face lines-tail))
        (whitespace-mode 1)

        (setq tab-width             4)
        (setq require-final-newline 'visit-save)))

(defun settings-gmake-mode-sanitize ()
    (when(eq major-mode 'makefile-gmake-mode)
        (sanitize-explicit-utf-8-unix)))


(defun settings-js-mode-config ()
    (when(eq major-mode 'js-mode)
        (set-buffer-file-coding-system 'utf-8-unix nil 1)
        (bindings-dev-mode             1)
        (styles-c-mode)

        (setq c-syntactic-indentation 1)
        (setq c-basic-offset          4)
        (setq tab-width               4)
        (setq indent-tabs-mode        nil)
        (setq c-tab-always-indent     1)
        (setq require-final-newline   'visit-save)))

(defun settings-js-mode-sanitize ()
    (when(eq major-mode 'js-mode)
        (sanitize-implicit-utf-8-unix)))


(defun settings-sgml-mode-config ()
    (when(eq major-mode 'sgml-mode)
        (set-buffer-file-coding-system 'utf-8-unix nil 1)
        (bindings-dev-mode             1)

        (setq sgml-basic-offset     4)
        (setq tab-width             4)
        (setq indent-tabs-mode      nil)
        (setq require-final-newline 'visit-save)))

(defun settings-sgml-mode-sanitize ()
    (when(eq major-mode 'sgml-mode)
        (sanitize-implicit-utf-8-unix)))


(defun settings-latex-mode-config ()
    (when(eq major-mode 'latex-mode)
        (set-buffer-file-coding-system 'utf-8-unix nil 1)
        (bindings-dev-mode             1)

        (setq tex-indent-basic      4)
        (setq tab-width             4)
        (setq indent-tabs-mode      nil)
        (setq require-final-newline 'visit-save)))

(defun settings-latex-mode-sanitize ()
    (when(eq major-mode 'latex-mode)
        (sanitize-implicit-utf-8-unix)))


(defun settings-lisp-mode-config ()
    (when(eq major-mode 'lisp-mode)
        (set-buffer-file-coding-system 'utf-8-unix nil 1)
        (bindings-dev-mode             1)

        (setq lisp-indent-offset    4)
        (setq tab-width             4)
        (setq indent-tabs-mode      nil)
        (setq require-final-newline 'visit-save)))

(defun settings-lisp-mode-sanitize ()
    (when(eq major-mode 'lisp-mode)
        (sanitize-implicit-utf-8-unix)))


(defun settings-org-mode-config ()
    (when(eq major-mode 'org-mode)
        (setq org-log-done 'time)))

(defun settings-org-mode-sanitize ()
    (when(eq major-mode 'org-mode)
        (sanitize-explicit-utf-8-unix)))


(defun settings-text-mode-config ()
    (when(eq major-mode 'text-mode)
        (set-buffer-file-coding-system 'utf-8-unix nil 1)
        (bindings-basic-mode           1)

        (set
            (make-local-variable 'whitespace-style)
            '(tabs spaces space-mark tab-mark face lines-tail))
        (whitespace-mode 1)

        (setq tab-width             4)))

(defun settings-text-mode-sanitize ()
    (when(eq major-mode 'text-mode)))


(defun settings-minibuffer-mode-config ()
        (bindings-minibuffer-mode 1))


(add-hook 'c-mode-hook              'settings-c-mode-config)
(add-hook 'makefile-gmake-mode-hook 'settings-gmake-mode-config)
(add-hook 'js-mode-hook             'settings-js-mode-config)
(add-hook 'sgml-mode-hook           'settings-sgml-mode-config)
(add-hook 'latex-mode-hook          'settings-latex-mode-config)
(add-hook 'lisp-mode-hook           'settings-lisp-mode-config)
(add-hook 'org-mode-hook            'settings-org-mode-config)
(add-hook 'text-mode-hook           'settings-text-mode-config)
(add-hook 'minibuffer-setup-hook    'settings-minibuffer-mode-config)

(add-hook 'after-change-major-mode-hook 'settings-c-mode-sanitize)
(add-hook 'after-change-major-mode-hook 'settings-gmake-mode-sanitize)
(add-hook 'after-change-major-mode-hook 'settings-js-mode-sanitize)
(add-hook 'after-change-major-mode-hook 'settings-sgml-mode-sanitize)
(add-hook 'after-change-major-mode-hook 'settings-latex-mode-sanitize)
(add-hook 'after-change-major-mode-hook 'settings-lisp-mode-sanitize)
(add-hook 'after-change-major-mode-hook 'settings-org-mode-sanitize)
(add-hook 'after-change-major-mode-hook 'settings-text-mode-sanitize)

(add-hook 'before-save-hook 'settings-c-mode-sanitize)
(add-hook 'before-save-hook 'settings-gmake-mode-sanitize)
(add-hook 'before-save-hook 'settings-js-mode-sanitize)
(add-hook 'before-save-hook 'settings-sgml-mode-sanitize)
(add-hook 'before-save-hook 'settings-latex-mode-sanitize)
(add-hook 'before-save-hook 'settings-lisp-mode-sanitize)
(add-hook 'before-save-hook 'settings-org-mode-sanitize)
(add-hook 'before-save-hook 'settings-text-mode-sanitize)


(setq auto-mode-alist (append '(
                                   ("\\.c$"     . c-mode)
                                   ("\\.cpp$"   . c-mode)
                                   ("\\.cc$"    . c-mode)
                                   ("\\.cxx$"   . c-mode)
                                   ("\\.h$"     . c-mode)
                                   ("\\.hpp$"   . c-mode)
                                   ("\\.cs$"    . c-mode)

                                   ("\\.mk$"    . makefile-gmake-mode)
                                   ("Makefile$" . makefile-gmake-mode)
                                   ("makefile$" . makefile-gmake-mode)

                                   ("\\.js$"    . js-mode)

                                   ("\\.html$"   . sgml-mode)
                                   ("\\.htm$"    . sgml-mode)
                                   ("\\.css$"    . sgml-mode)
                                   ("\\.xml$"    . sgml-mode)
                                   ("\\.xsd$"    . sgml-mode)

                                   ("\\.tex$"   . latex-mode)

                                   ("\\.el$"    . lisp-mode)
                                   ("\\.emacs$" . lisp-mode)

                                   ("\\.org$"   . org-mode)

                                   ("\\.stab$"  . text-mode)
                                   ("\\.txt$"   . text-mode))))
