;; (require exec-path-from-shell)

;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
    current buffer's file. The eshell is renamed to match that
    directory to make multiple eshell windows easier."
  (interactive)
  ;; (let* ((parent (if (buffer-file-name)
  ;; 		     (file-name-directory (buffer-file-name))
  ;; 		   default-directory))
  ;; 	 (height (/ (window-total-height) 3))
  ;; 	 (name   (car (last (split-string parent "/" t)))))
  (let* ((height (/ (window-total-height) 3)))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell nil)
    ;; (rename-buffer (concat "*eshell: " name "*"))

    ;; (insert (concat "ls"))
    ;; (eshell-send-input)
    ))

(defun eshell-evil-a ()
  "quit eshell and delete window"
  (interactive)
  (move-end-of-line nil)
  (evil-insert nil)
  (forward-char)
  )

(defun eshell-evil-q ()
  "quit eshell and delete window"
  (interactive)
  ;; (eshell-evil-a)
  ;; (insert (concat "exit"))
  ;; (eshell-send-input)
  (eshell-quit-process)
  (quit-window)
  (delete-window))


(use-package eshell
  :defer t
  :config


  (general-define-key :states '(normal motion)
		      :keymaps '(eshell-mode-map)
		      ;; :prefix ";"
		      "q" 'eshell-evil-q
		      "a" 'eshell-evil-a
		      "i" 'eshell-evil-a
		      )

  )


(provide 'init-shell)
