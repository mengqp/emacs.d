;;; init-yasnippet.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:


(use-package yasnippet
  :ensure t
  :defer t
  :hook ((org-mode prog-mode) . yas-minor-mode)
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/mysnippets"
	  "~/.emacs.d/site-lisp/yasnippet-snippets/snippets"
	  ))
  (setq yas-prompt-functions '(yas-completing-prompt))
  :config
  (yas-reload-all)

  )

(use-package yasnippet-snippets
  :ensure nil
  :defer t)

(use-package ivy-yasnippet
  :ensure t
  :defer t
  ;; :bind (("C-c C-y" . ivy-yasnippet))
  )

(provide 'init-yasnippet)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-yasnippet.el ends here
