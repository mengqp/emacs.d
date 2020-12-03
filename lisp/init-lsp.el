;;; init-lsp.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:


(use-package lsp-mode
  :defer t
  ;; :disabled t
  :ensure t
  :diminish lsp-mode
  :hook ((c-mode c++-mode objc-mode python-mode) . #'lsp)
  ;; :bind (:map lsp-mode-map
  ;;             ;; ("C-c C-d" . lsp-describe-thing-at-point)
  ;;             ([remap xref-find-definitions] . lsp-find-definition)
  ;;             ([remap xref-find-references] . lsp-find-references)
  ;; 	      )
  :init
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (setq lsp-keymap-prefix "C-c l")
  ;; (setq lsp-auto-guess-root t)
  (setq lsp-inhibit-message t)
  (setq lsp-message-project-root-warning t)
  (setq create-lockfiles nil)
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-file-watch-threshold nil)
  (setq lsp-enable-snippet t)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-pyright t)
  (setq lsp-python-ms-disabled t)
  )

(use-package lsp-ui
  :ensure t
  ;; :disabled t
  :defer t
  :hook
  (lsp-mode . lsp-ui-mode)
  :custom-face
  (lsp-ui-doc-background ((t (:background nil))))
  (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :init
  (remove-hook 'lsp-ui-imenu-mode-hook 'lsp-ui-imenu-enable )
  (setq lsp-ui-doc-enable t
	lsp-ui-doc-header t
	lsp-ui-doc-include-signature t
	lsp-ui-doc-position 'top
	;; lsp-ui-doc-use-webkit nil
	lsp-ui-doc-use-webkit t
	lsp-ui-doc-border (face-foreground 'default)
	lsp-ui-doc-position 'at-point
	lsp-ui-doc-delay 1
	lsp-ui-sideline-enable t
	lsp-ui-sideline-ignore-duplicate t
	lsp-ui-sideline-show-diagnostics nil
	lsp-ui-sideline-show-symbol t
	lsp-ui-sideline-show-hover t
	lsp-ui-sideline-show-code-actions t
	lsp-ui-sideline-delay 2
	lsp-ui-flycheck-enable t
	lsp-ui-imenu-enable nil
	lsp-ui-imenu-kind-position 'left
	)
  )

(use-package lsp-ivy
  :ensure t
  :defer t)


(use-package ccls
  :ensure t
  :defer t
  ;; :disabled t
  ;; :commands lsp-ccls-enable
  ;; :hook ((c-mode c++-mode objc-mode) .
  ;;        (lambda () (require 'ccls) (lsp)))
  ;; :hook ((c-mode c++-mode objc-mode) .
  ;;        (lambda () (require 'nox) (nox-ensure)))
  :config
  (setq ccls-executable "/usr/bin/ccls")
  )

(use-package lsp-python-ms
  :disabled t
  :ensure t
  :hook
  (python-mode . (lambda () (require 'lsp-python-ms)))
  :init
  (setq lsp-python-ms-executable (executable-find "python-language-server"))
  (setq lsp-python-ms-auto-install-server t)
  (when (executable-find "python3")
    (setq lsp-python-ms-python-executable-cmd "python3"))
  ;; :hook (python-mode . (lambda ()
  ;;                         (require 'lsp-python-ms)
  ;;                         (lsp))))  ; or lsp-deferred
  ;; :hook (python-mode . (lambda ()
  ;;                         (require 'lsp-python-ms)
  ;;                         (nox)))
  ;; :init
  ;; (when (executable-find "python3")
  ;;      (setq lsp-python-ms-python-executable-cmd "python3"))
  ;; (setq lsp-python-ms-executable
  ;;     "~/.emacs.d/.cache/lsp/mspyls/Microsoft.Python.LanguageServer")
  ;; (nox-print-mspyls-download-url)

  )

(use-package lsp-pyright
  :disabled t
  :ensure t
  :defer t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred


;; (use-package nox
;;   :disabled t
;;   :defer t
;;   :hook ((c-mode c++-mode objc-mode python-mode) .
;;          (lambda () (require 'nox) (nox-ensure)))
;;   :init
;;   (setq nox-doc-tooltip-font-size 17)
;;   )


(provide 'init-lsp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lsp.el ends here
