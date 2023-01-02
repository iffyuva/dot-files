;; dot-emacs        -*- emacs-lisp -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq dot-files (getenv "MYDOTFILES"))
(setq top-dir (concat dot-files "/emacs.d"))
(setq load-path (cons top-dir load-path))
(require 'dot-emacs)
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function 'browse-url-firefox)
 '(coffee-tab-width 2)
 '(package-selected-packages
   '(lsp-ui lsp-mode exec-path-from-shell flycheck typescript-mode prettier prettier-js helm terraform-mode less-css-mode haml-mode org yaml-mode slim-mode sass-mode rubocop multiple-cursors markdown-mode js2-mode haskell-mode go-mode flycheck-pos-tip elixir-mode company coffee-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "outline" :width normal :height 140 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "white" :background "dark green" :stipple nil :inherit nil)))))
