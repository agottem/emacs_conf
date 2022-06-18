(defun display-reset-window ()
    (interactive)
    (when(window-system)
        (set-frame-size     (selected-frame) 100 60)
        (set-frame-position (selected-frame) 0 0)))


(display-reset-window)

(load-theme 'soft-charcoal 1)
