
(use-package ivy :ensure t
  :diminish (ivy-mode . "")
  :bind
  ("M-x" . counsel-M-x)
  ;; (:map ivy-mode-map
  ;;       ("C-'" . ivy-avy))

  ;; (:map ivy-mode-map
  ;;       ("M-x" . counsel-M-x))
  :config
  (ivy-mode 1)
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
        '((t   . ivy--regex-ignore-order))))


(provide 'init-ivy)
