;;; dot-emacs.el --- Yuva's emacs settings and configurations
;;
;; Well, edit this file for all the needs.
;; Before loading this file, one has to set top-dir
;; variable to the root directory of the dot-emacs folder.
;;
;; ;; dot-emacs
;; (setq top-dir (expand-file-name "dot-emacs" "~"))
;; (setq load-path (cons top-dir load-path))
;; (require 'dot-emacs)


;;; Top level emacs file.

;; some descent customizations
(setq confirm-kill-emacs 'yes-or-no-p)  ; emacs cant be closed accidentally.
(defalias 'yes-or-no-p 'y-or-n-p)       ; alias for yes-or-no
(global-font-lock-mode t)               ; syntax-highlighting
(column-number-mode t)                  ; enable column number mode
(tool-bar-mode -1)                      ; remove different bars
(scroll-bar-mode -1)                    ; remove different bars
(menu-bar-mode -1)                      ; remove different bars
(transient-mark-mode t)                 ; enable transient mark mode {always}
(setq-default indent-tabs-mode nil)     ; no tabs, only spaces
(setq-default show-trailing-whitespace t) ; warn trailing whitespaces
(setq truncate-partial-width-windows t) ; truncate lines in full screen mode
(setq make-backup-files nil)            ; stop creating those backup files!
(setq auto-save-default nil)            ; dont autosave stuff

;; Enable display date and time option.
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time-mode t)

(require 'packages)


;; interactively do things!
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Load helm all the way on the top
(require 'helm-config)
(helm-mode t)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; comint sub-process interaction.
(load "comint")
(setq comint-completion-addsuffix t)
(setq comint-eol-on-send t)

;; uniquify buffer names
;; http://trey-jackson.blogspot.com/2008/01/emacs-tip-11-uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator ":")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; ansi color for compilation mode
(require 'ansi-color)

;; start loading customizations one after another!
(require 'mad-coding)
(require 'org-config)
(require 'cus-colors)

;; misc clipboard settings
(setq x-select-enable-clipboard t)

;; start the server!
(server-start)


;;; provide this package.
(message "Loading dot-emacs...done")
(provide 'dot-emacs)
