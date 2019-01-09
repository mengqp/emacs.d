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
  ;; :disabled t
  :defer t
  :diminish aggressive-indent-mode
  :init
  (add-hook 'prog-mode-hook #'aggressive-indent-mode)
  ;; (add-hook 'c-mode-hook #'aggressive-indent-mode)
  ;; (add-hook 'c++-mode-hook #'aggressive-indent-mode)
  :config
  (setq aggressive-indent-modes-to-prefer-defun '(emacs-lisp-mode lisp-mode scheme-mode clojure-mode c-mode c++-mode))
  (setq aggressive-indent-dont-electric-modes t)
  (setq aggressive-indent-sit-for-time 0.5)
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (derived-mode-p 'cc-mode)
	 (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
			     (thing-at-point 'line)))))
  ;; (add-to-list
  ;;  'aggressive-indent-dont-indent-if
  ;;  '(and (derived-mode-p 'c-mode)
  ;; 	 (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
  ;; 			     (thing-at-point 'line)))))


  )

(use-package multiple-cursors
  :ensure t
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

(use-package visual-regexp
  :ensure t

  )

(use-package auto-save
  :defer 2
  :config
  (setq auto-save-delete-trailing-whitespace t)
  (auto-save-enable)              ;; 开启自动保存功能
  (setq auto-save-silent t)       ;; 自动保存的时候静悄悄的， 不要打扰我
  )

(use-package superword-mode
  :defer t
  :diminish superword-mode
  ;; :init
  ;; (add-hook 'prog-mode-hook #'superword-mode)
  )

(use-package format-all
  :ensure t
  :defer t
  ;; :init
  ;; (add-hook 'prog-mode-hook #'format-all-mode )
  )

(use-package thing-edit
  :defer t


  )

(use-package anzu
  :ensure t
  :config
  (global-anzu-mode t)

  (set-face-attribute 'anzu-mode-line nil
		      :foreground "yellow" :weight 'bold)

  (custom-set-variables
   '(anzu-mode-lighter "")
   '(anzu-deactivate-region t)
   '(anzu-search-threshold 1000)
   '(anzu-replace-threshold 50)
   '(anzu-replace-to-string-separator " => ")
   )

  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  )

(use-package awesome-pair
  :disabled t
  :init
  (add-hook 'prog-mode-hook #'awesome-pair-mode )
  :config
  (define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
  (define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
  (define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
  (define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
  (define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
  (define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)

  (define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
  (define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)

  ;; (define-key awesome-pair-mode-map (kbd "M-o") 'awesome-pair-backward-delete)
  ;; (define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)

  (define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote)
  (define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
  (define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
  (define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
  (define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)

  (define-key awesome-pair-mode-map (kbd "M-p") 'awesome-pair-jump-left)
  (define-key awesome-pair-mode-map (kbd "M-n") 'awesome-pair-jump-right)
  ;; (define-key awesome-pair-mode-map (kbd "M-:") 'awesome-pair-jump-out-pair-and-newline)

  )

(use-package lazy-search
  :config
  (global-set-key (kbd "M-s") 'lazy-search)
  )

;; (use-package insert-translated-name
;;   ;; :defer t
;;   ;; :init
;;   ;; :config
;;   ;; (setq insert-translated-name-translate-engine "youdao")
;;   )

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
