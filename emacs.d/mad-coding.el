;;; coding.el --- Yuva's emacs settings and configurations
;;
;; my coding related stuff!


;; Indentation = 3 spaces, i like 3.
(setq-default tab-width 3)
(setq-default sh-basic-offset 3)
(setq-default perl-indent-level 3)


;; add yasnippets.
(add-to-list 'load-path (concat top-dir "/vendor/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(setq yas/snippet-dirs (concat top-dir "/vendor/yasnippet/snippets"))
(yas/load-directory yas/snippet-dirs)

;; add auto-completions everywhere.
(add-to-list 'load-path (concat top-dir "/vendor/auto-complete"))
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat top-dir "/vendor/auto-complete/dict"))
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
(add-to-list 'load-path (concat top-dir "/vendor/haml-mode"))
(add-to-list 'load-path (concat top-dir "/vendor/sass-mode"))
(require 'haml-mode)
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(add-to-list 'ac-modes 'haml-mode)
(add-to-list 'ac-modes 'sass-mode)

;; add javascript2 mode
(add-to-list 'load-path (concat top-dir "/vendor/js2-mode"))
(autoload 'js2-mode "js2-mode" nil t)
(setq js2-auto-indent-p t)
(setq js2-use-ast-for-indentation-p t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|js\\.erb\\)$" . js2-mode))
(add-to-list 'ac-modes 'js2-mode)


;; add yaml mode
(add-to-list 'load-path (concat top-dir "/vendor/yaml-mode"))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; add cucumber-mode
(add-to-list 'load-path (concat top-dir "/vendor/cucumber-mode"))
(require 'feature-mode)
(yas/load-directory (concat top-dir "/vendor/cucumber-mode/snippets"))
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; add coffee-mode
(add-to-list 'load-path (concat top-dir "/vendor/coffee-mode"))
(require 'coffee-mode)


;; setup rinari
(add-to-list 'load-path (concat top-dir "/vendor/rinari"))
(require 'rinari)
(setq rinari-tags-file-name "TAGS")


;; add rhtml mode {checking this stuff}
(add-to-list 'load-path (concat top-dir "/vendor/rhtml-mode"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))


;; try cedet, um my 2nd attempt
(add-to-list 'load-path (concat top-dir "/cedet"))
(add-to-list 'load-path (concat top-dir "/cedet/common"))
(add-to-list 'load-path (concat top-dir "/cedet/eieio"))
(add-to-list 'load-path (concat top-dir "/cedet/ede"))
(add-to-list 'load-path (concat top-dir "/cedet/semantic"))
(add-to-list 'load-path (concat top-dir "/cedet/semantic/wisent"))
(add-to-list 'load-path (concat top-dir "/cedet/semantic/bovine"))
(add-to-list 'load-path (concat top-dir "/cedet/srecode"))
;; (require 'eieio)
;; (require 'ede)
;; (require 'semantic)
;; (require 'srecode)

(load-file (concat top-dir "/cedet/common/cedet.el"))
(global-ede-mode t)
;; (semantic-load-enable-code-helpers)
(semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-all-exuberent-ctags-support)
;; (semantic-load-enable-primary-exuberent-ctags-support)
(global-srecode-minor-mode 1)

(require 'semanticdb)
(global-semanticdb-minor-mode 1)
(semanticdb-enable-cscope-databases)

(provide 'mad-coding)
