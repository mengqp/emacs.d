;; (print (magit-get-current-branch))
;; (current-time)


;; (defun git-push-coding-request()
;;   "push current branch to coding develop branch request"
;;   "git push origin banana:mr/master/banana"
;;   (interactive)
;;   (run-hooks 'magit-credential-hook)
;;   ;; (magit-run-git-async
;;   ;; (magit-start-git nil
;;   (shell-command-to-string
;;    (format "git push origin %s:mr/develop/%s"
;; 	   (magit-get-current-branch) (magit-get-current-branch))  )
;;     ;; (print (magit-get-current-branch))
;;   )
;; (git-push-coding-request)

(defun git-pull-coding-request( source args )
  "pull a request"
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
  (shell-command-to-string "git push")
    ;; (print (magit-get-current-branch))
  )

;; (git-pull-coding-request )
;; (magit-push "origin" "develop" nil
;; 	    ;; (format "%s:mr/develop/%s"
;; 	    ;; 	    (magit-get-current-branch) (magit-get-current-branch))  )
;; 	     )
;; (shell-command-to-string "ls")

(file-name-sans-extension (buffer-file-name))
(buffer-file-name)
(file-name-nondirectory (buffer-file-name))
