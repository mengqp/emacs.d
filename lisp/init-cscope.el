;;; init-cscope.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package xcscope
  :ensure t
  ;; :disabled t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'cscope-minor-mode)
  (add-hook 'c-mode-hook 'cscope-minor-mode)
  :config
  (cscope-setup)

  (general-define-key :states '(normal motion)
		      :keymaps '(c++-mode-map
				 c-mode-map)
		      :prefix ";"
		      "s" 'cscope-find-this-symbol
		      "d" 'cscope-find-global-definition
		      ;; "c" 'helm-cscope-find-called-function
		      "C" 'cscope-find-calling-this-function
		      "i" 'cscope-index-files
		      )

  (define-key cscope-list-entry-keymap [return] nil)
  (define-key cscope-list-entry-keymap [o] nil)
  (define-key cscope-list-entry-keymap [q] nil)
  (general-define-key :states '(normal motion insert)
		      :keymaps '(cscope-list-entry-keymap)
		      "\r" 'cscope-select-entry-one-window
		      "o" 'cscope-select-entry-other-window
		      "q" 'quit-window
		      )
  ;; (evil-set-initial-state 'cscope-list-entry-mode 'emacs)


  ;; (general-define-key :states '(normal motion)
  ;; (setq cscope-program “gtags-cscope”)
  ;; (use-package helm-cscope
  ;;   :ensure t
  ;;   :defer t)

  ;; (general-define-key :states '(normal motion)
  ;; 		      :keymaps '(c++-mode-map
  ;; 				 c-mode-map)
  ;; 		      :prefix ";"
  ;; 		      "s" 'helm-cscope-find-this-symbol
  ;; 		      "d" 'helm-cscope-find-global-definition
  ;; 		      ;; "c" 'helm-cscope-find-called-function
  ;; 		      "C" 'helm-cscope-find-calling-this-function
  ;; 		      "i" 'cscope-index-files
  ;; 		      )
  )

(provide 'init-cscope)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cscope.el ends here
