;;; init-compile.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package compile
  :defer t
  :config
  (defun mengqp/close-compilation-window ()
    "Close the window containing the '*compilation*' buffer."
    (interactive)
    (when compilation-last-buffer
      (delete-windows-on compilation-last-buffer)))
  )

(provide 'init-compile)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-compile.el ends here
