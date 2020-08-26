;;; initl.el --- linux -*- coding: utf-8-unix -*-

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

  ;;ui
  (require 'init-base)
  (require 'init-ui)
  (require 'init-edit)
  (require 'init-coding)
  (require 'init-evil)
  (require 'init-modeline)
  (require 'init-theme)
  (require 'init-cnfonts)
  (require 'init-layout)
  ;; (require 'init-dumb-jump)
  ;; (require 'init-hydra)

  ;; (when *linux*
  ;; (require 'init-abbrev)
  ;; (require 'init-spell)
  ;;(require 'init-dap)
  ;; )
  (require 'init-im)

  ;;tool
  (require 'init-calendar)
  (require 'init-company)
  (require 'init-window)
  (require 'init-projectile)
  (require 'init-yasnippet)
  (require 'init-flycheck)
  (require 'init-ace-jump)
  (require 'init-git)
  (require 'init-cmake)
  (require 'init-ivy)
  (require 'init-snails)
  (require 'init-browser)
  (require 'init-func)
  (require 'init-keymap)

  (when *linux*
    (require 'init-lsp)
    (require 'init-shell)

    (require 'init-plantuml)
    ;; (require 'init-ycmd)
    (require 'init-gdb)
    ;; (require 'init-leecode)

    )
  (when *win64*
    (require 'init-counsel-etags)
    )
  ;; (require 'init-cscope)

  ;;
  ;; (require 'init-realgud)
  (require 'init-cc)
  (require 'init-org)
  (require 'init-python)
  (require 'init-css)
  (require 'init-markdown)
  (require 'init-web)
  (require 'init-php)
  (when *win64*
    (require 'init-ahk)
    )


(provide 'initl)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; initl.el ends here
