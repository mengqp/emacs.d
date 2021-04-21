;;; init-edit.el --- some edit work -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

;; Edit multiple regions in the same way simultaneously
(use-package iedit)

;; https://github.com/emacs-evil/goto-chg/issues/3
;; Goto last change
(use-package goto-chg)

(use-package expand-region)

(use-package format-all)

(use-package awesome-pair
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
	("\"" . awesome-pair-double-quote)
	("SPC" . awesome-pair-space)
	)
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

(use-package auto-sudoedit)

(use-package shift-number)

(use-package undo-fu)

(use-package wgrep)

(use-package color-rg
  :ensure nil
  :load-path "site-lisp/color-rg"
  )

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
