
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  ;; enable the default configuration
  (use-package smartparens-config)
  (smartparens-global-mode t)

  )
;; (require 'smartparens)

;;  ;; enable the default configuration
;; (require 'smartparens-config)

;; (smartparens-global-mode t)

(provide 'init-smartparens)
