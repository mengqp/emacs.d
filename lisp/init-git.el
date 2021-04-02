;;; init-git.el --- git function  -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package magit-popup)

(use-package magit
  ;; :bind (
  ;; 	 ("C-x g" . magit-status)
  ;; 	 ("C-x M-g" . magit-dispatch-popup)
  ;; 	 ("C-c g" . magit-file-dispatch ))
  )

(use-package magit-gitflow
  :diminish magit-gitflow-mode
  :hook
  (magit-mode . turn-on-magit-gitflow)
  )


;; Walk through git revisions of a file
(use-package git-timemachine
  :diminish git-timemachine-mode)

;; Git-Svn extension for Magit
(use-package magit-svn
  :diminish magit-svn-mode
  :hook (magit-mode . magit-svn-mode))

(use-package git-gutter
  :diminish git-gutter-mode
  :hook (prog-mode . git-gutter-mode)
  )

(use-package vc-msg)


(provide 'init-git)

;;; init-git.el ends here
