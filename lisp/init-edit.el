;;; init-edit.el --- some edit work -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

;; Edit multiple regions in the same way simultaneously
(use-package iedit)

;; https://github.com/emacs-evil/goto-chg/issues/3
;; Goto last change
(use-package goto-chg
  ;; :bind ("C-," . goto-last-change)
  )

(use-package expand-region
  ;; :commands er/expand-region
  ;; :bind ("C-=" . er/expand-region)
  )

(use-package format-all)

;; auto insert closing bracket
(use-package smartparens
  :disabled t
  :diminish smartparens-mode
  :hook( prog-mode . smartparens-mode)
  :config
  ;; enable the default configuration
  (require 'smartparens-config)
  (smartparens-strict-mode t)
  )

(use-package awesome-pair
  :load-path "~/.emacs.d/site-lisp/awesome-pair"
  :hook
  (prog-mode . awesome-pair-mode)
  :config
  (define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
  (define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
  (define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
  (define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
  (define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
  (define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
  (define-key awesome-pair-mode-map (kbd "=") 'awesome-pair-equal)
  ;; (define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
  (define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)
  (define-key awesome-pair-mode-map (kbd "SPC") 'awesome-pair-space)

  )

(use-package hungry-delete
  :diminish hungry-delete-mode
  :hook (after-init . global-hungry-delete-mode)
  )

(use-package anzu
  ;; :hook(after-init . global-anzu-mode)
  :init
  (setq anzu-mode-lighter "")
  (setq anzu-deactivate-region t)
  (setq anzu-search-threshold 1000)
  (setq anzu-replace-threshold 50)
  (setq anzu-replace-to-string-separator " => ")
  ;; (global-set-key [remap query-replace] 'anzu-query-replace)
  ;; (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  )

(use-package auto-sudoedit
  :disabled t
  :hook(after-init . auto-sudoedit-mode)
  )

(use-package shift-number)

(use-package undo-fu)

(use-package wgrep)

(require 'init-color-rg)

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
