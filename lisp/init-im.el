;;; init-im.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package rime
  :commands (init-im rime-toggle-or-inline-ascii)
  :diminish rime-mode
  :hook(after-init . rime-mode)
  :init
  (setq rime-disable-predicates
	'(rime-predicate-evil-mode-p
          ;; rime-predicate-after-alphabet-char-p
          rime-predicate-prog-in-code-p
	  )
	)
  ;;  (setq rime-inline-predicates '(rime-predicate-space-after-cc-p
  ;;  	rime-predicate-current-uppercase-letter-p ) )
  ;; support shift-l, shift-r, control-l, control-r
  (setq rime-inline-ascii-trigger 'shift-l)
  ;; (setq rime-inline-predicates '(rime-predicate-space-after-cc-p
  ;; 				 rime-predicate-current-uppercase-letter-p))
  (setq rime-inline-predicates '(rime-predicate-current-uppercase-letter-p))
  ;; (setq rime-user-data-dir "~/.emacs.d/rime/")
  (setq rime-user-data-dir "~/.local/share/fcitx5/rime/")

  (setq rime-posframe-properties
	(list :background-color "#333333"
	      :foreground-color "#dcdccc"
	      :internal-border-width 10))
  (setq default-input-method "rime"
	rime-show-candidate 'posframe)
  ;; (setq rime-title "")
  (defun rime-toggle-or-inline-ascii()
    "Open init package file to config."
    (interactive)
    (if (and (equal current-input-method "rime")
	     (bound-and-true-p rime-mode))
	(progn
	  (rime-inline-ascii)
	  )

      (progn
	(toggle-input-method)
	(rime-inline-ascii)
	)
      )
    )
  )

(provide 'init-im)
;;; init-im.el ends here
