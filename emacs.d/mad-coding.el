;;; coding.el --- Yuva's emacs settings and configurations
;; 
;; my coding related stuff!


;; Indentation = 3 spaces, i like 3.
(setq-default tab-width 3)
(setq-default sh-basic-offset 3)
(setq-default perl-indent-level 3)


;; i love this mode!
(defun yk-cpp-mode ()
  "C/C++ mode for me!"
  (interactive)
  (c++-mode)
  (setq indent-tabs-mode nil)
  (c-set-style "stroustrup")
  (setq c-basic-offset 3))

;; add latest ruby-mode
(add-to-list 'load-path (concat top-dir "/ruby-mode"))
(require 'ruby-mode)

;; add yasnippets.
(add-to-list 'load-path (concat top-dir "/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(setq yas/snippet-dirs (concat top-dir "/yasnippet/snippets"))
(yas/load-directory yas/snippet-dirs)

;; add auto-complete mode.
(add-to-list 'load-path (concat top-dir "/auto-complete"))
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat top-dir "/auto-complete/dict"))
(require 'auto-complete-config)
(ac-config-default)

;; append the list.
;; regexp for .cpp, .hpp, .c, .h or .inl
(setq auto-mode-alist
      (append
       '(("\\.\\(cpp\\|hpp\\|c\\|h\\|inl\\)$" . yk-cpp-mode))
       '(("Rakefile$" . ruby-mode))
       auto-mode-alist))

(provide 'mad-coding)
