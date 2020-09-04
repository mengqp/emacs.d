;;; init.el --- Config for mengqp -*- coding: utf-8-unix -*-
;;; Commentary:

;; Copyright (C) 2017-2018 by mengqp


;;; Code:
;; don't GC during startup to save time
;; (setq gc-cons-threshold most-positive-fixnum)
;; (setq gc-cons-threshold 402653184 gc-cons-percentage 0.6)

;; (setq gc-cons-threshold 402653184
;;       gc-cons-percentage 0.6)

;;Speed up startup
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 80000000)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after init."
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold 800000)
            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function
			      (lambda ()
                                (unless (frame-focus-state)
                                  (garbage-collect))))
	      (add-hook 'focus-out-hook 'garbage-collect))))


;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(defun update-load-path (&rest _)
  "Update `load-path'."
  (push (expand-file-name "site-lisp" user-emacs-directory) load-path)
  (push (expand-file-name "lisp" user-emacs-directory) load-path)
  )

(defun add-subdirs-to-load-path (&rest _)
  "Add subdirectories to `load-path'."
  (let ((default-directory
          (expand-file-name "site-lisp" user-emacs-directory)))
    (normal-top-level-add-subdirs-to-load-path)))

(advice-add #'package-initialize :after #'update-load-path)
(advice-add #'package-initialize :after #'add-subdirs-to-load-path)

(update-load-path)


;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let ((file-name-handler-alist nil))


  (require 'init-const)
  (require 'init-autoload)
  (require 'cl-lib)
  (require 'init-package)

  (use-package benchmark-init
    :ensure t
    :disabled t
    :config
    ;; To disable collection of benchmark data after init is done.
    (add-hook 'after-init-hook 'benchmark-init/activate))

  (when *win64*
    (load-file "~/.emacs.d/initw.el")
    )
  (when *linux*
    (load-file "~/.emacs.d/initl.el")
    )

  )

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory)
      )

;; enable just-in-time native compilation
;; (setq comp-deferred-compilation nil)

;; native-compile all Elisp files under a directory
;; (native-compile-async "~/.emacs.d/elpa/" 'recursively)
;; (native-compile-async "~/.emacs.d/site-lisp/" 'recursively)


;; (when *win64*
;;   (server-start)
;;   )


;;; init.el ends here
