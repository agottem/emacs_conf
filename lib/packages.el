(require 'package)

(add-to-list 'package-archives
    '("mepla" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(use-package ess
    :ensure t)

(use-package elpy
    :ensure t
    :init
    (elpy-enable))

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-i")

(use-package csv-mode
    :ensure t)

(use-package company
    :ensure t
    :config
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 2)
    (global-company-mode t))

(use-package highlight-parentheses
    :ensure t
    :config
    (progn
        (highlight-parentheses-mode)
        (global-highlight-parentheses-mode)))
