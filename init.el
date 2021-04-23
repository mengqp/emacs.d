;;; init.el --- Config for mengqp -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(load-file "~/.emacs.d/lisp/init-load-path.el")

(let ((file-name-handler-alist nil))
  (require 'init-const)
  (require 'init-autoload)
  (require 'init-package)
  ;; (require 'init-benchmarking)

  ;;ui
  (require 'init-base)
  (require 'init-ui)
  (require 'init-edit)
  (require 'init-coding)
;;  (require 'init-modeline)
;;  (require 'init-theme)
;;  (require 'init-cnfonts)

  ;;tool
  ;; (require 'init-calendar)
  (require 'init-evil)
;;  (require 'init-im)

  (require 'init-layout)
  (require 'init-window)
  (require 'init-projectile)
;;  (require 'init-lsp)


  (require 'init-git)
  (require 'init-gdb)

  (require 'init-company)
  ;; (require 'init-flycheck)
  ;; (require 'init-yasnippet)

  (require 'init-ace-jump)
  (require 'init-ivy)
  (require 'init-snails)
;; (require 'init-browser)
  ;; (require 'init-shell)

  ;; lang
 ;; (require 'init-org)
  (require 'init-cc)
  (require 'init-python)
  (require 'init-php)
  (require 'init-cmake)
  (require 'init-css)
;;  (require 'init-markdown)
 ;; (require 'init-plantuml)

  ;; other
  (require 'init-func)
  (require 'init-keymap)
  )

;; (put 'list-threads 'disabled nil)
;;; init.el ends here
