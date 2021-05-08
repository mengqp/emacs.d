;;; init-org.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package org
  :mode ("\\.org\\'" . org-mode)
  :init
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
				   (org-agenda-files :maxlevel . 9))))

  (setq org-html-validation-link nil)
  (setq org-directory mengqp-org-dir)
  (setq truncate-lines nil)

  (defun org-export-docx ()
    (interactive)
    (let ((docx-file (concat (file-name-sans-extension (buffer-file-name)) ".docx"))
          (template-file "/home/mengqp/.emacs.d/mysnippets/pandoc/docx/template.docx"))
      (shell-command (format "pandoc %s -o %s --reference-doc=%s" (buffer-file-name) docx-file template-file))
      (message "Convert finish: %s" docx-file)))

  :config
  ;; (require 'init-deft)
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
