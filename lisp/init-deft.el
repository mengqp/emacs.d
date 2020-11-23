;;; init.deft.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package deft
  :ensure t
  :defer t
  :disabled t
  :config
  (setq deft-extensions '("txt" "org" "gpg"))
  (setq deft-directory mengqp-org-dir)
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)
  (setq deft-text-mode 'org-mode)
  (setq deft-auto-save-interval 0)
  )

(provide 'init-deft)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.deft.el ends here
