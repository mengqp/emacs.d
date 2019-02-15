;;; init-git.el --- git function  -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Copyright (C) 2017-2018 by mengqp

;; (require 'magit)
;; (require 'evil-magit)
;; (require 'git-gutter)

;;; Code:
(use-package magit-popup
  :ensure t
  )

(use-package magit
  :ensure t

  ;; :bind (("C-x g" . magit-status)
  ;;        ("C-x M-g" . magit-dispatch-popup)
  ;; 	 ("C-c M-g" . magit-file-popup))
  :config
  ;; (use-package evil-magit
  ;;   :ensure t)

  ;; (use-package orgit
  ;;   :ensure t
  ;;   :config
  ;;   (general-define-key :states '(insert normal motion)
  ;; 			:keymaps '(magit-mode-map magit-log-mode-map magit-revision-mode-map)
  ;; 			:prefix ";"
  ;; 			"s" 'org-store-link
  ;; 			"i" 'org-insert-link

  ;; 			)

  ;;   )
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

  ;; Walk through git revisions of a file
  (use-package git-timemachine
    :ensure t
    :diminish git-timemachine-mode)

  (when *linux*
    (use-package magit-todos
      :ensure t)
    )

  ;; (defun git-push-coding-request()
  ;;   "push current branch to coding develop branch request"
  ;;   (interactive)
  ;;   ;; "git push origin banana:mr/master/banana."
  ;;   (run-hooks 'magit-credential-hook)
  ;;   ;; (magit-run-git-async
  ;;   ;; (magit-start-git nil
  ;;   (shell-command-to-string
  ;;    (format "git push origin %s:mr/develop/%s"
  ;; 	     (magit-get-current-branch) (magit-get-current-branch))  )
  ;;   ;; (print (magit-get-current-branch))
  ;;   )

  ;; (defun git-pull-coding-request( source args )
  ;; "push current branch to coding develop branch request"
  ;; "git push origin banana:mr/master/banana"
  ;; (interactive
  ;;  (list (magit-read-remote-branch "Pull" nil nil nil t)
  ;;                    (magit-pull-arguments)))
  ;; (run-hooks 'magit-credential-hook)
  ;; ;; (magit-run-git-async
  ;; ;; (magit-start-git nil
  ;; (shell-command-to-string "git checkout develop")
  ;; (shell-command-to-string "git pull")
  ;; ;; (shell-command-to-string (format "git pull origin %s" arg))
  ;; (magit-git-pull source args)
  ;; ;; (magit-branch-delete (format":mr/develop/%d" 116))
  ;; (magit-branch-delete)
  ;; ;; (shell-command-to-string "git push")
  ;;   ;; (print (magit-get-current-branch))
  ;; )


  ;; (git-push-coding-request)

  )


;; Git-Svn extension for Magit
(use-package magit-svn
  :ensure t
  :diminish magit-svn-mode
  :hook (magit-mode . magit-svn-mode))

(use-package git-gutter
  :ensure t
  :defer t
  :diminish git-gutter-mode
  :init
  (add-hook 'c-mode-hook 'git-gutter-mode)
  (add-hook 'c++-mode-hook 'git-gutter-mode)
  (add-hook 'org-mode-hook 'git-gutter-mode)
  (add-hook 'lisp-mode-hook 'git-gutter-mode)
  :config
  (custom-set-variables
   '(git-gutter:modified-sign "==") ;; two space
   '(git-gutter:added-sign "++")    ;; multiple character is OK
   '(git-gutter:deleted-sign "--"))

  (set-face-background 'git-gutter:modified "yellow") ;; background color
  (set-face-foreground 'git-gutter:added "green")
  (set-face-foreground 'git-gutter:deleted "red")
  )


(provide 'init-git)

;;; init-git.el ends here
