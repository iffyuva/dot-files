;;; packages.el --- Yuva's emacs settings and configurations
;;
;; Installing packages using package.el

;; Add melpa to package system
(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Instead of pinning packages, lets set melpa-stable as highest priority one
;; (setq package-pinned-packages '((company . "melpa-stable")))
;; (setq package-archive-priorities '(("melpa-stable" . 2) ("melpa" . 1)))

(package-initialize)
;; (package-refresh-contents)

(package-install 'org)
(package-install 'quelpa)
(package-install 'exec-path-from-shell)
(package-install 'multiple-cursors)
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
(package-install 'flycheck)
(package-install 'flycheck-pos-tip)
(package-install 'haskell-mode)
(package-install 'elixir-mode)
(package-install 'go-mode)
(package-install 'terraform-mode)
(package-install 'helm)
(package-install 'rjsx-mode)
(package-install 'prettier)
(package-install 'typescript-mode)
(setq package-pinned-packages '((lsp-mode . "melpa")))
(package-install 'lsp-mode)
(package-install 'lsp-ui)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'packages)
