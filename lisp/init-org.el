
;; (require 'org)
(use-package org
  :defer t
  :init
  :config
  (message "org")

  (use-package org-pomodoro
    ;; :commands org-pomodoro
    :init
    (setq org-pomodoro-killed-sound t)
    (setq org-pomodoro-length 3)
    (setq org-pomodoro-format "•%s")
    (setq org-pomodoro-short-break-format "•%s")
    :config
     (add-hook 'org-pomodoro-finished-hook
     	       (lambda ()
     		 (mukhali/terminal-notifier-notify "Pomodoro" "time-for-relax")))
     (add-hook 'org-pomodoro-short-break-finished-hook
     	       (lambda ()
     		 (mukhali/terminal-notifier-notify "Break-Completed" "ready-for-another?")))

    )
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

  (setq org-agenda-files (file-expand-wildcards "~/ecode/org/*.org"))
  ;; 设置agent文件表
  (setq org-agenda-files (list "~/ecode/em770/readme.org"
			       "~/ecode/epduhmi/readme.org"
			       "~/ecode/epduhmi/3352/asrc/readme.org"
			       "~/ecode/epduhmi/3352/dsrc/readme.org"
			       "~/ecode/org/journal.org"
			       "~/ecode/org/gtd.org"
			       "~/ecode/org/week.org"
			       "~/ecode/org/memo.org"
			       ))
  (setq org-capture-templates
	'(
	  ("j" "Journal 日常工作记录" entry (file+datetree "~/ecode/org/journal.org")
	   "* %?\nEntered on %U\n %i\n %a")
	  ("t" "Todo gdt" entry (file+headline "~/ecode/org/gtd.org" "Tasks")
	   "* TODO %?\n %i\n %a")
	  ("w" "week 周报或是会议记录等" entry (file+datetree "~/ecode/org/week.org")
	   "* %?\nEntered on %U\n %i\n %a")
	  ("m" "memo 备忘 加班记录等" entry (file+datetree "~/ecode/org/memo.org")
	   "* %?\nEntered on %U\n %i\n %a")
	  ))

  (setq org-refile-targets (quote ((nil :maxlevel . 9)
				   (org-agenda-files :maxlevel . 9))))

  (require 'org-projectile)
  (org-projectile:per-repo)
  (setq org-projectile:per-repo-filename "readme.org")
  ;; (setq org-agenda-files (append org-agenda-files (org-projectile:todo-files)))
  ;; (global-set-key (kbd "C-c c") 'org-capture)
  ;; (global-set-key (kbd "C-c n p") 'org-projectile:project-todo-completing-read)

  (setq org-src-fontify-natively t)

  (setq org-tag-alist '(("@bug" . ?b) ("@feature" . ?f) ("@repeat" . ?r) ("@invalid" . ?i) ("@wontfix" . ?w) ("@discuss" . ?d) ("@suspend" . ?s) ("@close" . ?c) ("@Fixed" . ?F)))
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
    "add TODO # at the org end"
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

  (define-key evil-normal-state-map (kbd "T") 'mengqp/evil-org-insert-todo-at-end)
  (define-key evil-normal-state-map (kbd "t") 'org-todo)

  (evil-leader/set-key
    ":" 'org-set-tags
    "RET" 'org-insert-todo-heading
    "tc" 'org-table-create
    ;; "s" 'org-schedule
    ;; "d" 'org-deadline

    (which-key-add-key-based-replacements
      ", t" "table")
    )
  )

(with-eval-after-load 'org
  )



(provide 'init-org)
