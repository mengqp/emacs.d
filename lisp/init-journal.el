;;; init-journal.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package org-crypt
  :ensure nil
  :config
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  ;; (setq org-crypt-key nil)
  )

(use-package epa-file
  :ensure nil
  :config
  (setq epa-file-enable t
	epa-file-encrypt-to "meng_qingpu@126.com"
	epa-file-select-keys 't
	;; epa-file-select-keys 'silent
	;; epa-file-cache-passphrase-for-symmetric-encryption t
	)

  ;; auto-save
  (setq epa-file-inhibit-auto-save nil)

  ;; (custom-set-variables
  ;; '(epg-gpg-program "/usr/bin/gpg1"))

  ;; (setq epg-config--program-alist   `((OpenPGP
  ;;    epg-gpg-program
  ;;    ("gpg1" . "1.4.3") ("gpg" . ,epg-gpg-minimum-version))
  ;;   (CMS
  ;;    epg-gpgsm-program
  ;;    ("gpgsm" . "2.2.15"))))
  )

(use-package org-journal
  :ensure t
  :defer t
  :config
  (setq auto-mode-alist (cons '("\\.org.gpg$" . org-journal-mode) auto-mode-alist))
  (setq org-journal-file-type 'monthly
	;; org-journal-file-format "%Y-%m-%d.org"
	org-journal-file-format "%Y.org"
	org-journal-dir mengqp-org-diary-dir
	org-journal-date-format "%A, %d %B %Y"
	;; org-journal-enable-encryption t
	;; org-journal-encrypt-journal t
	;; org-journal-encrypt-on 'kill-buffer-hook
	)
  ;; When =org-journal-file-pattern= has the default value, this would be the regex.
  (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
  (add-to-list 'org-agenda-files org-journal-dir)

  (defun org-journal-find-location ()
    ;; Open today's journal, but specify a non-nil prefix argument in order to
    ;; inhibit inserting the heading; org-capture will insert the heading.
    (org-journal-new-entry t)
    ;; Position point on the journal's top-level heading so that org-capture
    ;; will add the new entry as a child entry.
    (goto-char (point-min)))
  )


(provide 'init-journal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-journal.el ends here
