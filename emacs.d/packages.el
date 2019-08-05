;;; packages.el --- Yuva's emacs settings and configurations
;;
;; Installing packages using package.el

;; Add melpa to package system
(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Instead of pinning packages, lets set melpa-stable as highest priority one
;; (setq package-pinned-packages '((company . "melpa-stable")))
(setq package-archive-priorities '(("melpa-stable" . 2) ("melpa" . 1)))

(package-initialize)

(package-install 'org)
(package-install 'multiple-cursors)
(package-install 'yasnippet)
(package-install 'emms)
(package-install 'company)
(package-install 'markdown-mode)
(package-install 'coffee-mode)
(package-install 'yaml-mode)
(package-install 'haml-mode)
(package-install 'slim-mode)
(package-install 'sass-mode)
(package-install 'js2-mode)
(package-install 'less-css-mode)
(package-install 'rubocop)
(package-install 'flycheck-pos-tip)
(package-install 'haskell-mode)
(package-install 'elm-mode)
(package-install 'elixir-mode)
(package-install 'go-mode)


(provide 'packages)
