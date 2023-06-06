;;; org-config.el --- Yuva's org settings and configurations
;;
;; Well, edit this file for all the needs.
;; Before loading this file, one has to set top-dir variable
;; to the root directory of the org folder.
;;
;; Note : Most of these ideas are taken from urls
;; - http://doc.norang.ca/org-mode.html
;; - http://alexicalmistake.com/2008/07/experiments-in-emacs/


;; org-mode
(require 'org)

(add-to-list 'auto-mode-alist
             '("\\.\\(org\\|org-archive\\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; org mode hook.
(add-hook 'org-mode-hook
          (lambda ()
            (setq fill-column 72)))       ; column width


;; TODO sequences
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)")))

(setq org-todo-keyword-faces
      '(("TODO" :foreground "yellow" :weight bold)
        ("STARTED" :foreground "pink" :weight bold)
        ("DONE" :foreground "red" :weight bold)))

;; org-files. NOTE: don't fail if you fail to find them!
(if (file-exists-p (concat top-dir "/org-files/capture.org"))
    (progn
      (setq org-agenda-files
            (list (concat top-dir "/org-files/codemancers.org")
                  (concat top-dir "/org-files/capture.org")
                  (concat top-dir "/org-files/habits.org" )))
      (setq org-default-notes-file
            (concat top-dir "/org-files/capture.org")))
  (message "Can't find org-files, just check your system"))

;; org-capture {replaced remember-el}
(require 'org-capture)
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      `(("t" "todo" entry (file ,(concat top-dir "/org-files/capture.org"))
         "* TODO %?\n  %U\n  %a")))

;; refile captured tasks.
(setq org-completion-use-ido t)
(setq org-refile-targets
      '((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5)))
(setq org-refile-use-outline-path '(file))
(setq org-outline-path-complete-in-steps t)


;; generic function to move state of a todo from first state to second state
(defun switch-state-on-clock-in (todo)
  (if (or (string= todo "TODO") (string= todo "STARTED") (string= todo "DONE"))
      "STARTED"
    "in-progress"))

;; clocking & logging
(setq org-clock-persist t)
(org-clock-persistence-insinuate)
(setq org-clock-into-drawer t)
(setq org-clock-history-length 35)
(setq org-clock-in-resume t)
(setf org-clock-in-switch-to-state 'switch-state-on-clock-in)
(setq org-clock-out-when-done nil)
(setq org-log-done '(time))
(setq org-log-into-drawer t)


;; agenda, reporting and creating effort sheets
(setq org-agenda-custom-commands
      '(("r" "Refile New Notes and Tasks" tags "CAPTURE"
         ((org-agenda-todo-ignore-with-date nil)))))
(setq org-deadline-warning-days 30)
(setq org-agenda-clockreport-parameter-plist '(:link nil :maxlevel 3))

;; set format for archive extension.
(setq org-archive-location "%s-archive::")

;; latex customizations.
;; (require 'org-latex)
;; (add-to-list 'org-export-latex-classes
;;              '("orgarticle"
;;                "\\documentclass[11pt]{orgarticle}
;;                [NO-DEFAULT-PACKAGES]"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; add org-habits to org-modules list:
(add-to-list 'org-modules 'org-habit)


;; provide org-config
(provide 'org-config)
