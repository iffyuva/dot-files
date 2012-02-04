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

(defun trim-string (str)
  (replace-regexp-in-string "^[ \t]+" ""
                            (replace-regexp-in-string "[ \t\n]+$" "" str)))

;; get info about the system first!
(setq uname-kernel (trim-string (shell-command-to-string "uname -s")))
(setq uname-host   (trim-string (shell-command-to-string "uname -n")))
(setq is-workplace (or (string-match "pca-yuvak" uname-host) (string-match "eod" uname-host)))
(setq is-mswindoze (string-match "CYGWIN_NT-5.1" uname-kernel))
(setq is-freebird  (and (not is-workplace) (not is-mswindoze)))

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
(windmove-default-keybindings)          ; windmove from hemant!

;; Enable display date and time option.
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time-mode t)

;; interactively do things!
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

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

;; start loading customizations one after another!
(require 'mad-coding)
(require 'org-config)
(if is-mswindoze (require 'ms-windows))
(if is-workplace (require 'ten2six))
(if is-freebird  (require 'funky-emms))
(require 'cus-colors)

;; misc clipboard settings
(if is-freebird
    (setq x-select-enable-clipboard t)
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value))

;; start the server!
(server-start)

;;; provide this package.
(message "Loading dot-emacs...done")
(provide 'dot-emacs)
