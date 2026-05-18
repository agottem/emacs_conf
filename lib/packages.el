(setq package-user-dir (concat user-emacs-tmp-directory "packages"))
(setq package-install-upgrade-built-in t)
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(use-package auto-package-update
    :ensure t
    :config
    (setq auto-package-update-interval 7)
    (setq auto-package-update-delete-old-versions t)
    (setq auto-package-update-last-update-day-path (file-name-concat user-emacs-tmp-directory ".last-package-update-day"))
    (auto-package-update-maybe)
    (auto-package-update-at-time "09:00"))

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
(use-package pyvenv                :ensure t :defer t)

(use-package minions
    :ensure t
    :config
    (minions-mode 1))

(use-package gptel
    :ensure t
    :defer t
    :config
    (setq gptel-model 'gpt-5.4)
    (setq gptel-backend (gptel-make-openai "OpenAI"
                            :key (getenv "OPENAI_API_KEY")
                            :models '("gpt-5.5")))
    (setq gptel-default-mode 'org-mode))

(use-package shell-maker
    :ensure t
    :config
    (setq shell-maker-root-path user-emacs-tmp-directory))

(use-package agent-shell
    :ensure t
    :config
    (setq agent-shell-openai-authentication (agent-shell-openai-make-authentication
                                                :api-key (getenv "OPENAI_API_KEY")))
    (setq agent-shell-anthropic-authentication (agent-shell-anthropic-make-authentication
                                                   :api-key (getenv "ANTHROPIC_API_KEY")))
    (setq agent-shell-opencode-authentication (agent-shell-opencode-make-authentication :none t)))

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
