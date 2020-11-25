;;; init-const.el --- define const  -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(require 'cl-lib)

(setq-default my-emacs-d "~/.emacs.d")
(setq-default my-lisp-d (concat my-emacs-d "/lisp"))
(setq-default my-site-lisp-d (concat my-emacs-d "/site-lisp"))
(setq-default auto-save-path (concat my-site-lisp-d "/auto-save"))

(defconst *linux*
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux system?")

(defconst *win64*
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")

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


(provide 'init-const)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-const.el ends here
