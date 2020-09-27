;;; init-cmake.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package cmake-mode
  :ensure t
  :defer t
  :mode (
	 ("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)
	 ))

(provide 'init-cmake)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cmake.el ends here
