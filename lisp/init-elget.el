;;; init-elget.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package el-get
  :ensure t
  :defer t
  :config
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
  (el-get-bundle auto-save
    :url "https://www.emacswiki.org/emacs/download/auto-save.el"
    )

  (el-get-bundle company-english-helper
    :url "https://github.com/manateelazycat/company-english-helper.git"
    )

  (el-get-bundle aweshell
    :url "https://github.com/manateelazycat/aweshell.git"
    )

  (el-get-bundle insert-translated-name
    :url "https://github.com/manateelazycat/insert-translated-name.git"
    )
  (el-get-bundle awesome-tray
    :url "https://github.com/manateelazycat/awesome-tray.git"
    )


  ;; (el-get-bundle color-rg
  ;;   :url"https://github.com/manateelazycat/color-rg.git"
  ;;   )
  ;; (use-package color-rg
  ;;   :defer t
  ;;   )


  ;; Simple package names
  ;; (el-get-bundle yasnippet)
  ;; (el-get-bundle color-moccur)

  ;; Locally defined recipe
  ;; (el-get-bundle yaicomplete
  ;; 		 :url "https://github.com/tarao/elisp.git"
  ;; 		 :features yaicomplete)

  ;; With initialization code
  ;; (el-get-bundle zenburn-theme
  ;; 		 :url "https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el"
  ;; 		 (load-theme 'zenburn t))

  )


(provide 'init-elget)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-elget.el ends here
