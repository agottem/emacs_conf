(defun find-dev-files (path)
    (interactive "sPath: ")
    (find-dired path "-not -path './.git*' -and -type f -and \\( -name *.c -or -name *.h -or -name *.mk -or -name *.tex -or -name makefile -or -name Makefile -or -name *.html -or -name *.js -or -name *.xml -or -name *.txt -or -name *.css -or -name *.stab \\)"))
