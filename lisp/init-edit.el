;;; init-edit.el --- some edit work -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

;; Edit multiple regions in the same way simultaneously
(use-package iedit
  :ensure t
  :defer t
  :bind
  (("C-;" . iedit-mode)
   ("C-x r RET" . iedit-rectangle-mode)
   )
  )

;; https://github.com/emacs-evil/goto-chg/issues/3
;; Goto last change
(use-package goto-chg
  :ensure t
  :defer t
  :bind ("C-," . goto-last-change)
  )

(use-package expand-region
  :ensure t
  :defer t
  :commands er/expand-region
  :bind ("C-=" . er/expand-region)
  )

(use-package format-all
  :ensure t
  :defer t
  )

;; auto insert closing bracket
(use-package smartparens
  :ensure t
  :defer t
  :hook( prog-mode . smartparens-mode)
  :config
  ;; enable the default configuration
  (require 'smartparens-config)
  (smartparens-strict-mode t)
  )

(use-package hungry-delete
  :ensure t
  :defer t
  :diminish hungry-delete-mode
  :hook (after-init . global-hungry-delete-mode)
  )

(use-package anzu
  :ensure t
  :defer t
  :hook(after-init . global-anzu-mode)
  :init
  (setq anzu-mode-lighter "")
  (setq anzu-deactivate-region t)
  (setq anzu-search-threshold 1000)
  (setq anzu-replace-threshold 50)
  (setq anzu-replace-to-string-separator " => ")
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  )

(use-package auto-sudoedit
  :ensure t
  :defer t
  :hook(after-init . auto-sudoedit-mode)
  )

(use-package shift-number
  :ensure t
  :defer t
  :bind (
	  ("M-_" . shift-number-down)
	  ("M-+" . shift-number-up))
  )

(use-package undo-fu
  :ensure t
  :defer t
  :bind(
	("C-/" . undo-fu-only-undo)
	("C-?" . undo-fu-only-redo)
	)
  )

(use-package wgrep
  :ensure t
  :defer t)

(require 'init-color-rg)

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
