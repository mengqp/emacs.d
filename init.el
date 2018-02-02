;;; init.el --- Config for mengqp -*- coding: utf-8-unix -*-
;;; Commentary:

;; Copyright (C) 2017-2018 by mengqp


;;; Code:
;;; Best default gc threshold value. Should't be too big
(defvar best-gc-cons-threshold 4000000)

;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(defvar emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(defvar *linux* (eq system-type 'gnu/linux) )
(defvar *win64* (eq system-type 'windows-nt) )


;; ;; Function to collect information of packages.
;; (defvar missing-packages-list nil
;;   "List of packages that `try-require' can't find.")


;; (defvar package-init-statistic nil "Package loading statistics")

;; ;; attempt to load a feature/library, failing silently
;; (defun try-require (feature &optional click)
;;   "Attempt to load a library or module. Return true if the
;; library given as argument is successfully loaded. If not, instead
;; of an error, just add the package to a list of missing packages."
;;   (condition-case err
;;       ;; protected form
;;       (let ((timestamp (current-time))
;;             (package (if (stringp feature) feature (symbol-name feature))))
;;         (if (stringp feature)
;;             (load-library feature)
;;           (require feature))
;;         (if click
;;             (add-to-list 'package-init-statistic
;;                          (cons (if (stringp feature) feature (symbol-name feature))
;;                                (float-time (time-since timestamp)))))
;;         (message "Checking for library `%s'... Found, cost %.2f seconds"
;;                  feature (float-time (time-since timestamp))))
;;     ;; error handler
;;     (file-error  ; condition
;;      (progn
;;        (message "Checking for library `%s'... Missing" feature)
;;        (add-to-list 'missing-packages-list feature 'append))
;;      nil)))

;; *Message* buffer should be writable in 24.4+
(defadvice switch-to-buffer (after switch-to-buffer-after-hack activate)
  "*Message* buffer should be writable."
  (if (string= "*Messages*" (buffer-name))
      (read-only-mode -1)))


(package-initialize)

;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let ((file-name-handler-alist nil))

;;; package here
;; (require 'init-autoload)
(require 'cl-lib)

(require 'init-package)

;;ui
(require 'init-base)
(require 'init-modeline)
(require 'init-theme)

;;tool
(require 'init-calendar)
(require 'init-hungry-delete)
(require 'init-smartparens)
(require 'init-evil)
(require 'init-company)
(require 'init-window)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-yasnippet)
(require 'init-flycheck)
(require 'init-ace-jump)
(require 'init-git)
(require 'init-mc)
(require 'init-func)
(require 'init-keymap)
;; (require 'init-popwin)
;; (require 'init-lsp)
;; 去掉中文的输入，如果有必要，直接使用
;; (require 'init-pyim)
;; (require 'init-abbrev)
;; (require 'init-tree)
;; (require 'init-which-key)
;; (require 'init-shell)

;;
(require 'init-c)
(require 'init-lisp)
(require 'init-org)
(require 'init-ahk)
;; (require 'init-w3m)


)


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when *win64*
  (server-start)
  )

;;; init.el ends here
