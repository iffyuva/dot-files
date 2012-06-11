;;; new-emacs.el --- Yuva's emacs 24 elpa configuration
;;

(require 'package)

;; elpa packages
;; http://emacswiki.org/emacs/ELPA
(setq package-archives '(("melpa"     . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("ELPA"      . "http://tromey.com/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")))
(package-initialize)


;; set of required packages
(setq y/required-packages '(org emms
                            auto-complete
                            yasnippet
                            coffee-mode
                            yaml-mode
                            haml-mode
                            sass-mode
                            js2-mode))

(dolist (pkg y/required-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))


(defun y/substr (str1 str2)
  (if (>= (length str2) (length str1))
      (string-equal str1 (substring str2 0 (length str1)))))

;; helper to return the path of installed package
(defun y/package-path (package)
  (if (package-installed-p package)
      (dolist (dir (directory-files package-user-dir))
        (if (y/substr (symbol-name package) dir)
            (return (concat package-user-dir "/" dir))))))


(provide 'new-elpa)
