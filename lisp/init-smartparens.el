;;; init-smartparens.el --- smartparens -*- coding: utf-8-unix -*-

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
(use-package smartparens
  :ensure t
  ;; :defer t
  :bind
  (:map smartparens-mode-map
   ("C-M-a" . sp-beginning-of-sexp)
   ("C-M-e" . sp-end-of-sexp)

   ("C-M-f" . sp-forward-sexp)
   ("C-M-b" . sp-backward-sexp)

   ("C-M-n" . sp-next-sexp)
   ("C-M-p" . sp-previous-sexp)

   )
  :diminish smartparens-mode smartparens-global-mode
  :init
  (add-hook 'prog-mode-hook 'smartparens-mode)
  :config
  ;; enable the default configuration
  (use-package smartparens-config)
  (smartparens-strict-mode t)


  (defhydra init-sp-menu (:color pink
				 :hint nil)
    "
^wrap^                        ^unwrap^            ^func^
^^^^^^^^-----------------------------------------------------------------
_r_: sp-rewrap-sexp          _u_: sp-unwrap-sexp   _<left>_: ()i->(i)
_)_: ()                      _'_: '                _<right>_: (i)->()
_]_: []                      _\"_:\"\"             _}_: {}
"
    ("r" sp-rewrap-sexp)
    (")" sp-wrap-round)
    ("]" sp-wrap-square)
    ("}" sp-wrap-curly)
    ("'" wrap-with-single-quotes)
    ("\"" wrap-with-double-quotes)

    ("u" sp-unwrap-sexp)
    ("[" sp-backward-unwrap-sexp)
    ("<right>" sp-forward-barf-sexp)
    ("<left>" sp-forward-slurp-sexp)

    ("q" nil "quit")
    )

  (defun init-sp-menu-func ()
    (interactive)
    (init-sp-menu)
    )

  )

(provide 'init-smartparens)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-smartparens.el ends here
