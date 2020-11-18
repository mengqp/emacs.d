;;; init.el --- Config for mengqp -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

;;Speed up startup
;; (defvar default-file-name-handler-alist file-name-handler-alist)
;; (setq file-name-handler-alist nil)
;; ;; (setq gc-cons-threshold 4000000)
;; (setq gc-cons-threshold 80000000)
;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             "Restore defalut values after init."
;;             (setq file-name-handler-alist default-file-name-handler-alist)
;;             (setq gc-cons-threshold 800000)
;;             (if (boundp 'after-focus-change-function)
;;                 (add-function :after after-focus-change-function
;; 			      (lambda ()
;;                                 (unless (frame-focus-state)
;;                                   (garbage-collect))))
;; 	      (add-hook 'focus-out-hook 'garbage-collect))))

;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.

(let ((file-name-handler-alist nil))
  (load-file "~/.emacs.d/lisp/init-load-path.el")
  ;; (require 'init-benchmarking)
  (require 'init-const)
  (require 'init-autoload)
  (require 'cl-lib)
  (require 'init-package)

  ;;ui
  (require 'init-base)
  (require 'init-ui)
  (require 'init-edit)
  (require 'init-coding)
  (require 'init-evil)
  (require 'init-modeline)
  (require 'init-theme)
  (require 'init-cnfonts)
  (require 'init-layout)
  (require 'init-im)

  ;;tool
  ;; (require 'init-calendar)
  (require 'init-company)
  (require 'init-window)
  (require 'init-projectile)
  (require 'init-yasnippet)
  (require 'init-flycheck)
  (require 'init-ace-jump)
  (require 'init-git)
  (require 'init-ivy)
  ;; (require 'init-snails)
  (require 'init-lsp)
  ;; (require 'init-browser)
  (require 'init-func)
  (require 'init-keymap)

  (require 'init-gdb)
  (require 'init-shell)
  ;;
  (require 'init-plantuml)
  (require 'init-cc)
  (require 'init-cmake)
  (require 'init-org)
  (require 'init-python)
  (require 'init-css)
  (require 'init-markdown)
  (require 'init-php)
  )

;; (put 'list-threads 'disabled nil)
;;; init.el ends here
