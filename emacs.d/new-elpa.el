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


;; el-get - very useful!
(setq el-get-packages-dir "~/.emacs.d/el-get")
(add-to-list 'load-path (concat el-get-packages-dir "/el-get"))

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

;; add custom packages using el-get
(setq el-get-sources
      '((:name emacs-slim
               :type git
               :url "git://github.com/minad/emacs-slim.git"
               :description "major mode for slim"
               :website "https://github.com/dimitri/el-get"
               :features cssh)))

(setq y/el-get-packages
      (append '(cssh el-get)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync y/el-get-packages)


;;; Helper Functions
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
