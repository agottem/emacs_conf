;(with-eval-after-load 'eglot
 ;  (add-to-list 'eglot-server-programs
  ;      `((c-mode c++-mode)
   ;          . ("clangd"
    ;               "--background-index"
     ;              "--clang-tidy"
      ;             "--header-insertion=never"
       ;            "--pch-storage=memory"
        ;           ,(concat "--index-file=" (file-name-concat user-emacs-tmp-directory "lsp-cache/"))))))
