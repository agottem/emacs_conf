(defun projects-auto-discover (root-path)
    "Discover projects one level under dev_home"
    (dolist (entry (directory-files root-path t "^[^.]" t))
        (when (and (file-directory-p entry)
                  (file-exists-p (expand-file-name ".git" entry)))
            (project-remember-project (project--find-in-directory entry)))))


(run-with-idle-timer 1 nil (lambda () (projects-auto-discover (getenv "dev_home"))))
