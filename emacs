;; dot-emacs        -*- emacs-lisp -*-
(setq dot-files
      (replace-regexp-in-string
       "\n" ""                          ; remove '\n' at end.
       (shell-command-to-string
        "dirname $(ls ~/.emacs -al | cut -d'>' -f2)")))
(setq top-dir (concat dot-files "/emacs.d"))
(setq load-path (cons top-dir load-path))
(require 'dot-emacs)
