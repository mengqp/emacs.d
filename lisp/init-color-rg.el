;;; init-color-rg.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package color-rg
  :defer t
  :commands ( color-rg color-rg-search-input )
  :commands ( color-rg color-rg-search-symbol)
  :commands ( color-rg color-rg-search-project )
  :commands ( color-rg color-rg-search-symbol-with-type )
  :commands ( color-rg color-rg-search-project-with-type )
  :bind(
	("M-s cp" . color-rg-search-project-with-type)
	("M-s ct" . color-rg-search-symbol-with-type)
	("M-s cc" . color-rg-search-project)
	("M-s ci" . color-rg-search-input)
	("M-s cs" . color-rg-search-symbol)
	)
  )


(provide 'init-color-rg)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-color-rg.el ends here
