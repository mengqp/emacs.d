;;; init-ace-jump.el --- xxx -*- coding: utf-8-unix -*-

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
(use-package avy
  :ensure t
  :defer t
  )

;; (use-package ace-pinyin
;;   :ensure t
;;   :diminish ace-pinyin-mode
;;   :after avy
;;   :config
;;   (use-package pinyinlib
;;     :ensure t
;;     )
;;   (ace-pinyin-global-mode t)
;;   )

;; (use-package evil-avy
;;   :ensure t
;;   :after avy
;;   :config
;;   (evil-avy-mode t)
;; )


;; ;; (require 'ace-jump-mode)
;; (use-package ace-jump-mode
;;   :ensure t
;;   :defer t)
;; (require 'ace-jump-helm-line)
;; (eval-after-load "helm"
;; '(define-key helm-map (kbd "C-s") 'ace-jump-helm-line))
;; ;; or if using key-chord-mode
;; ;; (eval-after-load "helm"
;; ;;  '(key-chord-define helm-map "jj" 'ace-jump-helm-line))
;; (setq ace-jump-helm-line-style 'pre)
;; (setq ace-jump-helm-line-background t)
;; (setq ace-jump-helm-line-default-action 'select)
;; (setq ace-jump-helm-line-select-key ?e) ;; this line is not needed
;; ;; Set the move-only and persistent keys
;; (setq ace-jump-helm-line-move-only-key ?o)
;; (setq ace-jump-helm-line-persistent-key ?p)
;; ;; enable idle execution for `helm-mini'
;; (ace-jump-helm-line-idle-exec-add 'helm-mini)
;; ;; enable hints preview
;; (ace-jump-helm-line-autoshow-mode +1)
;; ;; use `linum-mode' to show
;; (setq ace-jump-helm-line-autoshow-mode-use-linum t)
(provide 'init-ace-jump)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ace-jump.el ends here
