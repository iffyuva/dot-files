;;; coding.el --- Yuva's emacs settings and configurations
;;
;; my coding related stuff!


;; Indentation = 3 spaces, i like 3.
(setq-default tab-width 3)
(setq-default sh-basic-offset 3)
(setq-default perl-indent-level 3)


;; add yasnippets.
(require 'yasnippet)
(yas/initialize)
(setq yas/snippet-dirs (concat (y/package-path 'yasnippet) "/snippets"))
(yas/load-directory yas/snippet-dirs)

;; add auto-completions everywhere.
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories
             (concat (y/package-path 'auto-complete) "/dict"))
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
(add-to-list 'load-path (concat top-dir "/vendor/ruby-mode"))
(require 'ruby-mode)
(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'ruby-electric)
            (ruby-electric-mode t)))

(add-to-list 'auto-mode-alist
             '("\\(\\.\\(rb\\|rake\\|gemspec\\)\\|Rakefile\\|Gemfile\\)$" . ruby-mode))


;; add haml and sass modes
(require 'haml-mode)
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(add-to-list 'ac-modes 'haml-mode)
(add-to-list 'ac-modes 'sass-mode)

;; add javascript2 mode
(autoload 'js2-mode "js2-mode" nil t)
(setq js2-auto-indent-p t)
(setq js2-use-ast-for-indentation-p t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|js\\.erb\\)$" . js2-mode))
(add-to-list 'ac-modes 'js2-mode)


;; add yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; add cucumber-mode
(add-to-list 'load-path (concat top-dir "/vendor/cucumber-mode"))
(require 'feature-mode)
(yas/load-directory (concat top-dir "/vendor/cucumber-mode/snippets"))
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; add coffee-mode
(require 'coffee-mode)
(add-to-list 'ac-modes 'coffee-mode)
(add-hook 'coffee-mode-hook
          '(lambda()
             (set (make-local-variable 'tab-width) 2)))

;; add slim-mode
(add-to-list 'load-path (concat el-get-packages-dir "/emacs-slim"))
(require 'slim-mode)
(add-to-list 'ac-modes 'slim-mode)
(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))

;; add less-css-mode
(require 'less-css-mode)
(add-to-list 'ac-modes 'less-css-mode)
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))

;; ;; try cedet, um my 2nd attempt
;; (add-to-list 'load-path (concat top-dir "/cedet"))
;; (add-to-list 'load-path (concat top-dir "/cedet/common"))
;; (add-to-list 'load-path (concat top-dir "/cedet/eieio"))
;; (add-to-list 'load-path (concat top-dir "/cedet/ede"))
;; (add-to-list 'load-path (concat top-dir "/cedet/semantic"))
;; (add-to-list 'load-path (concat top-dir "/cedet/semantic/wisent"))
;; (add-to-list 'load-path (concat top-dir "/cedet/semantic/bovine"))
;; (add-to-list 'load-path (concat top-dir "/cedet/srecode"))
;; ;; (require 'eieio)
;; ;; (require 'ede)
;; ;; (require 'semantic)
;; ;; (require 'srecode)

;; (load-file (concat top-dir "/cedet/common/cedet.el"))
;; (global-ede-mode t)
;; ;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; ;; (semantic-load-enable-all-exuberent-ctags-support)
;; ;; (semantic-load-enable-primary-exuberent-ctags-support)
;; (global-srecode-minor-mode 1)

;; (require 'semanticdb)
;; (global-semanticdb-minor-mode 1)
;; (semanticdb-enable-cscope-databases)

(provide 'mad-coding)
