;;; init-func.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
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

(defvar mengqp-disable-idle-timer nil
  "Function passed to `mengqp-run-with-idle-timer' is run immediately.")

(defun mengqp-run-with-idle-timer (seconds func)
  "After SECONDS, run function FUNC once."
  (cond
   (mengqp-disable-idle-timer
    (funcall func))
   (t
    (run-with-idle-timer seconds nil func))))


(provide 'init-func)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-func.el ends here
