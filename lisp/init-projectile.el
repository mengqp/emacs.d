;;; init-projectile.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package projectile
  :diminish projectile-mode
  ;; :disabled t
  ;; :hook (after-init . projectile-mode)
  :defer 2
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'hybrid)
  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden"))
  :config
  (projectile-mode t)
  )

(use-package counsel-projectile
  :after projectile
  )

(provide 'init-projectile)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-projectile.el ends here
