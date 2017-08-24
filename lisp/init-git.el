;; (require 'magit)
;; (require 'evil-magit)
;; (require 'git-gutter)

(use-package magit
  :ensure t
  :defer t
  :config

  (use-package evil-magit
  :ensure t)
  )


(use-package git-gutter
  :ensure t
  :defer t
  :init
  (add-hook 'c-mode-hook 'git-gutter-mode)
  (add-hook 'c++-mode-hook 'git-gutter-mode)
  (add-hook 'org-mode-hook 'git-gutter-mode)
  :config
  (custom-set-variables
   '(git-gutter:modified-sign "  ") ;; two space
   '(git-gutter:added-sign "++")    ;; multiple character is OK
   '(git-gutter:deleted-sign "--"))

  (set-face-background 'git-gutter:modified "purple") ;; background color
  (set-face-foreground 'git-gutter:added "green")
  (set-face-foreground 'git-gutter:deleted "red")
  )


(provide 'init-git)
