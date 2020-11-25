;;; init-org.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :defer t
  :init
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
				   (org-agenda-files :maxlevel . 9))))

  (setq org-html-validation-link nil)
  (setq org-directory mengqp-org-dir)

  :config
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
  ;; (require 'init-deft)
  ;; (require 'init-org-pomodoro)
  (require 'init-org-ui)
  ;; (require 'init-journal)
  (require 'init-agenda)
  ;; (require 'init-org-brain)
  ;; (require 'init-tex)
  ;; (require 'init-ox-latex)
  ;; (require 'init-org-roam)

  )



(provide 'init-org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
