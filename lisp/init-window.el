;;; init-window.el --- windows -*- coding: utf-8-unix -*-

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

;; (use-package ace-window
;;   :ensure t
;;   :diminish ace-window-mode
;;   :config
;;   (global-set-key (kbd "M-p") 'ace-window)
;;   )

;; (use-package window-numbering
;;   :ensure t
;;   :init
;;   (setq window-numbering-assign-func
;; 	(lambda () (when (equal (buffer-name) "*Calculator*") 9)))
;;   :config
;;   (window-numbering-mode t)
;;   )

(use-package switch-window
  :ensure t
  :defer t
  :bind ("M-o". switch-window)
  :init
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "q" "w" "e" "r" ))
  (setq switch-window-increase 12) ;Increase or decrease this number.
  (setq switch-window-threshold 2)
  ;; (setq switch-window-minibuffer-shortcut ?z)
  ;; (setq switch-window-auto-resize-window
  ;; 	(lambda ()
  ;; 	  (equal (buffer-name) "*scratch*"))) ;when return t, run auto switch
  ;; (setq switch-window-default-window-size '(0.8 . 0.6)) ;80% width and 60% height of frame
  ;; (setq switch-window-input-style 'minibuffer)
  :config
  )

(use-package golden-ratio
  :ensure t
  :after switch-window
  :diminish golden-ratio-mode
  :config
  (golden-ratio-mode 1)
  )

(provide 'init-window)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-window.el ends here
