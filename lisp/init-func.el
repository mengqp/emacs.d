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
  "open init file to config"
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
    "clear buffer's ^M."
  (interactive)
  (replace-string "" "")

    )

(defun mengqp/open-init-package-file ()
  "open init package file to config"
  (interactive)
  (find-file "~/.emacs.d/lisp/init-package.el")
    )

(defun mengqp/open-init-keymap-file ()
  "open init keymap file to config"
  (interactive)
  (find-file "~/.emacs.d/lisp/init-keymap.el")
    )

(defun mengqp/switch-scratch-buf ()
  "open init keymap file to config"
  (interactive)
  (switch-to-buffer "*scratch*")
    )


(defun xah-insert-date ()
  "Insert current date and or time.
Insert date in this format: yyyy-mm-dd.
When called with `universal-argument', prompt for a format to use.
If there's text selection, delete it first.

Do not use this function in lisp code. Call `format-time-string' directly.

URL `http://ergoemacs.org/emacs/elisp_insert-date-time.html'
version 2016-12-18"
  (interactive)
  (when (use-region-p) (delete-region (region-beginning) (region-end)))
  (let (($style
         (if current-prefix-arg
             (string-to-number
              (substring
               (ido-completing-read
                "Style:"
                '(
                  "1 → 2016-10-10 Monday"
                  "2 → 2016-10-10T19:39:47-07:00"
                  "3 → 2016-10-10 19:39:58-07:00"
                  "4 → Monday, October 10, 2016"
                  "5 → Mon, Oct 10, 2016"
                  "6 → October 10, 2016"
                  "7 → Oct 10, 2016"
                  )) 0 1))
           0
           )))
    (insert
     (cond
      ((= $style 0)
       (format-time-string "%Y-%m-%d") ; "2016-10-10"
       )
      ((= $style 1)
       (format-time-string "%Y-%m-%d %A") ; "2016-10-10 Monday"
       )
      ((= $style 2)
       (concat
        (format-time-string "%Y-%m-%dT%T")
        (funcall (lambda ($x) (format "%s:%s" (substring $x 0 3) (substring $x 3 5))) (format-time-string "%z")))
       ;; eg "2016-10-10T19:02:23-07:00"
       )
      ((= $style 3)
       (concat
        (format-time-string "%Y-%m-%d %T")
        (funcall (lambda ($x) (format "%s:%s" (substring $x 0 3) (substring $x 3 5))) (format-time-string "%z")))
       ;; eg "2016-10-10 19:10:09-07:00"
       )
      ((= $style 4)
       (format-time-string "%A, %B %d, %Y")
       ;; eg "Monday, October 10, 2016"
       )
      ((= $style 5)
       (format-time-string "%a, %b %d, %Y")
       ;; eg "Mon, Oct 10, 2016"
       )
      ((= $style 6)
       (format-time-string "%B %d, %Y")
       ;; eg "October 10, 2016"
       )
      ((= $style 7)
       (format-time-string "%b %d, %Y")
       ;; eg "Oct 10, 2016"
       )
      (t
       (format-time-string "%Y-%m-%d"))))))

(provide 'init-func)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-func.el ends here
