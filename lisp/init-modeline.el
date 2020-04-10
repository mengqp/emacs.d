;;; init-modeline.el --- modeline -*- coding: utf-8-unix -*-

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

(use-package moody
  :disabled t
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))


(use-package awesome-tray
  ;; :disabled t
  :defer t
  :hook
  (after-init . awesome-tray-mode)
  :init
  ;; (setq awesome-tray-mode-line-active-color "Gray60")
  ;; (setq awesome-tray-active-modules '("buffer-name" "awesome-tab" "git" "mode-name" "location"))
  )

(use-package doom-modeline
  :disabled t
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-mode)
  :init
  ;; How tall the mode-line should be (only respected in GUI Emacs).
  (setq doom-modeline-height 5)
  ;; (setq doom-modeline-height 1)
  ;; (custom-set-faces
  ;; '(mode-line ((t (:height 1.2))))
  ;; '(mode-line-inactive ((t (:height 1.2)))))
  (set-face-attribute 'mode-line nil :height 20)
  (set-face-attribute 'mode-line-inactive nil :height 20)

  ;; How wide the mode-line bar should be (only respected in GUI Emacs).
  (setq doom-modeline-bar-width 1)
  ;; Determines the style used by `doom-modeline-buffer-file-name'.
  ;;
  ;; Given ~/Projects/FOSS/emacs/lisp/comint.el
  ;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
  ;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
  ;;   truncate-with-project => emacs/l/comint.el
  ;;   truncate-except-project => ~/P/F/emacs/l/comint.el
  ;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
  ;;   truncate-all => ~/P/F/e/l/comint.el
  ;;   relative-from-project => emacs/lisp/comint.el
  ;;   relative-to-project => lisp/comint.el
  ;;   file-name => comint.el
  ;;   buffer-name => comint.el<2> (uniquify buffer name)
  ;;
  ;; If you are expereicing the laggy issue, especially while editing remote files
  ;; with tramp, please try `file-name' style.
  ;; Please refer to https://github.com/bbatsov/projectile/issues/657.
  (setq doom-modeline-buffer-file-name-style 'relative-to-project)

  ;; What executable of Python will be used (if nil nothing will be showed).
  (setq doom-modeline-python-executable "python")

  ;; Whether show `all-the-icons' or not (if nil nothing will be showed).
  ;; The icons may not be showed correctly on Windows. Disable to make it work.
  (setq doom-modeline-icon t)

  ;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; Whether display minor modes or not. Non-nil to display in mode-line.
  (setq doom-modeline-minor-modes nil)

  ;; Whether display perspective name or not. Non-nil to display in mode-line.
  (setq doom-modeline-persp-name nil)

  ;; Whether display `lsp' state or not. Non-nil to display in mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display github notifications or not. Requires `ghub` package.
  (setq doom-modeline-github nil)

  ;; The interval of checking github.
  (setq doom-modeline-github-interval (* 30 60))

  )

(use-package mini-modeline
  :disabled t
  :ensure t
  :config
  (mini-modeline-mode t)
  )
(provide 'init-modeline)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-modeline.el ends here
