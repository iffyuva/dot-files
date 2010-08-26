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

;; get info about the system first!
(setq uname-kernel
      (replace-regexp-in-string
       "\n" ""                          ; remove '\n' at end.
       (shell-command-to-string "uname -s")))
(setq uname-host
      (replace-regexp-in-string
       "\n" ""                          ; remove '\n' at end.
       (shell-command-to-string "uname -n")))


;; emacs cant be closed accidentally.
;; syntax-highlighting.
;; enable column number mode
;; remove different bars
;; enable transient mark mode {always}
;; no tabs, only spaces
;; truncate lines only in full screen mode
;;(put 'upcase-region 'disabled nil)
(setq confirm-kill-emacs 'yes-or-no-p)
(global-font-lock-mode t)
(column-number-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(transient-mark-mode t)
(setq-default indent-tabs-mode nil)
(setq truncate-partial-width-windows t)


;; Enable display date and time option.
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time-mode t)


;; interactively do things!
(require 'ido)
(ido-mode t)

;; stop creating those backup files!
(setq make-backup-files nil)
(setq auto-save-default nil)

;; comint sub-process interaction.
(load "comint")
(setq comint-completion-addsuffix t)
(setq comint-eol-on-send t)

;; coding customizations
(require 'mad-coding)

;; my-org-mode
(require 'org-config)

;;; Other customizations.

;; load windows related customization!
(if (string-match "CYGWIN_NT-5.1" uname-kernel)
    (require 'ms-windows))

;; office relates customizations!
(if (or (string-match "pca-yuvak" uname-host)
        (string-match "eod" uname-host))
    (require 'ten2six))


;; custom-colors
(require 'cus-colors)

;;; provide this package.
(message "Loading dot-emacs...done")
(provide 'dot-emacs)
