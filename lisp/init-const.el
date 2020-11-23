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


(provide 'init-const)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-const.el ends here
