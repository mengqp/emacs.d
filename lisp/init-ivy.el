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
 ;; :config
  ;; (global-set-key (kbd "M-x") 'smex)
  )

(use-package counsel
  :ensure t
  :commands (magit-utils magit-completing-read-function)
  :commands (magit-utils magit-completing-read-function)
  :hook ((after-init . ivy-mode)
	 (ivy-mode . counsel-mode))
  :bind
  (
   ("M-x" . counsel-M-x)
   ("C-s" . swiper)

   :map counsel-mode-map
   ([remap swiper] . counsel-grep-or-swiper)
   ("C-x C-r" . counsel-recentf)
   ("C-x j" . counsel-mark-ring)

   ("C-c r" . counsel-rg)

   ("C-c c L" . counsel-load-library)
   ("C-c c P" . counsel-package)
   ("C-c c a" . counsel-apropos)
   ("C-c c e" . counsel-colors-emacs)
   ("C-c c f" . counsel-find-library)
   ("C-c c g" . counsel-grep)
   ("C-c c h" . counsel-command-history)
   ("C-c c i" . counsel-git)
   ("C-c c j" . counsel-git-grep)
   ("C-c c l" . counsel-locate)
   ("C-c c m" . counsel-minibuffer-history)
   ("C-c c o" . counsel-outline)
   ("C-c c p" . counsel-pt)
   ("C-c c r" . counsel-rg)
   ("C-c c s" . counsel-ag)
   ("C-c c t" . counsel-load-theme)
   ("C-c c u" . counsel-unicode-char)
   ("C-c c w" . counsel-colors-web)
   ("C-c c z" . counsel-fzf)
   )
  :init
  ;; Integration with `projectile'
  (with-eval-after-load 'projectile
    (setq projectile-completion-system 'ivy))

  ;; Integration with `magit'
  (with-eval-after-load 'magit
    (setq magit-completing-read-function 'ivy-completing-read))

  ;; (setq projectile-completion-system 'ivy)
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

  )

;; (use-package swiper
;;   :ensure t
;;   ;; :defer t
;;   )


;; (use-package ivy
;;   :ensure t
;;   :diminish (ivy-mode . "")

;;   ;; :defer t
;;   :bind
;;   (


;;      )
;;   ;; (:map ivy-mode-map
;;   ;;       ("C-s" . swiper))

;;   ;; (:map ivy-mode-map
;;   ;;       ("M-x" . counsel-M-x))
;;   :init

;;   )

(use-package ivy-posframe
  :disabled t
  :ensure t
  :after ivy
  :init
  (setq ivy-display-function #'ivy-posframe-display)
  :config
  ;; (setq ivy-display-function #'ivy-posframe-display-at-frame-center)
  (setq ivy-display-function #'ivy-posframe-display-at-window-center)
  ;; (setq ivy-display-function #'ivy-posframe-display-at-frame-bottom-left)
  ;; (setq ivy-display-function #'ivy-posframe-display-at-window-bottom-left)
  ;; (setq ivy-display-function #'ivy-posframe-display-at-point)
  (ivy-posframe-enable)
  )

(use-package ivy-xref
  :ensure t
  :after ivy
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)

  )

(provide 'init-ivy)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
