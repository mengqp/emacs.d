;;; init-ui.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(progn
  (setq use-file-dialog nil)
  (setq use-dialog-box nil)
  ;; Show a marker in the left fringe for lines not in the buffer
  (setq indicate-empty-lines t)

  ;;指针不要闪
  (blink-cursor-mode -1)
  )

;; (set-frame-parameter nil 'alpha '(90 . 100))

(defun linux-fullscreen ()
  "Linux fullscreen."
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth))
  )

(linux-fullscreen)

;; (when *win64*
;;   (run-with-idle-timer 0.2 nil 'w32-send-sys-command 61488)
;;   )

(use-package all-the-icons
  :ensure t
  :defer 1
  )

(use-package symbol-overlay
  :ensure t
  :defer 1
  )

(use-package column-enforce-mode
  :ensure t
  :defer 1
  :diminish column-enforce-mode
  ;; :hook((cc-mode python-mode) . column-enforce-mode)
  :config
  (setq column-enforce-column 80)
  )

(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
