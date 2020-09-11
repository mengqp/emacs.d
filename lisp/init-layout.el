;;; init-layout.el --- layout -*- coding: utf-8-unix -*-

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
(use-package eyebrowse
  :ensure t
  :defer t
  :hook (after-init . eyebrowse-mode)
  )

(use-package workgroups2
  :ensure t
  :disabled t
  :defer t
  :hook
  (after-init . workgroups-mode)
  :init
  ;;(setq wg-session-load-on-start t)    ; default: (not (daemonp))

  ;; Change workgroups session file
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  ;; What to do on Emacs exit / workgroups-mode exit?
  ;; (setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
  ;; (setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil

  ;; Mode Line changes
  ;; Display workgroups in Mode Line?
  ;; (setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
  ;; (setq wg-flag-modified t)                 ; Display modified flags as well
  ;; (setq wg-mode-line-decor-left-brace "["
  ;; 	wg-mode-line-decor-right-brace "]"  ; how to surround it
  ;; 	wg-mode-line-decor-divider ":")

  )


(provide 'init-layout)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-layout.el ends here
