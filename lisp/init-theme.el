;;; init-theme.el --- init-theme -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
;; (load-theme 'manoj-dark)

(use-package cyberpunk-theme
  :ensure t
  :disabled t
  :defer t
  :init
  (add-hook 'after-init-hook
	    (lambda () (load-theme 'cyberpunk t)))
  )

(use-package modus-operandi-theme
  :disabled t
  :defer t
  :ensure t)


(use-package modus-vivendi-theme
  :ensure t
  ;; :disabled t
  :defer t
  :hook (after-init . (lambda ()
			(load-theme 'modus-vivendi t)))
  :init
  ;; Choose to render some code constructs in slanted text (italics).  The
  ;; default, shown below, is to not use italics, unless it is absolutely
  ;; necessary.
  (setq modus-operandi-theme-slanted-constructs nil)

  (setq modus-vivendi-theme-slanted-constructs nil)

  ;; Use proportionately-spaced fonts (variable-pitch) for headings.  The
  ;; default is to use whatever font the user has selected, typically a
  ;; monospaced typeface.
  (setq modus-operandi-theme-proportional-fonts nil)

  (setq modus-vivendi-theme-proportional-fonts nil)

  ;; Whether headings should be scaled or have the same height as body
  ;; text.  The default is to keep everything the same as the base size.
  (setq modus-operandi-theme-scale-headings nil)

  (setq modus-vivendi-theme-scale-headings nil)

  ;; Font scale that should apply to headings.  These are the default values.
  (setq modus-operandi-theme-scale-1 1.05)
  (setq modus-operandi-theme-scale-2 1.1)
  (setq modus-operandi-theme-scale-3 1.15)
  (setq modus-operandi-theme-scale-4 1.2)

  (setq modus-vivendi-theme-scale-1 1.05)
  (setq modus-vivendi-theme-scale-2 1.1)
  (setq modus-vivendi-theme-scale-3 1.15)
  (setq modus-vivendi-theme-scale-4 1.2)
  )

(provide 'init-theme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-theme.el ends here
