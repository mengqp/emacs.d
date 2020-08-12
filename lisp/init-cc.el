;;; init-cc.el --- xxx -*- coding: utf-8-unix -*-

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


;; (use-package google-c-style
;;   :ensure t
;;   :defer t
;;   :init
;;   (progn
;; ;;; 定义 tab 和缩进
;;     (defun mengqp/google-c-mode-hook ()
;;       (setq c-basic-offset 4          ;; 基本缩进宽度
;; 	    c-default-style "linux"
;; 	    indent-tabs-mode nil       ;; 禁止空格替换 Tab
;; 	    tab-width 4
;; 	    ))     ;; 默认 Tab 宽度

;;     (add-hook 'c-mode-common-hook 'google-set-c-style)
;;     (add-hook 'c++-mode-common-hook 'google-set-c-style)
;;     (add-hook 'c-mode-common-hook 'google-make-newline-indent)
;;     (add-hook 'c++-mode-common-hook 'google-make-newline-indent)
;;     (add-hook 'c-mode-hook 'mengqp/google-c-mode-hook)
;;     (add-hook 'c++-mode-hook 'mengqp/google-c-mode-hook)
;;     )
;;   )


(use-package cc-mode
  :ensure nil
  :defer t
  :hook (c-mode-common . (lambda ()
                           (c-set-style "linux")
                           (setq tab-width 4)
			   (setq c-basic-offset 4)
			   indent-tabs-mode nil       ;; 禁止空格替换 Tab
			   ))
  :config
  (general-define-key :states '(normal motion)
		    :keymaps '(c++-mode-map
			       c-mode-map)
		    :prefix ";"
		    "a" 'projectile-find-other-file
		    )
  )

(use-package doxy-graph-mode
  :ensure t
  :disabled t
  :init
  (add-hook 'c-mode-hook 'doxy-graph-mode)
  (add-hook 'c++-mode-hook 'doxy-graph-mode)
  (add-hook 'python-mode-hook 'doxy-graph-mode)
  )





;; (use-package dynamic-spaces
;;   :ensure t
;;   :init
;;   (add-hook 'c-mode-common-hook 'dynamic-spaces-mode)
;;   (add-hook 'c++-mode-common-hook 'dynamic-spaces-mode)
;;   )






(provide 'init-cc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cc.el ends here
