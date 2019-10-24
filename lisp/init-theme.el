;;; init-theme.el --- init-theme -*- coding: utf-8-unix -*-

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
;; (require 'color-theme)

;; (use-package color-theme
;;   :init
;;   ;; (require 'color-theme-solarized)
;;   ;; (load-theme 'solarized t)
;;   ;; (set-frame-parameter nil 'background-mode 'dark)    ;;选择 solarized dark
;;   ;; (enable-theme 'solarized)
;;   (require 'spacemacs-theme)
;;   (load-theme 'spacemacs-dark t)
;;     )
;; (require 'spacemacs-theme)
;; (load-theme 'spacemacs-dark t)

(use-package solarized-theme
  :ensure t
  :disabled t
  :defer t
  :init
  (add-hook 'after-init-hook
	    (lambda () (load-theme 'solarized-dark t)))
  )

(use-package tao-theme
  :ensure t
  :disabled t
  :defer t
  :init
  (add-hook 'after-init-hook
	    (lambda ()
	      (load-theme 'tao-yin t)
	      ;; (load-theme 'tao-yang t)
	      ))
  )

(use-package color-identifiers-mode
  :ensure t
  :disabled t
  :defer t
  :init
  (add-hook 'after-init-hook 'global-color-identifiers-mode)
  )

(use-package focus
  :ensure t
  :disabled t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'focus-mode)
  )

;; (use-package lazycat-theme
;;   ;; :ensure t
;;   ;; :disabled t
;;   ;; :defer t
;;   ;; init
;;   ;;(add-hook 'after-init-hook
;; ;;	    (lambda () (load-theme 'lazycat t)))
;;   )

(use-package srcery-theme
  :ensure t
  :disabled t
  :defer t
  :hook
  (after-init .
	      (lambda () (load-theme 'srcery t))
	      )
  )

(use-package cyberpunk-theme
  :ensure t
  ;; :disabled t
  :defer t
  :init
  (add-hook 'after-init-hook
	    (lambda () (load-theme 'cyberpunk t)))
  )

(use-package zenburn-theme
  :ensure t
  :disabled t
  :config
  (load-theme 'zenburn t)
  )

;; ;; (load-theme 'wombat t)
(use-package doom-themes
  :ensure t
  :config
  :disabled t
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
  ;; may have their own settings.
  ;; (load-theme 'doom-one t)
  (load-theme 'doom-dracula t)
  ;; (load-theme 'doom-nova t)

  ;; Enable flashing mode-line on errors
  ;; (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  ;; (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

  ;; Corrects (and improves) org-mode's native fontification.
  ;; (doom-themes-org-config)

  )


(provide 'init-theme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-theme.el ends here
