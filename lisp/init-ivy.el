;;; init-ivy.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package amx
  :defer t
  :ensure t
  )

(use-package counsel
  :ensure t
  ;; :defer 1
  :diminish counsel-mode
  :diminish ivy-mode
  :commands (magit-utils magit-completing-read-function)
  :commands (magit-utils magit-completing-read-function)
  :hook ((after-init . ivy-mode)
	 (ivy-mode . counsel-mode))
  ;; :bind
  ;; (
  ;;  ("M-x" . counsel-M-x)
  ;;  ("C-s" . swiper)

  ;;  :map counsel-mode-map
  ;;  ([remap swiper] . counsel-grep-or-swiper)
  ;;  )

  :init
  ;; Integration with `projectile'
  (with-eval-after-load 'projectile
    (setq projectile-completion-system 'ivy))

  ;; Integration with `magit'
  (with-eval-after-load 'magit
    (setq magit-completing-read-function 'ivy-completing-read))

  ;; (setq projectile-completion-system 'ivy)
  ;; 去除 M-x 里面的 ^
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d ")
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
	;; allow input not in order
	'((t   . ivy--regex-ignore-order)))
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  )

(provide 'init-ivy)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
