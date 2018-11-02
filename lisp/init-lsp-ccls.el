;;; init-lsp-ccls.el --- ccls -*- coding: utf-8-unix -*-

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


(use-package ccls
  :ensure t
  ;; :disabled t
  :commands lsp-ccls-enable
  :init
  (add-hook 'c-mode-common-hook #'lsp-ccls-enable)
  :config
  ;; (add-hook 'ccls-tree-mode-hook #'evil-motion-state)
  ;; (evil-set-initial-state 'ccls-tree-mode 'emacs)

  (setq ccls-executable "/usr/bin/ccls")
  (use-package projectile
    :config
    (setq projectile-project-root-files-top-down-recurring
	  (append '("compile_commands.json"
		    ".ccls")
		  projectile-project-root-files-top-down-recurring))
    (add-to-list 'projectile-globally-ignored-directories ".ccls-cache")
    )

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



(provide 'init-lsp-ccls)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lsp-ccls.el ends here
