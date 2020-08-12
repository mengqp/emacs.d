;;; init-im.el --- xxx -*- coding: utf-8-unix -*-

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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-im.el ends here

;;; init-im.el --- Config by mengqp -*- coding: utf-8-unix -*-

;;; Commentary:

;;; Code:
(use-package pyim
  :ensure t
  :disabled t
  :commands (pyim pyim-restart-1)
  :bind*
  (
   ("M-i i" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
   ("M-i M-i" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
   ;; ("C-;" . pyim-delete-word-from-personal-buffer))
   ;; ("C-;" . pyim-convert-code-at-point )
   )

  :defer t
  :init
  (setq pyim-title "pyim")
  :config
  (setq pyim-dcache-prefer-emacs-thread t)
  ;; (setq pyim-debug t)

  (when *win64*
    ;; 五笔用户使用 wbdict 词库
    (use-package pyim-wbdict
      ;; :disabled t
      :ensure t
      :config
      ;; (pyim-wbdict-gbk-enable)
      (pyim-wbdict-v98-enable)
      )
    (setq default-input-method "pyim")
    (setq pyim-default-scheme 'wubi)
    )

  (when *linux*
    (use-package liberime
      :load-path "/home/mengqp/.emacs.d/site-lisp/liberime/build/liberime.so"
      :config
      (liberime-start (expand-file-name "/usr/share/rime-data")
		      ;; (expand-file-name "~/.config/fcitx/rime")
		      (expand-file-name "~/.emacs.d/rime")
		      )
      ;; (liberime-start "/usr/share/rime-data" "/root/.emacs.d/rime/") ;
      (liberime-select-schema "wubi86")

      )

    (setq default-input-method "pyim")
    (setq pyim-default-scheme 'rime)
    )

  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
		'(pyim-probe-dynamic-english
		  ;; pyim-probe-isearch-mode
		  pyim-probe-program-mode
		  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
		'(pyim-probe-punctuation-line-beginning
		  pyim-probe-punctuation-after-punctuation))

  ;; 开启拼音搜索功能
  ;; (pyim-isearch-mode 1)

  ;; 使用 pupup-el 来绘制选词框
  ;; (setq pyim-page-tooltip 'pos-tip)
  ;; (setq x-gtk-use-system-tooltips t)
  ;; (setq pyim-page-tooltip 'child-frame)
  (setq pyim-page-tooltip 'posframe)

  ;; 选词框显示 5 个候选词
  (setq pyim-page-length 5)
  (global-set-key (kbd "C-\\") 'toggle-input-method)
  )

(use-package rime
  :ensure t
  ;; :disabled t
  :commands (init-im rime-toggle-or-inline-ascii)
  :bind*
  (
   ("M-i i" . rime-toggle-or-inline-ascii) ; 开启输入法
   ("M-i M-i" . rime-toggle-or-inline-ascii) ; 开启输入法
   )
  :diminish rime-mode
  :hook(after-init . rime-mode)
  :init
  (setq rime-disable-predicates
	'(rime-predicate-evil-mode-p
          ;; rime-predicate-after-alphabet-char-p
          ;; rime-predicate-prog-in-code-p
	  )
	)
  ;;  (setq rime-inline-predicates '(rime-predicate-space-after-cc-p
  ;;  	rime-predicate-current-uppercase-letter-p ) )
  ;; support shift-l, shift-r, control-l, control-r
  ;; (setq rime-inline-ascii-trigger 'shift-l)
  ;; (setq rime-inline-predicates '(rime-predicate-space-after-cc-p))
  (setq rime-user-data-dir "~/.emacs.d/rime/")

  (setq rime-posframe-properties
	(list :background-color "#333333"
	      :foreground-color "#dcdccc"
	      ;; :font "WenQuanYi Micro Hei Mono-14"
	      :internal-border-width 10))
  (setq default-input-method "rime"
	rime-show-candidate 'posframe)
  ;; (setq rime-title "")
  :config
  (defun rime-toggle-or-inline-ascii()
    "Open init package file to config."
    (interactive)
    (if (and (equal current-input-method "rime")
	     (bound-and-true-p rime-mode))
	(rime-inline-ascii)
      (toggle-input-method)
      )
    )
  )

(use-package sis
  :ensure t
  :disabled t
  :bind*
  (
   ("M-i i" . sis-switch) ; 开启输入法
   ("M-i M-i" . sis-switch) ; 开启输入法
   )
  :config
  ;; (sis-ism-lazyman-config nil nil 'fcitx5)
  ;; (sis-ism-lazyman-config nil nil 'fcitx)
  (use-package rime
    :ensure t
    :init
    (setq rime-user-data-dir "~/.emacs.d/rime/")

    (setq rime-posframe-properties
	  (list :background-color "#333333"
		:foreground-color "#dcdccc"
		;; :font "WenQuanYi Micro Hei Mono-14"
		:internal-border-width 10))
    (setq default-input-method "rime"
	  rime-show-candidate 'posframe)
    (setq default-input-method "rime"
	  rime-show-candidate 'posframe)
    )

  (sis-ism-lazyman-config nil "rime" 'native)
  ;; (setq-default sis-english nil)
  ;; (setq-default sis-other "rime")
  ;; (setq-default sis-do-get (lambda() current-input-method))
  ;; (setq-default sis-do-set (lambda(source) (set-input-method source)))

  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /follow context/ mode for all buffers
  (sis-global-follow-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )

(provide 'init-im)

;;; init-im.el ends here
