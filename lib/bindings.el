(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c m") 'gptel)
(global-set-key (kbd "C-c o") 'ace-window)


(defvar bindings-dev-mode-keymap (make-keymap) "bindings-dev-mode keymap")

(define-key bindings-dev-mode-keymap (kbd "C-c l")      'align-current)
(define-key bindings-dev-mode-keymap (kbd "<C-tab>")    'editing-indent)
(define-key bindings-dev-mode-keymap (kbd "<backtab>")  'editing-unindent)
(define-key bindings-dev-mode-keymap (kbd "RET")        'newline-and-indent)
(define-key bindings-dev-mode-keymap (kbd "<home>")     'editing-smart-home)
(define-key bindings-dev-mode-keymap (kbd "C-.")        'xref-find-definitions-other-window)
(define-key bindings-dev-mode-keymap (kbd "C->")        'xref-find-definitions-other-frame)
(define-key bindings-dev-mode-keymap (kbd "M-<left>")   'editing-smart-home)
(define-key bindings-dev-mode-keymap (kbd "M-<right>")  'move-end-of-line)
(define-key bindings-dev-mode-keymap (kbd "M-<up>")     'scroll-down-command)
(define-key bindings-dev-mode-keymap (kbd "M-S-<up>")   'scroll-down-line)
(define-key bindings-dev-mode-keymap (kbd "M-<down>")   'scroll-up-command)
(define-key bindings-dev-mode-keymap (kbd "M-S-<down>") 'scroll-up-line)

(define-minor-mode
    bindings-dev-mode
    "dev-mode bindings"
    nil
    nil
    bindings-dev-mode-keymap)


(add-hook 'c-mode-hook              'bindings-dev-mode)
(add-hook 'python-mode-hook         'bindings-dev-mode)
(add-hook 'r-mode-hook              'bindings-dev-mode)
(add-hook 'makefile-gmake-mode-hook 'bindings-dev-mode)
(add-hook 'js-mode-hook             'bindings-dev-mode)
(add-hook 'html-mode-hook           'bindings-dev-mode)
(add-hook 'css-mode-hook            'bindings-dev-mode)
(add-hook 'xml-mode-hook            'bindings-dev-mode)
(add-hook 'latex-mode-hook          'bindings-dev-mode)
(add-hook 'lisp-mode-hook           'bindings-dev-mode)
