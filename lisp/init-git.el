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
  )

(use-package magit-gitflow
  :ensure t
  :defer t
  :diminish magit-gitflow-mode
  :hook
  (magit-mode . turn-on-magit-gitflow)
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
  )

(use-package vc-msg
  :ensure t
  :defer t
  )


(provide 'init-git)

;;; init-git.el ends here
