;;; init-ui.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(progn
  (when (featurep 'ns)
  (push '(ns-transparent-titlebar . t) default-frame-alist))
  (setq use-file-dialog nil)
  (setq use-dialog-box nil)
  (setq ring-bell-function 'ignore)
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-echo-area-message t)

  (setq inhibit-splash-screen t)
  ;; Show a marker in the left fringe for lines not in the buffer
  (setq indicate-empty-lines t)

  ;; 平滑滚动
  (pixel-scroll-mode t)
  ;;当前行高亮
  (global-hl-line-mode 1)
  ;;指针不要闪
  (blink-cursor-mode -1)
  ;;显示括号匹配
  (show-paren-mode t)
  ;; show cursor position within line
  (column-number-mode 1)
  )

;; (set-frame-parameter nil 'alpha '(90 . 100))

;; (when *linux*
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth))
;;   )

;; (when *win64*
;;   (run-with-idle-timer 0.2 nil 'w32-send-sys-command 61488)
;;   )

(use-package all-the-icons
  :ensure t
  :defer t
  )

(use-package ranger
  :ensure t
  :defer t
  )

(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
