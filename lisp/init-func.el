
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

(provide 'init-func)
