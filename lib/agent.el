;; -*- lexical-binding: t; -*-

(defvar agent-artifact-root (getenv "RIG_ARTIFACT_ROOT"))

(defun agent-make-transcript-directory (subdir)
    (let* ((cwd (string-remove-suffix "/" (agent-shell-cwd)))
              (sanitized (replace-regexp-in-string "/" "-" (string-remove-prefix "/" cwd))))
        (expand-file-name subdir (file-name-concat user-emacs-tmp-directory "agent-shell" sanitized))))

(defun agent-make-name ()
    (when-let* ((proj-dir (project-current)))
        (replace-regexp-in-string "[^[:alnum:]]+" "-"
            (file-name-nondirectory
                (directory-file-name
                    (project-root proj-dir))))))

(defun agent-make-command-prefix (buffer)
    (or (project-current) (user-error "Must be in a project to spawn a rig agent-shell"))
    (list "rig-agent-shell.sh"
        (concat "--name=" (agent-make-name))
        (concat "--repo=" (expand-file-name (project-root (project-current))))
        (concat "--artifact-root=" agent-artifact-root)))


(setopt agent-shell-dot-subdir-function #'agent-make-transcript-directory)

(setq agent-shell-preferred-agent-config (agent-shell-opencode-make-agent-config))
(setq agent-shell-text-file-capabilities nil)
(setq agent-shell-command-prefix         #'agent-make-command-prefix)
(setq agent-shell-path-resolver-function (lambda (_arg) "/work"))
