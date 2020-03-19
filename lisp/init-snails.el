;;; init-snails.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package snails
  :ensure nil
  :bind*
  (
   ("M-j s" . snails)
   ;; ("M-s s" . snails)
   ;; ("M-s p" . snails-current-project)
   ;; ("M-s b" . snails-active-recent-buffers)
   ;; ("M-s e" . snails-everywhere)

   )
  :config
  (use-package exec-path-from-shell
    :if (featurep 'cocoa) :defer t)

  (setq snails-default-backends
	'(snails-backend-awesome-tab-group snails-backend-buffer snails-backend-recentf snails-backend-directory-files snails-backend-bookmark)
	)
  (setq snails-prefix-backends
	'((">" '(snails-backend-command))
	  ("@" '(snails-backend-imenu))
	  ("#" '(snails-backend-current-buffer))
	  ("!" '(snails-backend-rg))
	  ("?" '(snails-backend-fd))
	  )
	)
  )

(provide 'init-snails)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-snails.el ends here
