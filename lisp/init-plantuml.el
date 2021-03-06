;;; init-plantuml.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package plantuml-mode
  :commands (org-src org-src-lang-modes)
  :commands (plantuml-mode org-src-lang-modes)
  :ensure t
  ;; :bind
  ;; ("C-c C-s" . plantuml-save-png )
  :defer t
  :init
  ;; Enable plantuml-mode for PlantUML files
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (setq tab-width 2);

  :config

  (setq plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  ;; (add-to-list
  ;;  'org-src-lang-modes '("plantuml" . plantuml))

  ;; active Org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;; other Babel languages
     (plantuml . t)))

  ;; (base64-encode-string (encode-coding-string string 'utf-8-unix) t)
  (setq org-plantuml-jar-path plantuml-jar-path)
  ;; (expand-file-name "~/nutdata/linux/DotFiles/app/plantuml.jar"))

  (use-package flycheck-plantuml
    :disabled t
    :ensure t
    :config
    (flycheck-plantuml-setup))

  )





(provide 'init-plantuml)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-plantuml.el ends here
