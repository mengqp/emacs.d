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

(autoload 'projectile-project-root "projectile" "" t)
(defun mengqp/org-projectile-find (name)
  "Find project org as NAME."
  (setq org-root-files
	(sa-find-org-file-recursively
	 (concat (projectile-project-root) "01docs/org") "org")
	)
  (setq org-files-num 0)
  (while (< org-files-num (length org-root-files))
    (setq file-name (nth org-files-num org-root-files))
    (if (string-match name file-name)
	(progn
	  (print file-name)
	  (find-file file-name)
	  )
      )

    (setq org-files-num (+ org-files-num 1))
    )
  )


;;;###autoload (autoload 'evil-mode "evil" nil t)
(defun mengqp/org-projectile-find-issue ()
  "Find issue."
  (interactive)
  (mengqp/org-projectile-find "issue")
  )

;;;###autoload (autoload 'evil-mode "evil" nil t)
(defun mengqp/org-projectile-find-todo ()
  "Find todo."
  (interactive)
  (mengqp/org-projectile-find "todo")
  )

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
  ;; :config
  ;; (add-hook 'org-pomodoro-finished-hook
  ;; 	       (lambda ()
  ;; 		 (mukhali/terminal-notifier-notify "Pomodoro" "time-for-relax")))
  ;; (add-hook 'org-pomodoro-short-break-finished-hook
  ;; 	       (lambda ()
  ;; 		 (mukhali/terminal-notifier-notify "Break-Completed" "ready-for-another?")))

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
  :bind
  (
   ("C-c o a" . org-agenda )
   ("C-c o o" . org-capture)
   :map org-mode-map
   ("C-c T" . mengqp/evil-org-insert-todo-at-end )
   ("C-c ." . org-time-stamp )

   )
  :config

  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

  ;; 设置 agent 文件表
  (when *linux*
    (setq org-agenda-text-search-extra-files
	  (append
	   (sa-find-org-file-recursively "~/nutdata/myorg/" "org")
	   ))

    (setq org-agenda-files org-agenda-text-search-extra-files)
    )


  (when *win64*
    (setq org-agenda-text-search-extra-files
	  (append
	   (sa-find-org-file-recursively "E:/Nutstore/myorg/" "org")
	   ))

    (setq org-agenda-files org-agenda-text-search-extra-files)
    )

  (defun org-journal-find-location ()
    ;; Open today's journal, but specify a non-nil prefix argument in order to
    ;; inhibit inserting the heading; org-capture will insert the heading.
    (org-journal-new-entry t)
    ;; Position point on the journal's top-level heading so that org-capture
    ;; will add the new entry as a child entry.
    (goto-char (point-min)))

  (defconst org-capture-templates
    '(
      ("j" "Journal 日常工作记录" entry (file+datetree "~/nutdata/myorg/general/journal.org")
       "*  %? \n %U\n %i\n ")
      ("t" "Todo gdt" entry (file+headline "~/nutdata/myorg/general/gtd.org" "Tasks")
       "* TODO [#B] %? \n %i\n %a")
      ("m" "meet 会议记录" entry (file+datetree "~/nutdata/myorg/general/meet.org")
       "* %? \n %i\n ")
      ("M" "memo 备忘 加班记录等" entry (file+datetree "~/nutdata/myorg/general/memo.org")
       "* %?  %i\n ")
      ("i" "idea 乱七八糟的想法" entry (file+datetree "~/nutdata/myorg/general/idea.org")
       "* %? \n \nEntered on %U\n %i\n ")
      ("s" "Summarize 总结" entry (file+headline "~/nutdata/myorg/general/summarize.org" "summarize")
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
		(sequence "RELEASE(r@/!)" "|" "CANCELLED(c@/!)")
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



  (defun mengqp/evil-org-insert-todo-at-end ()
    "add TODO # at the org end ."
    (interactive)
    (goto-char (point-max))
    (re-search-backward "^\*+ [A-Z]+ #")
    (re-search-forward "#")
    (setq mengqp/evil-org-num (string-to-number (current-word)))
    ;; (let num (string-to-number (current-word)))
    (setq mengqp/evil-org-num (+ mengqp/evil-org-num 1))
    (goto-char (point-max))
    (org-insert-todo-heading "DONE")
    (insert "#")
    (insert (number-to-string mengqp/evil-org-num))
    )

  ;; (use-package org-mind-map
  ;;   :defer t
  ;;   :ensure t
  ;;   )

  ;; (define-key evil-normal-state-map (kbd "T") 'mengqp/evil-org-insert-todo-at-end)
  ;; (define-key evil-normal-state-map (kbd "t") 'org-todo)
  (general-define-key :states '(normal motion)
		      :keymaps '(org-mode-map)
		      "T" 'mengqp/evil-org-insert-todo-at-end
		      "t" 'org-todo
		      ">" 'outline-demote
		      "<" 'outline-promote
		      "B" 'org-backward-heading-same-level
		      "F" 'org-forward-heading-same-level
		      )

  (general-define-key :states '(normal motion)
		      :keymaps '(org-mode-map)
		      :prefix ";"
		      "." 'org-time-stamp
		      ":" 'org-set-tags
		      "RET" 'org-insert-todo-heading
		      "s" 'org-schedule
		      "d" 'org-deadline
		      "p" 'outline-previous-visible-heading
		      "n" 'outline-next-visible-heading
		      "u" 'outline-up-heading
		      "-" 'org-ctrl-c-minus
		      "*" 'org-ctrl-c-start
		      "l" 'org-metaright
		      "h" 'org-metaleft
		      "j" 'org-metaup
		      "k" 'org-metadown
		      "w" 'org-refile
		      "tc" 'org-table-create
		      "cc" 'org-ctrl-c-ctrl-c
		      "ck" 'org-kill-note-or-show-branches


		      )

  (general-define-key :states '(normal motion)
		      :keymaps '(org-capture-mode-map)
		      :prefix ","
		      "cc" 'org-capture-finalize
		      "ck" 'org-capture-kill
		      "cw" 'org-capture-refile

		      ;; (which-key-add-key-based-replacements
		      ;; 	", c" "capture")
		      )

  (which-key-add-major-mode-key-based-replacements 'org-capture-mode
    ", c" "capture")


  (setq org-directory "~/nutdata/org/")
  ;; (advice-add 'org-agenda-quit :before 'org-mobile-push)
  ;; (advice-add 'org-agenda-quit :before 'org-mobile-pull)
  (when *win64*
    (defconst org-mobile-directory "E:/Nutstore/org")
    (defconst org-mobile-inbox-for-pull "E:/Nutstore/org/index.org")
    )
  (when *linux*
    (defconst org-mobile-directory "~/nutdata/org")
    (defconst org-mobile-inbox-for-pull "~/nutdata/org/index.org")
    )

  )

(use-package deft
  :ensure t
  :defer t
  :config
  (setq deft-extensions '("txt" "org" "gpg"))
  (setq deft-directory "~/nutdata/myorg/")
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)
  (setq deft-text-mode 'org-mode)
  (setq deft-auto-save-interval 0)
  )

(use-package org-journal
  :ensure t
  :defer t
  :config
  (use-package org-crypt
    :ensure nil
    :config
    (setq org-tags-exclude-from-inheritance (quote ("crypt")))
    ;; (setq org-crypt-disable-auto-save t)
    ;; (setq org-crypt-key "205F6507DAA68D5C9AB039DCB6DE3DCE59268D36")

    )

  ;; (org-crypt-use-before-save-magic)
  (require 'epa-file)
  (setq epa-file-enable t
	epa-file-encrypt-to "meng_qingpu@126.com"
  	epa-file-select-keys nil
  	;; epa-file-cache-passphrase-for-symmetric-encryption t
	)

  (setq auto-mode-alist (cons '("\\.org.gpg$" . org-journal-mode) auto-mode-alist))
  (setq org-journal-file-type 'monthly
	;; org-journal-file-format "%Y-%m-%d.org"
	org-journal-file-format "%Y-%m.org"
	org-journal-dir "~/nutdata/myorg/diary"
	org-journal-date-format "%A, %d %B %Y"
	org-journal-enable-encryption t
	org-journal-encrypt-journal t
	org-journal-encrypt-on 'kill-buffer-hook
	)
  ;; When =org-journal-file-pattern= has the default value, this would be the regex.
  (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
  (add-to-list 'org-agenda-files org-journal-dir)

  (defun org-journal-save-entry-and-exit()
    "Simple convenience function.
  Saves the buffer of the current day's entry and kills the window
  Similar to org-capture like behavior"
    (interactive)
    (save-buffer)
    (kill-buffer-and-window))
  (define-key org-journal-mode-map (kbd "C-x C-s") 'org-journal-save-entry-and-exit)


  )

(provide 'init-org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
