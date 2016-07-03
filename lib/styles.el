(defun styles-indent-lineup-under-block (langelem)
    (save-excursion
        (beginning-of-line)
        (backward-up-list)
        (vector (+ tab-width (current-column)))))

(defun styles-lineup-under-block (langelem)
    (save-excursion
        (beginning-of-line)
        (backward-up-list)
        (vector (current-column))))


(defun styles-c-mode ()
    (c-set-offset 'topmost-intro      0)
    (c-set-offset 'topmost-intro-cont 0)

    (c-set-offset 'defun-open        0)
    (c-set-offset 'defun-block-intro '+)
    (c-set-offset 'defun-close       0)

    (c-set-offset 'string 0)

    (c-set-offset 'arglist-intro         'c-lineup-arglist-intro-after-paren)
    (c-set-offset 'arglist-cont          'c-lineup-arglist-intro-after-paren)
    (c-set-offset 'arglist-cont-nonempty 'c-lineup-arglist-intro-after-paren)
    (c-set-offset 'arglist-close         'c-lineup-arglist-close-under-paren)

    (c-set-offset 'substatement-open     0)
    (c-set-offset 'statement-block-intro '+)
    (c-set-offset 'block-close           0)
    (c-set-offset 'substatement-open     0)
    (c-set-offset 'statement             0)
    (c-set-offset 'statement-cont        'c-lineup-math)
    (c-set-offset 'substatement-label    0)

    (c-set-offset 'case-label           0)
    (c-set-offset 'statement-case-intro '+)
    (c-set-offset 'statement-case-open  '+)
    (c-set-offset 'access-label         0)
    (c-set-offset 'label                0)

    (c-set-offset 'do-while-closure 0)
    (c-set-offset 'else-clause      0)
    (c-set-offset 'catch-clause     0)

    (c-set-offset 'brace-list-open  'styles-lineup-under-block)
    (c-set-offset 'brace-list-close 'styles-lineup-under-block)
    (c-set-offset 'brace-list-intro 'styles-indent-lineup-under-block)
    (c-set-offset 'brace-list-entry 'styles-indent-lineup-under-block)

    (c-set-offset 'comment-intro 0)
    (c-set-offset 'c             1)

    (c-set-offset 'cpp-define-intro -1000)
    (c-set-offset 'cpp-macro        -1000)
    (c-set-offset 'cpp-macro-cont   'c-lineup-dont-change)

    (c-set-offset 'extern-lang-open  0)
    (c-set-offset 'extern-lang-close 0)
    (c-set-offset 'inextern-lang     0)

    (c-set-offset 'namespace-open  0)
    (c-set-offset 'namespace-close 0)
    (c-set-offset 'innamespace     0))
