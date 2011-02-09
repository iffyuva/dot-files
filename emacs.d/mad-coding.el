;;; coding.el --- Yuva's emacs settings and configurations
;; 
;; my coding related stuff!


;; Indentation = 3 spaces, i like 3.
(setq-default tab-width 3)
(setq-default sh-basic-offset 3)
(setq-default perl-indent-level 3)


;; add yasnippets.
(add-to-list 'load-path (concat top-dir "/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(setq yas/snippet-dirs (concat top-dir "/yasnippet/snippets"))
(yas/load-directory yas/snippet-dirs)

;; add auto-completions everywhere.
(add-to-list 'load-path (concat top-dir "/auto-complete"))
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat top-dir "/auto-complete/dict"))
(require 'auto-complete-config)
(ac-config-default)


;; i love this mode!
;; for c and cpp
(defun yk-cpp-mode ()
  "C/C++ mode for me!"
  (interactive)
  (c++-mode)
  (setq indent-tabs-mode nil)
  (c-set-style "stroustrup")
  (setq c-basic-offset 3))

(add-to-list 'auto-mode-alist
             '("\\.\\(cpp\\|hpp\\|c\\|h\\|inl\\)$" . yk-cpp-mode))


;; add latest ruby-mode
(add-to-list 'load-path (concat top-dir "/ruby-mode"))
(require 'ruby-mode)
(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'ruby-electric)
            (ruby-electric-mode t)))

(add-to-list 'auto-mode-alist
             '("\\(\\.\\(rb\\|rake\\|gemspec\\)\\|Rakefile\\|Gemfile\\)$" . ruby-mode))


;; add haml and sass modes
(add-to-list 'load-path (concat top-dir "/haml-mode"))
(add-to-list 'load-path (concat top-dir "/sass-mode"))
(require 'haml-mode)
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;; add javascript2 mode
(add-to-list 'load-path (concat top-dir "/js2-mode"))
(autoload 'js2-mode "js2-mode" nil t)
(setq js2-auto-indent-p t)
(setq js2-use-ast-for-indentation-p t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; add yaml mode
(add-to-list 'load-path (concat top-dir "/yaml-mode"))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; add cucumber-mode
(add-to-list 'load-path (concat top-dir "/cucumber-mode"))
(require 'feature-mode)
(yas/load-directory (concat top-dir "/cucumber-mode/snippets"))
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))


;; setup rinari
(add-to-list 'load-path (concat top-dir "/rinari"))
(require 'rinari)


;; add rhtml mode {checking this stuff}
(add-to-list 'load-path (concat top-dir "/rhtml-mode"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

(provide 'mad-coding)
