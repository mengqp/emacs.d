;;; init-markdown.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package markdown-mode
  :ensure t
  :defer t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
(provide 'init-markdown)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-abbrev.el ends here
