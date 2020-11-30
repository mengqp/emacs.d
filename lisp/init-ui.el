;;; init-ui.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(progn
  (setq use-file-dialog nil)
  (setq use-dialog-box nil)
  ;; Show a marker in the left fringe for lines not in the buffer
  (setq indicate-empty-lines t)


  ;; 平滑滚动
  ;; (pixel-scroll-mode t)
  ;;当前行高亮
  ;; (global-hl-line-mode 1)
  ;;指针不要闪
  (blink-cursor-mode -1)
  ;;显示括号匹配
  ;; (show-paren-mode t)
  ;; show cursor position within line
  ;; (column-number-mode 1)
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
  :defer t
  )

(use-package symbol-overlay
  :ensure t
  :defer t
  )

(use-package column-enforce-mode
  :ensure t
  :defer t
  :diminish column-enforce-mode
  :hook((cc-mode python-mode) . column-enforce-mode)
  :config
  (setq column-enforce-column 80)
  )

(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
