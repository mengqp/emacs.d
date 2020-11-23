;;; init-leecode.el --- leecode -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package leetcode
  :ensure t
  :defer t
  :config
  (setq leetcode-prefer-language "c")
  (setq leetcode-prefer-sql "sqlite3")
  )


(provide 'init-leecode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-leecode.el ends here
