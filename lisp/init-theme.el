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
(use-package lazycat-theme
  ;; :ensure t
  :disabled t
  :defer t
  ;; :init
  ;; (add-hook 'after-init-hook
  ;; 	    (lambda () (lazycat-theme-load-dark)))
  :config
  (lazycat-theme-load-dark)
  ;; (lazycat-theme-load-with-sunrise)
  )

(use-package cyberpunk-theme
  :ensure t
  :disabled t
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

(use-package modus-operandi-theme
  :disabled t
  :defer t
  :ensure t)


(use-package modus-vivendi-theme
  :ensure t
  ;; :disabled t
  :defer t
  :hook (after-init . (lambda ()
			(load-theme 'modus-vivendi t)))
  :init
  ;; Choose to render some code constructs in slanted text (italics).  The
  ;; default, shown below, is to not use italics, unless it is absolutely
  ;; necessary.
  (setq modus-operandi-theme-slanted-constructs nil)

  (setq modus-vivendi-theme-slanted-constructs nil)

  ;; Use proportionately-spaced fonts (variable-pitch) for headings.  The
  ;; default is to use whatever font the user has selected, typically a
  ;; monospaced typeface.
  (setq modus-operandi-theme-proportional-fonts nil)

  (setq modus-vivendi-theme-proportional-fonts nil)

  ;; Whether headings should be scaled or have the same height as body
  ;; text.  The default is to keep everything the same as the base size.
  (setq modus-operandi-theme-scale-headings nil)

  (setq modus-vivendi-theme-scale-headings nil)

  ;; Font scale that should apply to headings.  These are the default values.
  (setq modus-operandi-theme-scale-1 1.05)
  (setq modus-operandi-theme-scale-2 1.1)
  (setq modus-operandi-theme-scale-3 1.15)
  (setq modus-operandi-theme-scale-4 1.2)

  (setq modus-vivendi-theme-scale-1 1.05)
  (setq modus-vivendi-theme-scale-2 1.1)
  (setq modus-vivendi-theme-scale-3 1.15)
  (setq modus-vivendi-theme-scale-4 1.2)
  )

(provide 'init-theme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-theme.el ends here
