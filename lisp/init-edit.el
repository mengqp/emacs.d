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
  ;; :ensure nil
  :load-path "site-lisp/awesome-pair"
  :hook
  (prog-mode . awesome-pair-mode)
  :bind
  (:map awesome-pair-mode-map
        ("(" . awesome-pair-open-round)
        ("[" . awesome-pair-open-bracket)
        ("{" . awesome-pair-open-curly)
        (")" . awesome-pair-close-round)
        ("]" . awesome-pair-close-bracket)
        ("}" . awesome-pair-close-curly)
        ("C-d" . awesome-pair-forward-delete)
        ("C-k" . awesome-pair-kill)
        ("M-\"" . awesome-pair-wrap-double-quote)
        ("M-[" . awesome-pair-wrap-bracket)
        ("M-{" . awesome-pair-wrap-curly)
        ("M-(" . awesome-pair-wrap-round)
        ("M-)" . awesome-pair-unwrap))
	("M-p" . awesome-pair-jump-left)
        ("M-n" . awesome-pair-jump-right)
        ("M-:" . awesome-pair-jump-out-pair-and-newline) ;跳出括号并换行
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
