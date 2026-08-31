;; -*- lexical-binding: t; -*-

(defun styles-c-mode ()
    (setq c-ts-indent-offset            4)
    (setq c-ts-common-list-indent-style 'align)
    (c-ts-mode-set-style                'bsd)

    ;; indent rules for function prototypes and ifndef preproc
    (setf (alist-get 'c treesit-simple-indent-rules)
        (append
            '(((node-is "function_declarator") parent-bol 0)
                 ((parent-is "preproc_\\(if\\|ifdef\\|elif\\|else\\)") parent-bol 0))
            (alist-get 'c treesit-simple-indent-rules))))
