;;; init-lsp.el --- xxx -*- coding: utf-8-unix -*-

;;; Copyright © 2018 - 2018 mengqp.

;; Author: mengqp
;; URL:
;; Version:0.0.1
;; Keywords:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package lsp-mode
  ;; :disabled t
  ;; :load-path "~/.emacs.d/site-lisp/lsp-mode/"
  :defer t
  :diminish lsp-mode
  :init
  (add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
  :config
  (require 'lsp-clients)
  ;; (setq lsp-auto-guess-root t)
  (setq lsp-inhibit-message t)
  (setq lsp-message-project-root-warning t)
  (setq create-lockfiles nil)
  (setq lsp-prefer-flymake nil)
  (flymake-mode-off)

  (use-package company-lsp
    :config
    (push 'company-lsp company-backends)
    (push 'company-tabnine company-backends)
    (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
    )

  (use-package lsp-ui
    :custom-face
    (lsp-ui-doc-background ((t (:background nil))))
    (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
    :init
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (remove-hook 'lsp-ui-imenu-mode-hook 'lsp-ui-imenu-enable )
    (setq lsp-ui-doc-enable t
	  lsp-ui-doc-header t
	  lsp-ui-doc-include-signature t
	  lsp-ui-doc-position 'top
	  ;; lsp-ui-doc-use-webkit t
	  lsp-ui-doc-border (face-foreground 'default)

	  lsp-ui-sideline-enable t
	  lsp-ui-sideline-ignore-duplicate t
	  lsp-ui-sideline-show-diagnostics nil
	  lsp-ui-sideline-show-symbol t
	  lsp-ui-sideline-show-hover t
	  lsp-ui-sideline-show-code-actions t
	  lsp-ui-sideline-delay 0.5

	  lsp-ui-imenu-enable nil
	  lsp-ui-imenu-kind-position 'left
	  )

    :config

    (require 'imenu)
    ;; (setq lsp-ui-sideline-enable nil)
    ;; (lsp-ui-imenu-enable nil)
    ;; (setq lsp-ui-imenu-enable nil)
    ;; (setq lsp-ui-imenu nil)
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)


    )

  )

;; (use-package eglot
;;   :ensure t
;;   :disabled t
;;   :defer t
;;   :init
;;   (add-hook 'c-mode-common-hook 'eglot-ensure)
;;   ;; (add-hook 'c-mode-hook 'eglot-ensure)
;;   ;; (add-to-list 'eglot-server-programs
;;   ;; 	       '((c++ mode c-mode) . (eglot-cquery "ccls")))
;;   :config
;;   (add-to-list 'eglot-server-programs '((c++-mode c-mode) . (eglot-cquery "ccls")))
;;   (setq eglot-ignored-server-capabilites '(:hoverProvider)) ;disable show help document in minibuffer

;;   )


(use-package ccls
  ;; :load-path "~/.emacs.d/site-lisp/ccls/"
  ;; :ensure t
  ;; :disabled t
  :commands lsp-ccls-enable
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp)))
  ;; :init
  ;; (add-hook 'c-mode-common-hook (lambda () (require 'ccls) (lsp)))
  :config
  ;; (setq ccls-args '("--log-file=/tmp/ccls-test.out" "-v=3"))
  (setq projectile-require-project-root t)
  (setq ccls-executable "/usr/bin/ccls")

  ;; (use-package projectile
  ;;   :config
  ;;   (setq projectile-project-root-files-top-down-recurring
  ;; 	  (append '("compile_commands.json"
  ;; 		    ".ccls")
  ;; 		  projectile-project-root-files-top-down-recurring))
  ;;   (add-to-list 'projectile-globally-ignored-directories ".ccls-cache")
  ;;   )

  ;; (ccls-navigate "D") ;; roughly sp-down-sexp
  ;; (ccls-navigate "L")
  ;; (ccls-navigate "R")
  ;; (ccls-navigate "U")

  ;; (ccls-xref-find-custom "$ccls/base")
  ;; (ccls-xref-find-custom "$ccls/callers")
  ;; (ccls-xref-find-custom "$ccls/derived")
  ;; (ccls-xref-find-custom "$ccls/vars")

  ;; ;; Alternatively, use lsp-ui-peek interface
  ;; (lsp-ui-peek-find-custom 'base "$ccls/base")
  ;; (lsp-ui-peek-find-custom 'callers "$ccls/callers")
  ;; (lsp-ui-peek-find-custom 'random "$ccls/random") ;; jump to a random declaration

  ;; (setq ccls-sem-highlight-method 'font-lock)
  ;; alternatively, (setq ccls-sem-highlight-method 'overlay)

  ;; For rainbow semantic highlighting
  ;; (ccls-use-default-rainbow-sem-highlight)

  (setq ccls-extra-init-params
	'(
	  :clang (:extraArgs ("-D__cpp_deduction_guides=0" "-Wno-macro-redefined"))
	  :completion (:detailedLabel t)
	  :diagnostics (:frequencyMs 5000)
	  :index (:initialReparseForDependency :json-false)))


  ;; (setq ccls-extra-init-params '(:completion (:detailedLabel t)))
  (general-define-key :states '(normal motion)
		      :keymaps '(c++-mode-map
				 c-mode-map)
		      :prefix ";"
		      "d" 'xref-find-definitions
		      "r" 'xref-find-references
		      ;; "m" 'lsp-ui-imenu
		      "cm" 'ccls-member-hierarchy
		      "cc" 'ccls-call-hierarchy
		      "cp" 'ccls-inheritance-hierarchy
		      ;; "n" 'ccls-navigate
		      )


  )

;; lsp-auto-require-clients defaults to t, lsp-clients is required and clangd is registered.
;; If you don't want to see prompt for the choice between ccls and clangd for every new file
(with-eval-after-load 'lsp-clients
  (remhash 'clangd lsp-clients)
  )

(provide 'init-lsp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lsp.el ends here
