;;; init-package.el --- package -*- coding: utf-8-unix -*-

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
(require 'package)

(package-initialize)
;; (setq package-check-signature nil)
;; Set it to `t' to use safer HTTPS to download packages
(defvar melpa-use-https-repo nil
  "By default, HTTP is used to download packages.
But you may use safer HTTPS instead.")


(setq package-archives '(
                         ;; ("melpa-cn-stable" . "http://elpa.emacs-china.org/melpa-stable/")
                         ;; ("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
			 ;; ("org-cn"   . "https://elpa.zilongshanren.com/org/")
			 ;; ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")
                         ;; ("melpa-stable-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
			 ("melpa-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("gnu-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("org-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ;; ("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
                         ;; ("org-cn"   . "http://elpa.emacs-china.org/org/")
                         ;; ("gnu-cn" . "http://elpa.emacs-china.org/gnu/")
                         ;; ("melpa" . "https://melpa.org/packages/")
			 ;; ("gnu" . "https://elpa.gnu.org/packages/")
			 ;; ("popkit" . "http://elpa.popkit.org/packages/")
                         ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ))
;; (package-initialize)


;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;;------------------------------------------------------------------------------
;; Fire up package.el and ensure the following packages are installed.
;;------------------------------------------------------------------------------
;; (package-initialize)

(require-package 'use-package)
;; (use-package general
;;   :ensure t)
(use-package diminish
  :ensure t)

;; (use-package use-package-chords
;;   :ensure t
;;   :config (key-chord-mode 1))
(use-package dash-functional
  :ensure t
  :defer t
  )
(use-package ht
  :ensure t
  :defer t
  )
(use-package spinner
  :ensure t
  :defer t
  )


(provide 'init-package)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-package.el ends here
