;;; init-ui.el --- xxx -*- coding: utf-8-unix -*-

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
;; 设置基本界面
(progn
  (setq use-file-dialog nil)
  (setq use-dialog-box nil)
  (setq ring-bell-function 'ignore)
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-echo-area-message t)

  (setq inhibit-splash-screen t)
  ;; Show a marker in the left fringe for lines not in the buffer
  (setq indicate-empty-lines t)

  ;; NO tool bar
  (if (fboundp 'tool-bar-mode)
      (tool-bar-mode -1))
  ;; no scroll bar
  (if (fboundp 'set-scroll-bar-mode)
      (set-scroll-bar-mode nil))
  ;; no menu bar
  (if (fboundp 'menu-bar-mode)
      (menu-bar-mode -1))

  ;; 关闭 Tooltip
  (tooltip-mode t)
  ;; 平滑滚动
  (pixel-scroll-mode t)
  ;;当前行高亮
  (global-hl-line-mode 1)
  ;;指针不要闪
  (blink-cursor-mode -1)
  )

(set-frame-parameter nil 'alpha '(90 . 100))

(when *linux*
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth))
  )

;; (when *win64*
;;   (run-with-idle-timer 0.2 nil 'w32-send-sys-command 61488)
;;   )

(use-package awesome-tab
  ;; :defer 3
  :bind*
  (("M-t" . awesome-tab-ace-jump))
  :hook
  (after-init . awesome-tab-mode)
  :config
  ;; :disabled t
  (awesome-tab-mode t)
  (setq awesome-tab-face-height 130 )
  ;; (setq awesome-tab-display-sticky-function-name t )
)

(use-package centaur-tabs
  :ensure t
  :disabled t
  ;; :load-path "~/.emacs.d/other/centaur-tabs"
  :config
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 8)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-set-modified-marker t)
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  (defun centaur-tabs-buffer-groups ()
    "`centaur-tabs-buffer-groups' control buffers' group rules.

 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
    (list
     (cond
      ((or (string-equal "*" (substring (buffer-name) 0 1))
	   (memq major-mode '(magit-process-mode
			      magit-status-mode
			      magit-diff-mode
			      magit-log-mode
			      magit-file-mode
			      magit-blob-mode
			      magit-blame-mode
			      )))
       "Emacs")
      ((derived-mode-p 'prog-mode)
       "Editing")
      ((derived-mode-p 'dired-mode)
       "Dired")
      ((memq major-mode '(helpful-mode
			  help-mode))
       "Help")
      ((memq major-mode '(org-mode
			  org-agenda-clockreport-mode
			  org-src-mode
			  org-agenda-mode
			  org-beamer-mode
			  org-indent-mode
			  org-bullets-mode
			  org-cdlatex-mode
			  org-agenda-log-mode
			  diary-mode))
       "OrgMode")
      (t
       (centaur-tabs-get-group-name (current-buffer))))))
  :hook
  ;; (org-agenda-mode . centaur-tabs-local-mode)
  ;; (helpful-mode . centaur-tabs-local-mode)
  (prog-mode . centaur-tabs-mode)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  ("C-c t s" . centaur-tabs-counsel-switch-group)
  ("C-c t p" . centaur-tabs-group-by-projectile-project)
  ("C-c t g" . centaur-tabs-group-buffer-groups)
  (:map evil-normal-state-map
	("g t" . centaur-tabs-forward)
	("g T" . centaur-tabs-backward)))




(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
