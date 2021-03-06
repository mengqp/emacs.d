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
  :hook ((emacs-lisp-mode-hook
	  lisp-interaction-mode-hook
	  lisp-mode-hook
	  sh-mode-hook
	  makefile-gmake-mode-hook
	  php-mode-hook
	  python-mode-hook
	  js-mode-hook
	  go-mode-hook
	  qml-mode-hook
	  jade-mode-hook
	  css-mode-hook
	  ruby-mode-hook
	  coffee-mode-hook
	  rust-mode-hook
	  qmake-mode-hook
	  lua-mode-hook
	  swift-mode-hook
	  web-mode-hook
	  markdown-mode-hook
	  llvm-mode-hook
	  conf-toml-mode-hook
	  plantuml-mode-hook
	  ) . aggressive-indent-mode)
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

;; ;; An all-in-one comment command to rule them all
;; (use-package comment-dwim-2
;;   :ensure t
;;   :defer t
;;   :bind ([remap comment-dwim] . comment-dwim-2)) ;

;; Edit multiple regions in the same way simultaneously
(use-package iedit
  :ensure t
  :defer t
  :bind
  (("C-;" . iedit-mode)
   ("C-x r RET" . iedit-rectangle-mode)
   )
  )

;; ;; Move to the beginning/end of line or code
;; (use-package mwim
;;   :ensure t
;;   :bind (([remap move-beginning-of-line] . mwim-beginning-of-code-or-line)
;; 	 ([remap move-end-of-line] . mwim-end-of-code-or-line))
;;   )

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

(use-package thing-edit
  :defer t
  :disabled t
  :bind*
  (
   ;; ("M-h" . hydra-thing-edit/body)
   ("M-h s" . thing-copy-symbol )
   ("M-h f" . thing-copy-filename )
   ("M-h x" . thing-copy-sexp )
   ("M-h g" . thing-copy-page )
   ("M-h t" . thing-copy-sentence )
   ("M-h o" . thing-copy-whitespace )
   ("M-h i" . thing-copy-list )
   ("M-h c" . thing-copy-comment )
   ("M-h d" . thing-copy-defun )
   ("M-h p" . thing-copy-parentheses )
   ("M-h l" . thing-copy-line )
   ("M-h a" . thing-copy-to-line-beginning )
   ("M-h e" . thing-copy-to-line-end )
   ("M-h r" . thing-copy-region-or-line )
   ("M-h n" . thing-copy-number )
   ("M-h h" . thing-copy-whole-buffer )
   ;; Cut
   ("M-h W" . thing-cut-word )
   ("M-h S" . thing-cut-symbol )
   ("M-h F" . thing-cut-filename )
   ("M-h X" . thing-cut-sexp )
   ("M-h G" . thing-cut-page )
   ("M-h T" . thing-cut-sentence )
   ("M-h O" . thing-cut-whitespace )
   ("M-h I" . thing-cut-list )
   ("M-h C" . thing-cut-comment )
   ("M-h D" . thing-cut-defun )
   ("M-h P" . thing-cut-parentheses )
   ("M-h L" . thing-cut-line )
   ("M-h A" . thing-cut-to-line-beginning )
   ("M-h E" . thing-cut-to-line-end )
   ("M-h R" . thing-cut-region-or-line )
   ("M-h N" . thing-cut-number )
   ("M-h H" . thing-cut-whole-buffer )
   )
  )

;; (use-package visual-regexp
;;   :ensure t
;;   )

;; (use-package superword-mode
;;   :defer t
;;   :diminish superword-mode
;;   ;; :init
;;   ;; (add-hook 'prog-mode-hook #'superword-mode)
;;   )

