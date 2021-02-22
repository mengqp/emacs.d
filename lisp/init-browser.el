;;; init-browser.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package eaf
  :ensure nil
  :defer t
  :init
  (use-package epc
    :ensure t
    :defer t)
  (use-package ctable
    :ensure t
    :defer t
    )
  (use-package deferred
    :ensure t
    :defer t)
  (use-package s
    :defer t
    :ensure t)
  (setq eaf-find-alternate-file-in-dired t)
  ;; :config
  ;; (eaf-bind-key scroll_up "RET" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_down_page "DEL" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  )

(provide 'init-browser)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-browser.el ends here
