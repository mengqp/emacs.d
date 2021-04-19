;;; init-yasnippet.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:


(use-package yasnippet
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
  :load-path "yasnippet-snippets"
  :ensure nil
  )

(use-package ivy-yasnippet)

(provide 'init-yasnippet)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-yasnippet.el ends here