(when *linux*

  (use-package format-all
    :ensure t
    :defer t
    :bind*
    (
     ("M-i ff" . format-all-buffer)
     )
    :defer t
    ;; :init
    ;; (add-hook 'prog-mode-hook #'format-all-mode )
    )

  (use-package lazy-search
    :defer t
    :bind*
    ("M-s w" . lazy-search)
    ;; :config
    ;; (global-set-key (kbd "M-s") 'lazy-search)
    )


  ;; auto insert closing bracket
  (use-package smartparens
    :ensure t
    :disabled t
    :defer t
    :hook( prog-mode . smartparens-mode)
    :bind
    (:map smartparens-mode-map
	  ("C-M-a" . sp-beginning-of-sexp)
	  ("C-M-e" . sp-end-of-sexp)

	  ("C-M-f" . sp-forward-sexp)
	  ("C-M-b" . sp-backward-sexp)

	  ("C-M-n" . sp-next-sexp)
	  ("C-M-p" . sp-previous-sexp)
	  )
    :diminish smartparens-mode smartparens-global-mode
    :config
    ;; enable the default configuration
    (use-package smartparens-config
      :defer t)
    (smartparens-strict-mode t)


    (defhydra init-sp-menu (:color pink
				   :hint nil)
      "
    ^wrap^                        ^unwrap^            ^func^
    ^^^^^^^^-----------------------------------------------------------------
    _r_: sp-rewrap-sexp          _u_: sp-unwrap-sexp   _<left>_: ()i->(i)
    _)_: ()                      _'_: '                _<right>_: (i)->()
    _]_: []                      _\"_:\"\"             _}_: {}
    "
      ("r" sp-rewrap-sexp)
      (")" sp-wrap-round)
      ("]" sp-wrap-square)
      ("}" sp-wrap-curly)
      ("'" wrap-with-single-quotes)
      ("\"" wrap-with-double-quotes)

      ("u" sp-unwrap-sexp)
      ("[" sp-backward-unwrap-sexp)
      ("<right>" sp-forward-barf-sexp)
      ("<left>" sp-forward-slurp-sexp)

      ("q" nil "quit")
      )

    (defun init-sp-menu-func ()
      (interactive)
      (init-sp-menu)
      )

    )

  ;; Automatic parenthesis pairing
  (use-package elec-pair
    :ensure nil
    ;; :disabled t
    :defer t
    :hook (after-init . electric-pair-mode)
    :init (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))

  (use-package awesome-pair
    ;; :disabled nil
    ;; :load-path "/home/mengqp/.emacs.d/site-lisp/awesome-pair/awesome-pair.el"
    :defer t
    ;; :hook (after-init . awesome-pair-mode)
    ;; :bind
    ;; (:map awesome-pair-mode-map
    ;; 	  ("(" .  awesome-pair-open-round)
    ;; 	  ("[" .  awesome-pair-open-bracket)
    ;; 	  ("{" .  awesome-pair-open-curly)
    ;; 	  (")" .  awesome-pair-close-round)
    ;; 	  ("]" .  awesome-pair-close-bracket)
    ;; 	  ("}" .  awesome-pair-close-curly)
    ;; 	  ("\"" . awesome-pair-double-quote)
    ;; 	  ("%" . awesome-pair-match-paren)
    ;; 	  ("C-k" . awesome-pair-kill)
    ;;  )
    )
  )

(use-package hungry-delete
  :ensure t
  :defer t
  :diminish hungry-delete-mode
  :hook (after-init . global-hungry-delete-mode)
  ;; :config
  ;; (cua-mode t)
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

(use-package key-chord
  :ensure t
  :disabled t
  :defer t
  :config
  (key-chord-mode t)
  ;; (key-chord-define-global "jj"     'avy-goto-word-1)
  ;; (key-chord-define-global "ji" 'imenu)
  ;; (key-chord-define-global ";;" 'comment-dwim-2)
  ;; (key-chord-define-global "f." 'find-file-at-point)

  )

(use-package symbol-overlay
  :ensure t
  :defer t
  :bind(
	("C-c h." . symbol-overlay-put)
	("C-c hr" . symbol-overlay-remove-all)
	)
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
  :disabled t
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
