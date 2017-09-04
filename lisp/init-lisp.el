;;; init—lisp.el

(use-package elisp-mode
  :ensure nil
  :config
  (message "elisp")
  (general-define-key :states '(normal motion)
		      :keymaps '(lisp-interaction-mode-map
				 emacs-lisp-mode-map)
		      :prefix ","

		      "eb" 'eval-buffer
		      "ee" 'eval-expression

		      (which-key-add-key-based-replacements
			", e" "eval")
		      )
  )

(provide 'init-lisp)
;;; ends init-lisp.el
