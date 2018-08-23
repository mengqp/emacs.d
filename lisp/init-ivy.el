;;; init-ivy.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package smex
  :ensure t
  :config
  ;; (global-set-key (kbd "M-x") 'smex)
  )

(use-package counsel
  :ensure t
  :defer t)

(use-package swiper
  :ensure t
  :defer t)


(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :commands (magit-utils magit-completing-read-function)
  :defer t
  :bind
  ("M-x" . counsel-M-x)
  ("C-s" . swiper)
  ;; (:map ivy-mode-map
  ;;       ("C-s" . swiper))

  ;; (:map ivy-mode-map
  ;;       ("M-x" . counsel-M-x))
  :init
  (defvar magit-completing-read-function 'ivy-completing-read)
  (setq projectile-completion-system 'ivy)
  ;; 去除 M-x 里面的 ^
  (setq ivy-initial-inputs-alist nil)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d ")
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
	;; allow input not in order
	'((t   . ivy--regex-ignore-order)))

  ;; (use-package ivy-xref
  ;;   :ensure t
  ;;   :config
  ;;   (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
  ;;   )
  )

;; (use-package ivy-posframe
;;   :ensure t
;;   :after ivy
;;   :init
;;   (setq ivy-display-function #'ivy-posframe-display)
;;   :config
;;   ;; (setq ivy-display-function #'ivy-posframe-display-at-frame-center)
;;   (setq ivy-display-function #'ivy-posframe-display-at-window-center)
;;   ;; (setq ivy-display-function #'ivy-posframe-display-at-frame-bottom-left)
;;   ;; (setq ivy-display-function #'ivy-posframe-display-at-window-bottom-left)
;;   ;; (setq ivy-display-function #'ivy-posframe-display-at-point)
;;   (ivy-posframe-enable)
;;   )

(provide 'init-ivy)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
