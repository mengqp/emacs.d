;;; init-const.el --- define const  -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(defconst *linux*
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux system?")

(defconst *win64*
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")

(provide 'init-const)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-const.el ends here
