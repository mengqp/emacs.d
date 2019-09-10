;;; init-org.el --- xxx -*- coding: utf-8-unix -*-

;;; Copyright © 2018 - 2018 mengqp.

;; Author: mengqp
;; URL:
;; Version:0.0.1
;; Keywords:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; recursively find .org files in provided directory
;; modified from an Emacs Lisp Intro example
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

(defun sa-find-org-file-recursively (&optional directory filext)
  "Return .org and .org_archive files recursively from DIRECTORY.
If FILEXT is provided, return files with extension FILEXT instead."
  (interactive "DDirectory: ")
  (let* (org-file-list
	 (case-fold-search t)	      ; filesystems are case sensitive
	 (file-name-regex "^[^.#].*") ; exclude dot, autosave, and backup files
	 (filext (or filext "org$\\\|org_archive"))
	 (fileregex (format "%s\\.\\(%s$\\)" file-name-regex filext))
	 (cur-dir-list (directory-files directory t file-name-regex)))
    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
      (cond
       ((file-regular-p file-or-dir) ; regular files
	(if (string-match fileregex file-or-dir) ; org files
	    (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)
	(dolist (org-file (sa-find-org-file-recursively file-or-dir filext)
			  org-file-list) ; add files found to result
	  (add-to-list 'org-file-list org-file)))))))


(use-package htmlize
  :ensure t
  :defer t
  :after org
  )

(use-package org-pomodoro
  :ensure t
  :defer t
  :after org
  :init
  (setq org-pomodoro-killed-sound t)
  (setq org-pomodoro-length 25)
  (setq org-pomodoro-format "•%s")
  (setq org-pomodoro-short-break-format "•%s")
  (setq-default mode-line-format
		(cons '(pomodoro-mode-line-string pomodoro-mode-line-string)
		      mode-line-format))
  )

(use-package org-bullets
  :defer t
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(use-package toc-org
  :defer t
  :ensure t
  :init
  (add-hook 'org-mode-hook 'toc-org-mode)
  )


(use-package org
  :ensure t
  :defer t
  :init
  :config

  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

  ;; 设置 agent 文件表
  (setq org-agenda-text-search-extra-files
	(append
	 (sa-find-org-file-recursively mengqp-org-dir "org")
	 ))

  (setq org-agenda-files org-agenda-text-search-extra-files)


  (defun org-journal-find-location ()
    ;; Open today's journal, but specify a non-nil prefix argument in order to
    ;; inhibit inserting the heading; org-capture will insert the heading.
    (org-journal-new-entry t)
    ;; Position point on the journal's top-level heading so that org-capture
    ;; will add the new entry as a child entry.
    (goto-char (point-min)))

  (defconst org-capture-templates
    '(
      ("j" "Journal 日常工作记录" entry (file+datetree mengqp-org-journal-file )
       ;; ("j" "Journal 日常工作记录" entry (file+datetree "~/nutdata/myorg/general/journal.org")
       "*  %? \n %U\n %i\n ")
      ("t" "Todo gdt" entry (file+headline mengqp-org-gtd-file "Tasks")
       "* TODO [#B] %? \n %i\n")
      ("m" "meet 会议记录" entry (file+datetree mengqp-org-meet-file)
       "* %? \n %i\n ")
      ("M" "memo 备忘 加班记录等" entry (file+datetree mengqp-org-memo-file)
       "* %?  %i\n ")
      ("i" "idea 乱七八糟的想法" entry (file+datetree mengqp-org-idea-file)
       "* %? \n \nEntered on %U\n %i\n ")
      ("s" "Summarize 总结" entry (file+headline mengqp-org-summarize-file "summarize")
       "*  %? \n %i\n ")
      ("d" "diary entry" entry (function org-journal-find-location)
       "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")
      ))

  (setq org-refile-targets (quote ((nil :maxlevel . 9)
				   (org-agenda-files :maxlevel . 9))))

  (setq org-src-fontify-natively t)

  (setq org-tag-alist '(
			("@bug" . ?b)
			("@feature" . ?f)
			("@repeat" . ?r)
			("@invalid" . ?i)
			("@wontfix" . ?w)
			("@discuss" . ?d)
			("@suspend" . ?s)
			("@close" . ?c)
			("@Fixed" . ?F)
			))
  ;; 不同 tag 外观
  (setq org-tag-faces
	'(("@bug" . (:background "red" :foreground "white" :weight bold))
	  ("@feature" . (:background "DarkOrange" :foreground "white" :weight bold))
	  ("@discuss" . (:background "yellow" :foreground "DarkGreen" :weight bold))
	  ("@suspend" . (:background "yellow" :foreground "DarkGreen" :weight bold))
	  ("@wontfix" . (:background "DodgerBlue" :foreground "black" :weight bold))
	  ("@repeat" . (:background "SkyBlue" :foreground "black" :weight bold))
	  ("@invalid" . (:background "SkyBlue" :foreground "black" :weight bold))
	  ))
  ;; 设置 todo
  (setq org-todo-keywords
	(quote ((sequence "TODO(t)" "ISSUE(i@/!)" "SELF-TEST(s@/!)" "|"  "DONE(d@/!)" "ISSUECLOSE(I@/!)"  "SUSPEND(S@/!)")
		(sequence "RELEASE(r@/!)" "|" "CANCELLED(c@/!)" "VERSION(v@/!)")
		)))


  ;; (require 'org-id)
  (defvar org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
  (defun eos/org-custom-id-get (&optional pom create prefix)
    "Get the as POM.
  If POM is nil,  Refer to the entry at point.  If the entry does
   not have an CUSTOM_ID, the function returns nil.  However, when
   CREATE is non nil, create a CUSTOM_ID if none is present
   already.  PREFIX will be passed through to `org-id-new'.  In any
   case, the CUSTOM_ID of the entry is returned."
    (interactive)
    (org-with-point-at pom
      ;; (let ((id (org-entry-get nil "CUSTOM_ID")))
      (let ((id (org-entry-get nil "CUSTOM_ID")))
	(cond
	 ((and id (stringp id) (string-match "\\S-" id))
	  id)
	 (create
	  (setq id (org-id-new (concat prefix "h")))
	  (org-entry-put pom "CUSTOM_ID" id)
	  (org-id-add-location id (buffer-file-name (buffer-base-buffer)))
	  id)))))
  ;; (defun eos/org-add-ids-to-headlines-in-file ()
  ;;   "Add CUSTOM_ID properties to all headlines in the
  ;;    current file which do not already have one."
  ;;   (interactive)
  ;;   (org-map-entries (lambda () (eos/org-custom-id-get (point) 'create))))

  (defun eos/org-add-ids-to-headlines-in-file ()
    "Add CUSTOM_ID properties to all headlines in the current
   file which do not already have one. Only adds ids if the
   `auto-id' option is set to `t' in the file somewhere. ie,
   #+OPTIONS: auto-id:t"
    (interactive)
    (save-excursion
      (widen)
      (goto-char (point-min))
      (when (re-search-forward "^#\\+OPTIONS:.*auto-id:t" (point-max) t)
	(org-map-entries (lambda () (eos/org-custom-id-get (point) 'create))))))

					; automatically add ids to saved org-mode headlines
  (add-hook 'org-mode-hook
	    (lambda ()
	      (add-hook 'before-save-hook
			(lambda ()
			  (when (and (eq major-mode 'org-mode)
				     (eq buffer-read-only nil))
			    (eos/org-add-ids-to-headlines-in-file))))))

  (setq org-directory mengqp-org-dir)
  ;; (advice-add 'org-agenda-quit :before 'org-mobile-push)
  ;; (advice-add 'org-agenda-quit :before 'org-mobile-pull)
  (defconst org-mobile-directory mengqp-org-mobile-dic)
  (defconst org-mobile-inbox-for-pull mengqp-org-mobile-index-file)
  )

(use-package deft
  :ensure t
  :defer t
  :config
  (setq deft-extensions '("txt" "org" "gpg"))
  (setq deft-directory mengqp-org-dir)
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)
  (setq deft-text-mode 'org-mode)
  (setq deft-auto-save-interval 0)
  )

;; (use-package epg-config
;;   :ensure nil
;;   :config
;;   (setq epg-gpg-program "/usr/bin/gpg1")
;;   )

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
	org-journal-file-format "%Y-%m.org"
	org-journal-dir mengqp-org-diary-dir
	org-journal-date-format "%A, %d %B %Y"
	org-journal-enable-encryption t
	org-journal-encrypt-journal t
	org-journal-encrypt-on 'kill-buffer-hook
	)
  ;; When =org-journal-file-pattern= has the default value, this would be the regex.
  (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
  (add-to-list 'org-agenda-files org-journal-dir)

  )

(provide 'init-org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
