(defun utils-region-whole-line-beginning ()
    (save-excursion (goto-char (region-beginning)) (line-beginning-position)))

(defun utils-region-whole-line-end ()
    (save-excursion (goto-char (region-end)) (line-end-position)))
