;;; init-edit.el --- some edit work -*- coding: utf-8-unix -*-

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

(use-package aggressive-indent
  :ensure t
  :disabled t
  :defer t
  :hook ((prog-mode) . aggressive-indent-mode)
  ;; :hook ((emacs-lisp-mode-hook
  ;; 	  lisp-interaction-mode-hook
  ;; 	  lisp-mode-hook
  ;; 	  makefile-gmake-mode-hook
  ;; 	  php-mode-hook
  ;; 	  python-mode-hook
  ;; 	  css-mode-hook
  ;; 	  plantuml-mode-hook
  ;; 	  ) . aggressive-indent-mode)
  :diminish aggressive-indent-mode
  ;; :config
  :init
  (setq aggressive-indent-modes-to-prefer-defun '(emacs-lisp-mode lisp-mode scheme-mode clojure-mode c-mode c++-mode))
  (setq aggressive-indent-dont-electric-modes t)
  (setq aggressive-indent-sit-for-time 0.5)
  :config
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (derived-mode-p 'cc-mode)
	 (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
			     (thing-at-point 'line)))))
  )

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
  :disabled t
  :defer t
  :bind ("C-," . goto-last-change)
  )

(use-package multiple-cursors
  :ensure t
  :disabled t
  :defer t
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this)
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
  ;; :disabled t
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
  (custom-set-variables
   '(anzu-mode-lighter "")
   '(anzu-deactivate-region t)
   '(anzu-search-threshold 1000)
   '(anzu-replace-threshold 50)
   '(anzu-replace-to-string-separator " => ")
   )
  :config
  (set-face-attribute 'anzu-mode-line nil
		      :foreground "yellow" :weight 'bold)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  )

(use-package symbol-overlay
  :ensure t
  :defer t
  )

(use-package column-enforce-mode
  :ensure t
  :defer t
  :diminish column-enforce-mode
  :hook((cc-mode python-mode) . column-enforce-mode)
  :config
  (setq column-enforce-column 80)
  )

(use-package auto-sudoedit
  :ensure t
  ;; :disabled t
  :defer t
  :hook(after-init . auto-sudoedit-mode)
  )

(use-package shift-number
  :ensure t
  :defer t
  :bind* (
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

(require 'init-color-rg)

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
