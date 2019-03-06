;;; init-cnfonts.el --- xxx -*- coding: utf-8-unix -*-

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

;; (use-package cnfonts
;;   :ensure t
;;   ;; :defer t
;;   :config
;;   (defconst cnfonts-personal-fontnames
;;     '(()
;;       ("思源黑体" "思源黑体 CN")
;;       ()
;;       ))
;;   ;; 让 cnfonts 随着 Emacs 自动生效。
;;   (cnfonts-enable)
;;   )

;; Auto generated by cnfonts
;; <https://github.com/tumashu/cnfonts>
(when *linux*
  (set-face-attribute
   'default nil
   :font (font-spec :name "-ADBO-Source Code Pro-ultrabold-italic-normal-*-*-*-*-*-m-0-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 12.5))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-ADBO-Source Han Sans CN Heavy-ultrabold-normal-normal-*-*-*-*-*-*-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 14.5)))
  )


(when *win64*
  (set-face-attribute
   'default nil
   :font (font-spec :name "-outline-Consolas-bold-normal-normal-mono-*-*-*-*-c-*-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 12.5))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-outline-微软雅黑-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 15.0)))

  )
(provide 'init-cnfonts)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cnfonts.el ends here
