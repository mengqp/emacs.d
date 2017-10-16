;; (require 'color-theme)

;; (use-package color-theme
;;   :init
;;   ;; (require 'color-theme-solarized)
;;   ;; (load-theme 'solarized t)
;;   ;; (set-frame-parameter nil 'background-mode 'dark)    ;;选择solarized dark
;;   ;; (enable-theme 'solarized)
;;   (require 'spacemacs-theme)
;;   (load-theme 'spacemacs-dark t)
;;     )
;; (require 'spacemacs-theme)
;; (load-theme 'spacemacs-dark t)

;; (use-package cyberpunk-theme
;;   :ensure t
;;   :config
;;   (add-hook 'after-init-hook
;; 	    (lambda () (load-theme 'cyberpunk t)))
;;   )

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t)
  )

;; (use-package doom-themes
;;   :ensure t
;;   :config
;; ;; Global settings (defaults)
;; (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; ;; may have their own settings.
;; (load-theme 'doom-one t)

;; ;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)

;; ;; Enable custom neotree theme
;; ;; (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; ;; Corrects (and improves) org-mode's native fontification.
;; (doom-themes-org-config)

;;   )


(provide 'init-color-theme)
