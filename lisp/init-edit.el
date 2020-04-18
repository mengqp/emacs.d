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
  :config
  (dolist (hook (list
		 'emacs-lisp-mode-hook
		 'lisp-interaction-mode-hook
		 'lisp-mode-hook
		 'sh-mode-hook
		 'makefile-gmake-mode-hook
		 'php-mode-hook
		 'python-mode-hook
		 'js-mode-hook
		 'go-mode-hook
		 'qml-mode-hook
		 'jade-mode-hook
		 'css-mode-hook
		 'ruby-mode-hook
		 'coffee-mode-hook
		 'rust-mode-hook
		 'qmake-mode-hook
		 'lua-mode-hook
		 'swift-mode-hook
		 'web-mode-hook
		 'markdown-mode-hook
		 'llvm-mode-hook
		 'conf-toml-mode-hook
		 'plantuml-mode-hook
		 ))
    (add-hook hook #'aggressive-indent-mode))
  (setq aggressive-indent-modes-to-prefer-defun '(emacs-lisp-mode lisp-mode scheme-mode clojure-mode c-mode c++-mode))
  (setq aggressive-indent-dont-electric-modes t)
  (setq aggressive-indent-sit-for-time 0.5)
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
  ;; :bind
  ;; (("C-;" . iedit-mode)
  ;;  ("C-x r RET" . iedit-rectangle-mode)
  ;;  :map isearch-mode-map ("C-;" . iedit-mode-from-isearch)
  ;;  :map esc-map ("C-;" . iedit-execute-last-modification)
  ;;  :map help-map ("C-;" . iedit-mode-toggle-on-function))
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
  :bind ("C-," . goto-last-change)
  :preface
  (defmacro undo-tree-node-p (n)
    (let ((len (length (undo-tree-make-node nil nil))))
      `(and (vectorp ,n) (= (length ,n) ,len))))
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
    :bind*
    (
	  ;; ("C-c bf" . format-all-buffer)
	  ("M-i ff" . format-all-buffer)
	  )
    :defer t
    ;; :init
    ;; (add-hook 'prog-mode-hook #'format-all-mode )
    )

  (use-package lazy-search
    :bind*
    ("M-s w" . lazy-search)
    ;; :config
    ;; (global-set-key (kbd "M-s") 'lazy-search)
    )


  ;; auto insert closing bracket
  ;; (electric-pair-mode 1)
  (use-package awesome-pair
    ;; :disabled t
    ;; :hook (prog-mode . #'awesome-pair-mode)
    :init
    (add-hook 'prog-mode-hook '(lambda () (awesome-pair-mode 1)))
    :config
    (define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
    (define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
    (define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
    (define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
    (define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
    (define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
    (define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)

    (define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)

    ;; (define-key awesome-pair-mode-map (kbd "M-o") 'awesome-pair-backward-delete)
    ;; (define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)

    (define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote)
    (define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
    (define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
    (define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
    (define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)

    ;; (define-key awesome-pair-mode-map (kbd "M-p") 'awesome-pair-jump-left)
    ;; (define-key awesome-pair-mode-map (kbd "M-n") 'awesome-pair-jump-right)
    ;; (define-key awesome-pair-mode-map (kbd "M-:") 'awesome-pair-jump-out-pair-and-newline)

    )
  )



;; ;; Kill & Mark things easily
;; (use-package easy-kill-extras
;;   :ensure t
;;   :bind (([remap kill-ring-save] . easy-kill)
;; 	 ([remap mark-sexp] . easy-mark-sexp)
;; 	 ([remap mark-word] . easy-mark-word)

;; 	 ;; Integrate `zap-to-char'
;; 	 ([remap zap-to-char] . easy-mark-to-char)
;; 	 ([remap zap-up-to-char] . easy-mark-up-to-char)

;; 	 ;; Integrate `expand-region'
;; 	 :map easy-kill-base-map
;; 	 ("o" . easy-kill-er-expand)
;; 	 ("i" . easy-kill-er-unexpand))
;;   :init
;;   (setq easy-kill-alist '((?w word           " ")
;; 			  (?s sexp           "\n")
;; 			  (?l list           "\n")
;; 			  (?f filename       "\n")
;; 			  (?d defun          "\n\n")
;; 			  (?D defun-name     " ")
;; 			  (?e line           "\n")
;; 			  (?b buffer-file-name)

;; 			  (?^ backward-line-edge "")
;; 			  (?$ forward-line-edge "")
;; 			  (?h buffer "")
;; 			  (?< buffer-before-point "")
;; 			  (?> buffer-after-point "")
;; 			  (?f string-to-char-forward "")
;; 			  (?F string-up-to-char-forward "")
;; 			  (?t string-to-char-backward "")
;; 			  (?T string-up-to-char-backward ""))))

(use-package hungry-delete
  :ensure t
  :diminish hungry-delete-mode
  :hook (after-init . global-hungry-delete-mode)
  :config
  (cua-mode t)
  )

;; (use-package anzu
;;   :ensure t
;;   :config
;;   (global-anzu-mode t)

;;   (set-face-attribute 'anzu-mode-line nil
;; 		      :foreground "yellow" :weight 'bold)

;;   (custom-set-variables
;;    '(anzu-mode-lighter "")
;;    '(anzu-deactivate-region t)
;;    '(anzu-search-threshold 1000)
;;    '(anzu-replace-threshold 50)
;;    '(anzu-replace-to-string-separator " => ")
;;    )

;;   (global-set-key [remap query-replace] 'anzu-query-replace)
;;   (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
;;   )



;; (use-package crux
;;   :ensure t
;;   :defer t
;;   :bind
;;   (
;;    ("C-k" . crux-smart-kill-line)
;;    ("S-<return>" . crux-smart-open-line-above)
;;    ("M-RET" . crux-smart-open-line)
;;    ;; ("C-c d" . crux-duplicate-current-line-or-region)
;;    ("C-M-z" . crux-indent-defun)
;;    ("C-^" . crux-top-join-line)
;;    )
;;   :chords
;;   (
;;    ;; ("JJ" . crux-switch-to-previous-buffer)
;;    ;; ("dd" . crux-kill-whole-line)
;;    ;; ("cl" . crux-duplicate-current-line-or-region)
;;    ;; ("cd" . crux-duplicate-and-comment-current-line-or-region)
;;    )
;;   )


(use-package key-chord
  :ensure t
  :disabled t
  :config
  (key-chord-mode t)
  ;; (key-chord-define-global "jj"     'avy-goto-word-1)
  ;; (key-chord-define-global "ji" 'imenu)
  ;; (key-chord-define-global ";;" 'comment-dwim-2)
  ;; (key-chord-define-global "f." 'find-file-at-point)

  )

;; (use-package electric-operator
;;   :ensure t
;;   :commands  (electric-operator electric-operator-mode )
;;   :defer t
;;   :hook (prog-mode. electric-operator-mode)
;;   :config
;;   (electric-operator-add-rules-for-mode 'lisp-mode
;; 					(cons "-" nil))
;;   )

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
  :init
  (add-hook 'cc-mode-hook 'column-enforce-mode)
  :config
  (setq column-enforce-column 81)
  )

;; (use-package insert-translated-name
;;   ;; :defer t
;;   ;; :init
;;   ;; :config
;;   ;; (setq insert-translated-name-translate-engine "youdao")
;;   )

;; Show the current function name in the header line
(use-package which-function-mode
  :ensure nil
  :disabled t
  :defer t
  :config
  (require 'imenu)
  ;; when editing js file, this feature is very useful
  (setq-default header-line-format
                '((which-func-mode ("" which-func-format " "))))

  (setq-default mode-line-misc-info
                (assq-delete-all 'which-function-mode mode-line-misc-info))
  ;; (setq mode-line-format (delete (assoc 'which-function-mode
  ;; 					mode-line-format) mode-line-format)
  ;; 	which-func-header-line-format '(which-func-mode ("" which-func-format)))

  ;; (defadvice which-func-ff-hook (after header-line activate)
  ;;   (when which-func-mode
  ;;     (setq mode-line-format (delete (assoc 'which-func-mode
  ;; 					    mode-line-format) mode-line-format)
  ;; 	    header-line-format which-func-header-line-format)))
  ;; (setq-default header-line-format
  ;; 		'((which-func-mode ("" which-func-format " "))))
  ;; (setq mode-line-misc-info
  ;; 	;; We remove Which Function Mode from the mode line, because it's mostly
  ;; 	;; invisible here anyway.
  ;; 	(assq-delete-all 'which-func-mode mode-line-misc-info))
  )

(use-package auto-sudoedit
  :ensure t
  :defer 10
  :config
  (auto-sudoedit-mode 1)
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

(use-package separedit
  :ensure t
  :defer t
  :hook
  (prog-mode . separedit-mode )
  :bind
  (("C-c '" . #'separedit))
  )

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
