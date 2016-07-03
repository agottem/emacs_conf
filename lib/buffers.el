(defun buffers-close-all ()
    (interactive)
    (mapc 'kill-buffer (buffer-list)))

(defun buffers-prev-window ()
    (interactive)
    (other-window -1))
