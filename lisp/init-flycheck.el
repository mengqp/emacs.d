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
(use-package flycheck
  ;; :disabled t
  :ensure t
  :commands (flycheck flycheck-display-error-messages-unless-error-list)
  :commands (flycheck flycheck-list-errors)
  :commands (flycheck flycheck-get-error-list-window)
  :defer t
  :hook ((prog-mode org-mode) . flycheck-mode)
  :init
  ;;; 保存的时候自动检查
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  ;;; 显示 errors
  (setq flycheck-display-errors-function
	#'flycheck-display-error-messages-unless-error-list)

  (setq flycheck-mode-line-prefix "!")
  )

  ;; (use-package flycheck-posframe
  ;;   :ensure t
  ;;   :defer t
  ;;   :hook ((potframe-mode) . flycheck-posframe)
  ;;   :config
  ;;   (flycheck-posframe-configure-pretty-defaults)
  ;;   )



(provide 'init-flycheck)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-flycheck.el ends here
