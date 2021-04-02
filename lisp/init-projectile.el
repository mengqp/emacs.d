;;; init-projectile.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package projectile
  :diminish projectile-mode
  ;; :disabled t
  ;; :hook (after-init . projectile-mode)
  :init
  (projectile-mode t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'hybrid)
  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden"))
  )

(use-package counsel-projectile
  :disabled t
  :preface (setq projectile-keymap-prefix (kbd "C-c p"))
  )

(provide 'init-projectile)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-projectile.el ends here
