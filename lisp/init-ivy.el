
(use-package smex
  :ensure t
  :config
  ;; (global-set-key (kbd "M-x") 'smex)
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :defer t
  :bind
  ("M-x" . counsel-M-x)
  ("C-s" . swiper)
  ;; (:map ivy-mode-map
  ;;       ("C-s" . swiper))

  ;; (:map ivy-mode-map
  ;;       ("M-x" . counsel-M-x))
  :init
  (setq magit-completing-read-function 'ivy-completing-read)
  (setq projectile-completion-system 'ivy)
  ;; 去除 M-x 里面的 ^
  (setq ivy-initial-inputs-alist nil)
  :config
  (ivy-mode 1)
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

  (use-package counsel-projectile
    :ensure t
    )
  ;; (use-package ivy-xref
  ;;   :ensure t
  ;;   :config
  ;;   (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
  ;;   )
  )

(when *win64*
  (use-package ivy-posframe
    :ensure t
    :after ivy-mode
    :init
    (setq ivy-display-function #'ivy-posframe-display)
    :config
    (ivy-posframe-enable)
    )
  )

(provide 'init-ivy)
