;; -*- lexical-binding: t; -*-

(defun styles-c-mode ()
    (setq c-ts-indent-offset            4)
    (setq c-ts-common-list-indent-style 'align)
    (c-ts-mode-set-style                'bsd))
