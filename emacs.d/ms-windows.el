;;; ms-windows.el --- Yuva's emacs settings and configurations
;; 
;; Edit this file for all the needs on windows
;; 


;; replace cmdproxy with shell!
;; shell function.
(let ((shellname (expand-file-name "/bin/bash")))
 (setenv "ESHELL" shellname)
 (setenv "SHELL" shellname)
 (setq shell-file-name shellname)
 (setq explicit-shell-file-name shellname))


;; Custom cmd function.
;; @todo Make it interactive and optional name for shell
(defun cmd()
  " runs a command prompt directly "
  (interactive)
  (let ((shellname explicit-shell-file-name))
    (setq explicit-shell-file-name "cmdproxy.exe")
    (shell "my-new-cmd")
    (setq explicit-shell-file-name shellname)
    (switch-to-buffer "my-new-cmd")))

(provide 'ms-windows)