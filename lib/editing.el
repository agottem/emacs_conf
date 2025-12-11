(defun editing-region-whole-line-beginning ()
    (save-excursion (goto-char (region-beginning)) (line-beginning-position)))

(defun editing-region-whole-line-end ()
    (save-excursion (goto-char (region-end)) (line-end-position)))

(defun editing-unindent ()
    (interactive)
    (if (use-region-p)
        (indent-rigidly
            (editing-region-whole-line-beginning)
            (editing-region-whole-line-end)
            (- 0 tab-width))
        (indent-rigidly (line-beginning-position) (line-end-position) (- 0 tab-width)))
    (setq deactivate-mark nil))

(defun editing-indent ()
    (interactive)
    (if (use-region-p)
        (indent-rigidly
            (editing-region-whole-line-beginning)
            (editing-region-whole-line-end)
            tab-width)
        (indent-rigidly (line-beginning-position) (line-end-position) tab-width))
    (setq deactivate-mark nil))

(defun editing-smart-home ()
    (interactive)
    (if (eq (save-excursion (beginning-of-line-text) (point)) (point))
        (beginning-of-line)
        (beginning-of-line-text)))

(put 'editing-smart-home 'CUA 'move)

(defun editing-region-length ()
    "Compute the length of a region"
    (interactive)
    (message (format "%d" (- (region-end) (region-beginning)))))
