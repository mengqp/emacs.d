;;; init-func.el --- xxx -*- coding: utf-8-unix -*-

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


(defun mengqp/open-init-file ()
  "Open init file to config."
  (interactive)
  (find-file "~/.emacs.d/init.el")
    )

;; Dos2Unix/Unix2Dos
(defun dos2unix ()
  "Convert the current buffer to UNIX file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))

(defun unix2dos ()
  "Convert the current buffer to DOS file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos nil))
;; (defun mengqp/find-readme
;;   "find root/readme.org in the project"
;;   (interactive)
;;   (projectile-find-file "readme.org")
;;     )
(defun mengqp/clearM ()
  "Clear buffer is ^M."
  (interactive)
  (replace-match "" "")
  )

(defun mengqp/open-init-package-file ()
  "Open init package file to config."
  (interactive)
  (find-file "~/.emacs.d/lisp/init-package.el")
  )

(defun mengqp/open-init-keymap-file ()
  "Open init keymap file to config."
  (interactive)
  (find-file "~/.emacs.d/lisp/init-keymap.el")
    )


(defun mengqp/switch-scratch-buf ()
  "Open init keymap file to config."
  (interactive)
  (switch-to-buffer "*scratch*")
    )

(defun mengqp/insert-date ()
  "Insert the date in current position."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun mengqp/insert-time ()
  "Insert the datetime in current position."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

(provide 'init-func)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-func.el ends here
