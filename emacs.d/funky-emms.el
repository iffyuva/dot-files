;;; funky-emms.el --- Yuva's multimedia related stuff
;;
;; my emms related stuff!


;; most of the stuff is from website
(add-to-list 'load-path (concat top-dir "/vendor/emms/lisp"))
(require 'emms-setup)
(emms-standard)
(emms-default-players)

(add-hook 'emms-player-started-hook 'emms-show) ; Show the current track
(setq emms-show-format "NP: %s")

(setq emms-source-file-default-directory "~/Music/")


;;; provide this package
(provide 'funky-emms)
