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
(setq required-packages '(org emms
                          auto-complete
                          yasnippet
                          coffee-mode
                          yaml-mode
                          haml-mode
                          sass-mode
                          js2-mode))

(dolist (pkg required-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))


(provide 'new-elpa)
