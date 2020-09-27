;;; init-git.el --- git function  -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package magit-popup
  :ensure t
  :defer t
  )

(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)
	 ("C-c g" . magit-file-dispatch ))
  :config
  ;; Gitflow externsion for Magit
  (use-package magit-gitflow
    :ensure t
    :diminish magit-gitflow-mode
    :commands (magit-popup magit-define-popup-action)
    :bind (:map magit-status-mode-map
		("G" . magit-gitflow-popup))
    :init (add-hook 'magit-mode-hook #'turn-on-magit-gitflow)
    :config
    (magit-define-popup-action 'magit-dispatch-popup
      ?G "GitFlow" #'magit-gitflow-popup ?!))

  )


;; Walk through git revisions of a file
(use-package git-timemachine
  :ensure t
  :defer t
  :diminish git-timemachine-mode)

;; Git-Svn extension for Magit
(use-package magit-svn
  :ensure t
  :defer t
  :diminish magit-svn-mode
  :hook (magit-mode . magit-svn-mode))

(use-package git-gutter
  :ensure t
  :defer t
  :diminish git-gutter-mode
  :hook (prog-mode . git-gutter-mode)
  :config
  (custom-set-variables
   '(git-gutter:modified-sign "==") ;; two space
   '(git-gutter:added-sign "++")    ;; multiple character is OK
   '(git-gutter:deleted-sign "--"))

  (set-face-background 'git-gutter:modified "yellow") ;; background color
  (set-face-foreground 'git-gutter:added "green")
  (set-face-foreground 'git-gutter:deleted "red")
  )

(use-package vc-msg
  :ensure t
  :defer t
  )


(provide 'init-git)

;;; init-git.el ends here
