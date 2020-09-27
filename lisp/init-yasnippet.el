;;; init-yasnippet.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:


(use-package yasnippet
  :ensure t
  :defer t
  :hook ((org-mode prog-mode) . yas-minor-mode)
  :commands (yasnippet yas-reload-all)
  :commands (company company-abort)
  :commands (company company-complete-selection)
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/mysnippets"
	  "~/.emacs.d/site-lisp/yasnippet-snippets/snippets"
	  ))
  :config
  (use-package yasnippet-snippets
    :ensure nil
    :defer t)
  (yas-reload-all)
  (setq yas-prompt-functions '(yas-completing-prompt))

  )

(use-package ivy-yasnippet
  :ensure t
  :defer t
  :bind (("C-c C-y" . ivy-yasnippet))
  )

(provide 'init-yasnippet)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-yasnippet.el ends here
