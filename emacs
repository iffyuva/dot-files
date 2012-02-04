;; dot-emacs        -*- emacs-lisp -*-
(setq dot-files (getenv "MYDOTFILES"))
(setq top-dir (concat dot-files "/emacs.d"))
(setq load-path (cons top-dir load-path))
(require 'dot-emacs)
