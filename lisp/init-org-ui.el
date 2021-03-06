;;; init-org-ui.el --- ui -*- coding: utf-8-unix -*-

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
(use-package htmlize
  :ensure t
  :defer t
  :after org
  )


(use-package org-bullets
  :defer t
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(use-package toc-org
  :defer t
  :disabled t
  :ensure t
  :init
  (add-hook 'org-mode-hook 'toc-org-mode)
  )

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

(provide 'init-org-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org-ui.el ends here
