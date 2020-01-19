;;; init.el --- Config for mengqp -*- coding: utf-8-unix -*-
;;; Commentary:

;; Copyright (C) 2017-2018 by mengqp


;;; Code:
;; ;;; Best default gc threshold value. Should't be too big
;; (defvar best-gc-cons-threshold 4000000)

;; don't GC during startup to save time
;; (setq gc-cons-threshold most-positive-fixnum)
;; (setq gc-cons-threshold 402653184 gc-cons-percentage 0.6)

;; (setq gc-cons-threshold 402653184
;;       gc-cons-percentage 0.6)

;; Speed up startup
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
  (push (expand-file-name "lisp" user-emacs-directory) load-path))

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
  (require 'cl-lib)
  (require 'init-package)

  ;;ui
  (require 'init-ui)
  (require 'init-base)
  (require 'init-edit)
  (require 'init-coding)
  (require 'init-evil)
  (require 'init-modeline)
  (require 'init-theme)
  (require 'init-color-rg)
  (require 'init-cnfonts)
  (require 'init-layout)
  ;; (require 'init-dumb-jump)

  ;; (when *linux*
    ;; (require 'init-abbrev)
    ;; (require 'init-hydra)
    ;; (require 'init-spell)
    ;;(require 'init-dap)
    ;; )
  (require 'init-pyim)

  ;;tool
  ;; (require 'init-calendar)
  ;; (require 'init-hungry-delete)
  ;; (require 'init-smartparens)
  (require 'init-company)
  (require 'init-window)
  (require 'init-projectile)
  (require 'init-yasnippet)
  (require 'init-flycheck)
  (require 'init-ace-jump)
  (require 'init-git)
  (require 'init-cmake)
  ;; (require 'init-popwin)
  ;; (require 'init-tree)
  ;; (require 'init-which-key)
  (require 'init-ivy)
  (require 'init-snails)
  ;; (require 'init-browser)
  (require 'init-func)
  (require 'init-keymap)

  (when *linux*
    (require 'init-lsp)
    (require 'init-shell)

    (require 'init-plantuml)
    ;; (require 'init-ycmd)
    ;; (require 'init-gdb)
    (require 'init-leecode)

    )
  (when *win64*
    (require 'init-counsel-etags)
    )
  ;; (require 'init-cscope)

  ;;
  ;; (require 'init-realgud)
  (require 'init-cc)
  ;; (require 'init-lisp)
  (require 'init-org)
  ;; (require 'init-python)
  (require 'init-css)
  ;; (require 'init-tex)
  (require 'init-markdown)
  (require 'init-web)
  (require 'init-php)
  (when *win64*
    (require 'init-ahk)
    )
  ;; (require 'init-w3m)


  )

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory)
      )

;; (when *win64*
;;   (server-start)
;;   )

;;; init.el ends here
