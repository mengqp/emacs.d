;;; init-abbrev.el --- xxx -*- coding: utf-8-unix -*-

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
(use-package abbrev
  :defer t
  :diminish abbrev-mode
  ;; :config
  ;; (clear-abbrev-table global-abbrev-table)
  ;; (define-abbrev-table 'global-abbrev-table
  ;;   '(
  ;;     ;; net abbrev
  ;;     ("afaik" "as far as i know" )

  ;;     ;;
  ;;     ))

  ;; ;; define abbrev for specific major mode
  ;; ;; the first part of the name should be the value of the variable major-mode of that mode
  ;; ;; e.g. for go-mode, name should be go-mode-abbrev-table


  ;; (define-abbrev-table 'c++-mode-abbrev-table
  ;;   '(
  ;;     ("fo" "for(int i=0; i<4; i++)")
  ;;     ))

  ;; (set-default 'abbrev-mode t)

  ;; (setq save-abbrevs nil)
  )


(provide 'init-abbrev)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-abbrev.el ends here
