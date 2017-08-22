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

(use-package cyberpunk-theme
  :ensure t
  :config
  (add-hook 'after-init-hook
	    (lambda () (load-theme 'cyberpunk t)))
  )

(provide 'init-color-theme)
