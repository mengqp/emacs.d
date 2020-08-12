;;; init-autoload.el --- xxx -*- coding: utf-8-unix -*-

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
(autoload 'org-capture "org-capture" "" t)
(autoload 'org-agenda "org-agenda" "" t)
(autoload 'org-journal-new-entry "org-journal" "" t)
(autoload 'org-promote "org" "" t)
(autoload 'cfw:open-org-calendar "calfw" "" t)
(autoload 'org-mobile-push "org-mobile" "" t)
(autoload 'org-mobile-pull "org-mobile" "" t)
(autoload 'find-function "find-func" "" t)
(autoload 'find-variable "find-func" "" t)
(autoload 'counsel-M-x "counsel" "" t)
(autoload 'swiper "counsel" "" t)
(autoload 'awesome-fast-switch/body "init-ui" "" t)
(autoload 'imenu "imenu" "" t)
(autoload 'goto-last-change "goto-chg" "" t)
(autoload 'mc/mark-next-like-this "mc-mark-more" "" t)
(autoload 'mc/mark-previous-like-this "mc-mark-more" "" t)
(autoload 'mc/mark-all-like-this "mc-mark-more" "" t)
(autoload 'er/expand-region "expand-region" "" t)
(autoload 'format-all-buffer "format-all" "" t)
(autoload 'lazy-search "lazy-search" "" t)
(autoload 'symbol-overlay-put "symbol-overlay" "" t)
(autoload 'symbol-overlay-remove-all "symbol-overlay" "" t)
(autoload 'undo-fu-only-undo "undo-fu" "" t)
(autoload 'undo-fu-only-redo "undo-fu" "" t)
(autoload 'separedit "separedit" "" t)
(autoload 'color-rg-search-project-with-type "color-rg" "" t)
(autoload 'color-rg-search-symbol-with-type "color-rg" "" t)
(autoload 'color-rg-search-project "color-rg" "" t)
(autoload 'color-rg-search-input "color-rg" "" t)
(autoload 'color-rg-search-symbol "color-rg" "" t)
(autoload 'xref-find-definitions "xref" "" t)
(autoload 'pyim-convert-string-at-point "pyim" "" t)
(autoload 'sis-switch "sis" "" t)
(autoload 'company-complete "company" "" t)
(autoload 'switch-window "switch-window" "" t)
(autoload 'switch-window-then-maximize "switch-window" "" t)
(autoload 'switch-window-then-split-below "switch-window" "" t)
(autoload 'switch-window-then-split-right "switch-window" "" t)
(autoload 'switch-window-then-delete "switch-window" "" t)
(autoload 'ivy-yasnippet "ivy-yasnippet" "" t)
(autoload 'ivy-yasnippet "ivy-yasnippet" "" t)
(autoload 'avy-goto-char "avy" "" t)
(autoload 'avy-goto-char-2 "avy" "" t)
(autoload 'avy-goto-word-1 "avy" "" t)
(autoload 'avy-goto-word-0 "avy" "" t)
(autoload 'avy-goto-line "avy" "" t)
(autoload 'avy-zap-to-char-dwim "avy-zap" "" t)
(autoload 'avy-zap-up-to-char-dwim "avy-zap" "" t)
(autoload 'magit-status "magit-status" "" t)
(autoload 'magit-dispatch-popup "magit" "" t)
(autoload 'magit-file-dispatch "magit" "" t)
(autoload 'snails "snails" "" t)




(provide 'init-autoload)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-autoload.el ends here
