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

  (setq-default mengqp-org-dir "~/nutdata/myorg/")
  (setq-default mengqp-org-mobile-dic "~/nutdata/org/")
  (when *win64*
    (setq-default mengqp-org-dir "E:/Nutstore/myorg/")
    (setq-default mengqp-org-mobile-dic "E:/Nutstore/org/")
    )
  (setq-default mengqp-org-journal-file (concat mengqp-org-dir "/general/journal.org") )
  (setq-default mengqp-org-gtd-file (concat mengqp-org-dir "/general/gtd.org") )
  (setq-default mengqp-org-meet-file (concat mengqp-org-dir "/general/meet.org") )
  (setq-default mengqp-org-memo-file (concat mengqp-org-dir "/general/memo.org") )
  (setq-default mengqp-org-idea-file (concat mengqp-org-dir "/general/idea.org") )
  (setq-default mengqp-org-summarize-file (concat mengqp-org-dir "/general/summarize.org"))
  (setq-default mengqp-org-diary-dir (concat mengqp-org-dir "diary/"))
  (setq-default mengqp-org-mobile-index-file (concat mengqp-org-mobile-dic "index.org"))
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
