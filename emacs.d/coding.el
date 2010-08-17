;;; coding.el --- Yuva's emacs settings and configurations
;; 
;; my coding related stuff!


;; i love this mode!
(defun yuva/cpp-mode ()
  "C/C++ mode for me!"
  (interactive)
  (c++-mode)
  (setq indent-tabs-mode nil)
  (c-set-style "stroustrup")
  (setq c-basic-offset 3))

;; append the list.
;; regexp for .cpp, .hpp, .c, .h or .inl
(setq auto-mode-alist
      (append
       '(("\\.\\(cpp\\|hpp\\|c\\|h\\|inl\\)$" . yuva/cpp-mode))
       auto-mode-alist))

(provide 'coding)
