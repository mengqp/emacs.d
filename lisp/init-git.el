;; (require 'magit)
;; (require 'evil-magit)
;; (require 'git-gutter)

(use-package magit
  :ensure t
  :defer t
  :config

  (use-package evil-magit
    :ensure t)

   ;; Gitflow externsion for Magit
  (use-package magit-gitflow
    :diminish magit-gitflow-mode
    :bind (:map magit-status-mode-map
                ("G" . magit-gitflow-popup))
    :init (add-hook 'magit-mode-hook #'turn-on-magit-gitflow)
    :config
    (magit-define-popup-action 'magit-dispatch-popup
?G "GitFlow" #'magit-gitflow-popup ?!))

  (defun git-push-coding-request()
    "push current branch to coding develop branch request"
    "git push origin banana:mr/master/banana"
    (interactive)
    (run-hooks 'magit-credential-hook)
    ;; (magit-run-git-async
    ;; (magit-start-git nil
    (shell-command-to-string
     (format "git push origin %s:mr/develop/%s"
	     (magit-get-current-branch) (magit-get-current-branch))  )
    ;; (print (magit-get-current-branch))
    )

  (defun git-pull-coding-request( source args )
  "push current branch to coding develop branch request"
  "git push origin banana:mr/master/banana"
  (interactive
   (list (magit-read-remote-branch "Pull" nil nil nil t)
                     (magit-pull-arguments)))
  (run-hooks 'magit-credential-hook)
  ;; (magit-run-git-async
  ;; (magit-start-git nil
  (shell-command-to-string "git checkout develop")
  (shell-command-to-string "git pull")
  ;; (shell-command-to-string (format "git pull origin %s" arg))
  (magit-git-pull source args)
  ;; (magit-branch-delete (format":mr/develop/%d" 116))
  (magit-branch-delete)
  ;; (shell-command-to-string "git push")
    ;; (print (magit-get-current-branch))
  )


  ;; (git-push-coding-request)

  )



(use-package git-gutter
  :ensure t
  :defer t
  :diminish git-gutter-mode
  :init
  (add-hook 'c-mode-hook 'git-gutter-mode)
  (add-hook 'c++-mode-hook 'git-gutter-mode)
  (add-hook 'org-mode-hook 'git-gutter-mode)
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
