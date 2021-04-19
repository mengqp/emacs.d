;;; init-theme.el --- init-theme -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
;; (load-theme 'manoj-dark)

(use-package doom-themes
  :disabled t
  :init
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (add-hook 'after-init-hook
	    (lambda () (load-theme 'doom-one t)))
  ;; (add-hook 'after-init-hook
  ;; 	    (lambda () (load-theme 'doom-tomorrow-night t)))
  :config
  (doom-themes-org-config)
  )

(use-package modus-themes
  ;; :disabled
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-slanted-constructs t
        modus-themes-bold-constructs nil)

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  ;; (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)
  (modus-themes-load-vivendi)
  )


(provide 'init-theme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-theme.el ends here
