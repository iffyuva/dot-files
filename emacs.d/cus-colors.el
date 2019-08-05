;;; can't name it color-theme.
;; so, just cus-colors themes ;-)

;; custom faces
(custom-set-faces
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "outline"
                        :width normal :height 140 :weight normal
                        :slant normal :underline nil :overline nil
                        :strike-through nil :box nil :inverse-video nil
                        :foreground "white" :background "dark green"
                        :stipple nil :inherit nil)))))

;; dont link org-document-title height.
(set-face-attribute 'org-document-title nil :height 1.0)

(provide 'cus-colors)
