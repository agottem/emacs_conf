(setq package-user-dir (concat user-emacs-tmp-directory "packages"))
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(use-package ace-window            :ensure t :defer t)
(use-package highlight-parentheses :ensure t :defer t)
(use-package tree-sitter           :ensure t :defer t)
(use-package tree-sitter-langs     :ensure t :defer t)
(use-package diff-hl               :ensure t :defer t)
(use-package magit                 :ensure t :defer t)
(use-package which-key             :ensure t :defer t)
(use-package markdown-mode         :ensure t :defer t)
(use-package ess                   :ensure t :defer t)
(use-package csv-mode              :ensure t :defer t)

(use-package minions
    :ensure t
    :config
    (minions-mode 1))

(use-package gptel
    :ensure t
    :defer t
    :config
    (setq gptel-model   'claude-sonnet-4-5-20250929)
    (setq gptel-backend (gptel-make-anthropic "Claude" :stream t :key (getenv "ANTHROPIC_API_KEY"))))

(use-package corfu
    :ensure t
    :defer t
    :custom
    (corfu-auto t)
    (corfu-cycle t)
    (corfu-auto-delay 0.2)
    (corfu-auto-prefix 2))

(use-package eglot
    :ensure t
    :defer t
    :config
    (setq eglot-autoshutdown t)
    (setq eglot-sync-connect nil)
    (setq eglot-ignored-server-capabilities '(:documentFormattingProvider
                                              :documentRangeFormattingProvider
                                              :documentOnTypeFormattingProvider
                                              :documentHighlightProvider
                                              :semanticTokensProvider
                                              :inlayHintProvider)))
