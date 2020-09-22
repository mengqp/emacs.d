;;; init-company.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :hook ((prog-mode org-mode) . company-mode)
  ;; :bind
  ;; (("M-/" . company-complete)
  ;;  ("C-c C-y" . company-yasnippet)
  ;;  ("<backtab>" . company-yasnippet)
  ;;  :map company-active-map
  ;;  ("C-p" . company-select-previous)
  ;;  ("C-n" . company-select-next)
  ;;  ("<tab>" . company-complete-common-or-cycle)
  ;;  ("C-c C-y" . my-company-yasnippet)
  ;;  :map company-search-map
  ;;  ("C-p" . company-select-previous)
  ;;  ("C-n" . company-select-next))
  :init
  ;; 设置等待时间
  (setq company-idle-delay 0.2)
  ;; 补全起始长度
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)

  :config
  (use-package company-posframe
    :ensure t
    :defer t
    :diminish company-posframe-mode
    :config
    (company-posframe-mode 1)
    ;; (use-package desktop
    ;;   :defer t
    ;;   :config
    ;;   (push '(company-childframe-mode . nil)
    ;; 	    desktop-minor-mode-table
    ;; 	    ))
    )

  )

(provide 'init-company)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-company.el ends here
