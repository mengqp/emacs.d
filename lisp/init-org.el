;;; init-org.el --- Config by mengqp -*- coding: utf-8-unix -*-
;;; Commentary:
;; Copyright (C) 2017-2018 by mengqp

;;; Code:
;; (require 'org)
(use-package org
  :ensure t
  :defer t
  :init
  :config
  (message "org")

  (use-package htmlize
    :ensure t
    )

  (use-package org-pomodoro
    :ensure t
    :defer t
    ;; :commands org-pomodoro
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
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

  ;; (setq org-agenda-files (file-expand-wildcards "~/ecode/org/*.org"))
  ;; 设置agent文件表
  (when *linux*
    (setq org-agenda-files (list "~/ecode/em770/docs/org/issue_770.org"
				 "~/ecode/em761/docs/org/issue761.org"
				 "~/ecode/em761/docs/org/disscuss761.org"
				 "~/ecode/epduhmi/3352/asrc/readme_epdu_a.org"
				 "~/ecode/epduhmi/3352/dsrc/readme_epdu_d.org"
				 "~/ecode/org/"
				 "~/ecode/pdt/docs/org/issuepdt.org"
				 "~/project/zlg/docs/org/issue_zlg.org"
				 ))
    )

  (when *win64*
    (setq org-agenda-files (list "E:/svn/org"
				 "E:/svn/em761/docs/org/issue761.org"
				 "E:/svn/em761/docs/org/disscuss761.org"
				 "E:/svn/epduhmi/3352/asrc/readme_epdu_a.org"
				 "E:/svn/epduhmi/3352/dsrc/readme_epdu_d.org"
				 "E:/svn/em770/docs/org/issue_770.org"
				 "E:/svn/pdt/docs/org/issuepdt.org"
				 "F:/项目/zlg/docs/org/issue_zlg.org"
				 ))
    )

  (setq org-capture-templates
	'(
	  ("j" "Journal 日常工作记录" entry (file+datetree "~/ecode/org/journal.org")
	   "*  %? \n %i\n ")
	  ("t" "Todo gdt" entry (file+headline "~/ecode/org/gtd.org" "Tasks")
	   "* TODO [#B] %? \n %i\n %a")
	  ("m" "meet 会议记录" entry (file+datetree "~/ecode/org/meet.org")
	   "* %? \n %i\n ")
	  ("M" "memo 备忘 加班记录等" entry (file+datetree "~/ecode/org/memo.org")
	   "* %?  %i\n ")
	  ("i" "idea 乱七八糟的想法" entry (file+datetree "~/ecode/org/idea.org")
	   "* %? \n \nEntered on %U\n %i\n ")
	  ("s" "Summarize 总结" entry (file+headline "~/ecode/org/summarize.org" "summarize")
	   "*  %? \n %i\n ")
	  ))

  (setq org-refile-targets (quote ((nil :maxlevel . 9)
				   (org-agenda-files :maxlevel . 9))))

  ;; (use-package org-projectile
  ;;   :config
  ;;   (org-projectile:per-repo)
  ;;   (setq org-projectile:per-repo-filename "readme.org")
  ;;   )
  ;; (setq org-agenda-files (append org-agenda-files (org-projectile:todo-files)))
  ;; (global-set-key (kbd "C-c c") 'org-capture)
  ;; (global-set-key (kbd "C-c n p") 'org-projectile:project-todo-completing-read)

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
  ;; 不同tag外观
  (setq org-tag-faces
	'(("@bug" . (:background "red" :foreground "white" :weight bold))
	  ("@feature" . (:background "DarkOrange" :foreground "white" :weight bold))
	  ("@discuss" . (:background "yellow" :foreground "DarkGreen" :weight bold))
	  ("@suspend" . (:background "yellow" :foreground "DarkGreen" :weight bold))
	  ("@wontfix" . (:background "DodgerBlue" :foreground "black" :weight bold))
	  ("@repeat" . (:background "SkyBlue" :foreground "black" :weight bold))
	  ("@invalid" . (:background "SkyBlue" :foreground "black" :weight bold))
	  ))
  ;; 设置todo
  (setq org-todo-keywords
	(quote ((sequence "TODO(t)" "STARTED(s)" "ISSUE(i@/!)" "|" "ISSUECLOSE(I@/!)" "DONE(d!/!)")
		(sequence "RELEASE(r@/!)" "|" "CANCELLED(c@/!)")
		)))


  ;; (require 'org-id)
  (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
  (defun eos/org-custom-id-get (&optional pom create prefix)
    "Get the CUSTOM_ID property of the entry at point-or-marker POM.
   If POM is nil, refer to the entry at point. If the entry does
   not have an CUSTOM_ID, the function returns nil. However, when
   CREATE is non nil, create a CUSTOM_ID if none is present
   already. PREFIX will be passed through to `org-id-new'. In any
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
    (setq num (string-to-number (current-word)))
    ;; (let num (string-to-number (current-word)))
    (setq num (+ num 1))
    (goto-char (point-max))
    (org-insert-todo-heading "DONE")
    (insert "#")
    (insert (number-to-string num))
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
		      :prefix ","
		      "RET" 'org-insert-todo-heading
		      "tc" 'org-table-create
		      "cc" 'org-ctrl-c-ctrl-c
		      "ck" 'org-kill-note-or-show-branches

		      )

  (which-key-add-major-mode-key-based-replacements 'org-mode
    ", c" "note"
    ", t" "table")

  (general-define-key :states '(normal motion)
		      :keymaps '(org-mode-map)
		      :prefix ";"
		      "." 'org-time-stamp
		      ":" 'org-set-tags
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


    (message "org-dic")
    (setq org-directory "~/ecode/org")
    (when *win64*
      (setq org-mobile-directory "E:/Nutstore/org")
      (setq org-mobile-inbox-for-pull "E:/Nutstore/org/index.org")
      )
    (when *linux*
      (setq org-mobile-directory "~/nutdata/org")
      (setq org-mobile-inbox-for-pull "~/nutdata/org/index.org")
      )

    ;; (autoload 'org-mobile-pull "org-mobile" "" t)
    ;; (autoload 'org-mobile-push "org-mobile" "" t)
    ;; ;; 同步到本地电脑的坚果云专用目录
    ;; (general-define-key :states '(normal motion)
    ;; 			:keymaps '(org-mode-map)
    ;; 			:prefix ","
    ;; 			"mp" 'org-mobile-push
    ;; 			"mg" 'org-mobile-pull
    ;; 			)


  ;; (use-package org-journal
  ;;   :ensure t
  ;;   :init
  ;;   (setq org-journal-dir "~/ecode/org/journal/")
  ;;   (setq org-journal-file-format "%Y-%m-%d.org")
  ;;   (defvar org-journal-date-format "%A %d-%m-%Y"
  ;;     "Date format string for journal headings.")
  ;;   (setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'")
  ;;   )


  )


(provide 'init-org)

;;; init-org.el ends here
