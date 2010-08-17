;;; ten2six.el --- Yuva's emacs settings and configurations
;; 
;; office related stuff!

(message "Loading ten2six...")

;; first change the font size
(if (string-match "pca-yuvak" uname-host)
    (set-face-attribute 'default nil :height 98)
  (if (string-match "eod" uname-host)
      (set-face-attribute 'default nil :height 122))
  (message "where are you working!?"))


;; this mode is not elegant, but those are the coding guidelines!
;; just use it, no matter what.
(defun t2s/c-mode ()
  "C mode at office!"
  (interactive)
  (c-mode)
  (setq indent-tabs-mode nil)
  (c-set-style "whitesmith")
  (setq c-basic-offset 4))

;; append the list.
(setq auto-mode-alist
      (append
       '((".*/ten2six/.*\\.[ch]$"  . t2s/c-mode)
         (".*/e0636439/.*\\.[ch]$" . t2s/c-mode))
       auto-mode-alist))


(provide 'ten2six)
