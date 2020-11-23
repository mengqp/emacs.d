;;; init-org-roam.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package org-roam-server
  :ensure t
  :defer t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))


(use-package org-roam
  :ensure t
  :defer t
  :hook
  (org-mode . org-roam-mode)
  :custom
  (org-roam-directory "/home/mengqp/nutdata/myorg/roam/")
  )

(use-package company-org-roam
  :ensure t
  :defer t
  :config
  (push 'company-org-roam company-backends)
  )

(provide 'init-org-roam)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org-roam.el ends here
