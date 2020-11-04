;;; init-shell.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package aweshell
  :defer 10
  )

(use-package vterm
  ;; :disabled t
  :ensure t
  :init
  (setq vterm-shell "zsh")
  )

;; ;; (require exec-path-from-shell)

;; ;; (when (memq window-system '(mac ns x))
;; ;;   (exec-path-from-shell-initialize))
;; (defun eshell-here ()
;;   "Opens up a new shell in the directory associated with the\
;;     Current buffer's file. The eshell is renamed to match that
;;     directory to make multiple eshell windows easier."
;;   (interactive)
;;   ;; (let* ((parent (if (buffer-file-name)
;;   ;; 		     (file-name-directory (buffer-file-name))
;;   ;; 		   default-directory))
;;   ;; 	 (height (/ (window-total-height) 3))
;;   ;; 	 (name   (car (last (split-string parent "/" t)))))
;;   (let* ((height (/ (window-total-height) 3)))
;;     (split-window-vertically (- height))
;;     (other-window 1)
;;     (eshell nil)
;;     ;; (rename-buffer (concat "*eshell: " name "*"))

;;     ;; (insert (concat "ls"))
;;     ;; (eshell-send-input)
;;     ))

;; (defun eshell-evil-a ()
;;   "Quit eshell and delete window ."
;;   (interactive)
;;   (move-end-of-line nil)
;;   (evil-insert nil)
;;   (forward-char)
;;   )

;; (defun eshell-evil-q ()
;;   "Quit eshell and delete window ."
;;   (interactive)
;;   ;; (eshell-evil-a)
;;   ;; (insert (concat "exit"))
;;   ;; (eshell-send-input)
;;   (eshell-quit-process)
;;   (quit-window)
;;   (delete-window))


;; (use-package eshell
;;   :defer t
;;   :config


;;   (general-define-key :states '(normal motion)
;; 		      :keymaps '(eshell-mode-map)
;; 		      ;; :prefix ";"
;; 		      "q" 'eshell-evil-q
;; 		      "a" 'eshell-evil-a
;; 		      "i" 'eshell-evil-a
;; 		      )

;;   )

(provide 'init-shell)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-shell.el ends here
