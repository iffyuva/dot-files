;;; mad-coding.el --- Yuva's emacs settings and configurations
;;
;; my coding related stuff!

;; No sounds please!
(setq ring-bell-function 'ignore)

(setq create-lockfiles nil)

(require 'lsp-mode)

;; Indentation = 3 spaces, i like 3.
(setq-default sh-basic-offset 3)
(setq-default perl-indent-level 3)

;; enable multi cursor mode
(require 'multiple-cursors)

;; add company mode everywhere.
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; add flycheck mode everywhere.
(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; show tip
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; i love this mode!
;; for c and cpp
(defun yk-cpp-mode ()
  "C/C++ mode for me!"
  (interactive)
  (c++-mode)
  (setq indent-tabs-mode nil)
  (c-set-style "stroustrup")
  (setq c-basic-offset 4))

(add-to-list 'auto-mode-alist
             '("\\.\\(cpp\\|hpp\\|c\\|h\\|inl\\)$" . yk-cpp-mode))


;; add latest ruby-mode
(add-to-list 'load-path (concat top-dir "/vendor/ruby-mode"))
(require 'ruby-mode)
(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'ruby-electric)
            (ruby-electric-mode t)))
(add-hook 'ruby-mode-hook #'lsp)

(add-to-list 'auto-mode-alist
             '("\\(\\.\\(rb\\|rake\\|gemspec\\)\\|Rakefile\\|Gemfile\\|prawn\\)$" . ruby-mode))

(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; add haml and sass modes
(require 'haml-mode)
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;; add slim mode
(require 'slim-mode)
(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))

;; add js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
(add-hook 'after-init-hook #'global-prettier-mode)

;; add yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; add coffee-mode
(require 'coffee-mode)
(custom-set-variables '(coffee-tab-width 2))
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))

;; add less-css-mode
(require 'less-css-mode)
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))

;; add less-css-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))


;; use html mode for jst.ejs
(add-to-list 'auto-mode-alist '("\\.jst\\." . html-mode))


;; add haskell-mode
(require 'haskell-mode)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; add elixir-mode
(require 'elixir-mode)

;; add go-mode
(require 'go-mode)

;; add typescript-mode
(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.tsx$" . typescript-mode))
(setq-default typescript-indent-level 2)
(add-hook 'typescript-mode-hook #'lsp)

(provide 'mad-coding)
