;;; init—lisp.el




  (general-define-key :states '(normal motion)
		      :keymaps '(lisp-mode-map)
                    :prefix ","

		    "eb" 'eval-buffer
		    "ee" 'eval-expression

		    (which-key-add-key-based-replacements
		      ", e" "eval")
                    )








;;; ends init-lisp.el
