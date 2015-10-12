;;; coding.el --- Yuva's emacs settings and configurations
;;
;; my coding related stuff!


;; Indentation = 3 spaces, i like 3.
(setq-default sh-basic-offset 3)
(setq-default perl-indent-level 3)


;; add yasnippets.
(require 'yasnippet)
(print yas-snippet-dirs)
(add-to-list 'yas-snippet-dirs
             (concat
              (package-desc-dir (car (cdr (assq 'yasnippet package-alist))))
              "/snippets"))
(if (file-exists-p "~/emacs.d/snippets")
    (add-to-list 'yas-snippet-dirs "~/emacs.d/snippets"))
(yas-global-mode 1)

;; add company mode everywhere.
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


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

(add-to-list 'auto-mode-alist
             '("\\(\\.\\(rb\\|rake\\|gemspec\\)\\|Rakefile\\|Gemfile\\|prawn\\)$" . ruby-mode))

;; add rspec mode
(require 'compile-rspec)

;; add haml and sass modes
(require 'haml-mode)
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;; add javascript2 mode
(autoload 'js2-mode "js2-mode" nil t)
(setq js2-basic-offset 2)
(setq js2-auto-indent-p t)
(setq js2-use-ast-for-indentation-p t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|js\\.erb\\)$" . js2-mode))

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


(provide 'mad-coding)
