;;; init-agenda.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

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

;; 设置 agenda 文件表
(setq org-agenda-text-search-extra-files
      (append
       (sa-find-org-file-recursively mengqp-org-dir "org")
       ))

(setq org-agenda-files org-agenda-text-search-extra-files)


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

(provide 'init-agenda)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-agenda.el ends here
