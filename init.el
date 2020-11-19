;;; init.el --- Config for mengqp -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:


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
  (require 'init-gdb)
  ;; (require 'init-shell)

  ;; lang
  (require 'init-plantuml)
  (require 'init-cc)
  (require 'init-cmake)
  (require 'init-org)
  (require 'init-python)
  (require 'init-css)
  (require 'init-markdown)
  (require 'init-php)

  ;; other
  (require 'init-func)
  (require 'init-keymap)
  )

;; (put 'list-threads 'disabled nil)
;;; init.el ends here
