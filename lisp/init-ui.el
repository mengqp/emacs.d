;;; init-ui.el --- xxx -*- coding: utf-8-unix -*-

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
(progn
  (setq use-file-dialog nil)
  (setq use-dialog-box nil)
  (setq ring-bell-function 'ignore)
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-echo-area-message t)

  ;; Show a marker in the left fringe for lines not in the buffer
  (setq indicate-empty-lines t)

  ;; NO tool bar
  (if (fboundp 'tool-bar-mode)
      (tool-bar-mode -1))
  ;; no scroll bar
  (if (fboundp 'set-scroll-bar-mode)
      (set-scroll-bar-mode nil))
  ;; no menu bar
  (if (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

  ;; 关闭Tooltip
  (tooltip-mode -1)
  ;; 平滑滚动
  (setq scroll-margin 0
	scroll-conservatively 100000
	scroll-preserve-screen-position 1)
  )

;; 设置透明
;; (set-frame-parameter (selected-frame) 'alpha '(80 . 100))
;; (add-to-list 'default-frame-alist '(alpha . (80 . 100)))

;;当前行高亮
(global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")

;;指针不要闪
(blink-cursor-mode -1)

;;80列
;; (use-package fill-column-indicator
;;   :ensure t
;;   ;; :defer t
;;   :init
;;   (add-hook 'prog-mode-hook 'fci-mode)
;;   (add-hook 'prog-mode-hook (lambda () (setq truncate-lines nil)))
;;   (setq fci-rule-column 80)
;;   (setq fci-rule-width 3)
;;   (setq fci-rule-color "darkblue")
;;   )

(use-package column-enforce-mode
  :ensure t
  :defer t
  :diminish column-enforce-mode
  :init
  (add-hook 'prog-mode-hook 'column-enforce-mode)
  :config
  (setq column-enforce-column 81)
)

(when *linux*
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth))
  ;; (defun fullscreen ()
  ;;   "Fullscreen."
  ;;   ;; (interactive)
  ;;   (set-frame-parameter nil 'fullscreen
  ;; 			 (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
  ;; (fullscreen)
  )
(when *win64*
  (run-with-idle-timer 0.2 nil 'w32-send-sys-command 61488)
  )



(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
