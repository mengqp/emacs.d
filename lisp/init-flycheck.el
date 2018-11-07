;;; init-flycheck.el --- flycheck -*- coding: utf-8-unix -*-

;;; Copyright © 2018 - 2018 mengqp.

;; Author: mengqp
;; URL:
;; Version:$(4:0.0.1)
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

;;; 全局语法检查
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;;; c 和 c++
(use-package flycheck
  :ensure t
  :commands (flycheck flycheck-display-error-messages-unless-error-list)
  :commands (flycheck flycheck-list-errors)
  :commands (flycheck flycheck-get-error-list-window)
  :defer t
  :init
  ;; (add-hook 'c-mode-hook 'flycheck-mode)
  ;; (add-hook 'c++-mode-hook 'flycheck-mode)
  ;; (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'prog-mode-hook #'flycheck-mode)
  :config
;;; 保存的时候自动检查
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

;;; Tune error list display
  (add-to-list 'display-buffer-alist
	       `(,(rx bos "*Flycheck errors*" eos)
		 (display-buffer-reuse-window
		  display-buffer-in-side-window)
		 (side            . bottom)
		 (reusable-frames . visible)
		 (window-height   . 0.33)))

;;; 显示 errors
  (setq flycheck-display-errors-function
	#'flycheck-display-error-messages-unless-error-list)

  ;; 删除 Modline FlyC 显示为 e
  (setq flycheck-mode-line-prefix "!")

;;   ;; toggle flycheck window
;;   (defun mengqp/toggle-flycheck-error-list ()
;;     "Toggle flycheck's error list window.
;; If the error list is visible, hide it.  Otherwise, show it."
;;     (interactive)
;;     (-if-let (window (flycheck-get-error-list-window))
;; 	(quit-window nil window)
;;       (flycheck-list-errors)))

  ;; (use-package flycheck-package
  ;;   :ensure t
  ;;   :config
  ;;   (flycheck-package-setup)
  ;;   )
  ;;(eval-after-load 'flycheck
  ;;  '(flycheck-package-setup))
  ;; (require 'flycheck-pos-tip)
  ;; (with-eval-after-load 'flycheck
  ;;   (flycheck-pos-tip-mode))
  ;; (general-define-key :states '(normal motion)
  ;; 		      :keymaps '(c++-mode-map
  ;; 				 c-mode-map)
  ;; 		      :prefix ";"
  ;; 		      "el" 'mengqp/toggle-flycheck-error-list
  ;; 		      "en" 'flycheck-next-error
  ;; 		      "ep" 'flycheck-previous-error

  ;; 		      )

  ;; (which-key-add-major-mode-key-based-replacements 'c++-mode
  ;;   "; e" "error"
  ;;   )


  )

(use-package flycheck-pos-tip
  :ensure t
  :defer t
  :after flycheck
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-pos-tip-mode))



(provide 'init-flycheck)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-flycheck.el ends here
