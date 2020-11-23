;;; init-counsel-etags.el --- xxx -*- coding: utf-8-unix -*-

;;; Commentary:
;;; Code:
(use-package counsel-etags
  :ensure t
  :bind (("C-]" . counsel-etags-find-tag-at-point))
  :init
  (add-hook 'prog-mode-hook
        (lambda ()
          (add-hook 'after-save-hook
            'counsel-etags-virtual-update-tags 'append 'local)))
  :config
  (setq counsel-etags-update-interval 60)
  (add-to-list 'counsel-etags-ignore-directories "build"))

(provide 'init-counsel-etags)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-counsel-etags.el ends here
