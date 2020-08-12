;;; init-org.el --- xxx -*- coding: utf-8-unix -*-

;;; Copyright © 2018 - 2018 mengqp.

;; Author: mengqp
;; URL:
;; Version:0.0.1
;; Keywords:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
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




(use-package org
  :ensure t
  :mode "\\.org\\'"
  :commands(org-brain org-brain-prefix-map)
  :defer t
  :bind*
  (
   ("M-j oo" . org-capture)
   ("M-j oa" . org-agenda)
   ("M-j oj" . org-journal-new-entry)
   ("M-j ob" . org-brain-prefix-map )
   )
  :init
  :config
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
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
  (require 'init-deft)
  (require 'init-org-pomodoro)
  (require 'init-org-ui)
  (require 'init-journal)
  (require 'init-agenda)
  (require 'init-org-brain)
  (require 'init-tex)
  (require 'init-ox-latex)
  (require 'init-org-roam)

  )



(provide 'init-org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
