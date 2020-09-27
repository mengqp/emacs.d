;;; init-ui.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
;; 设置基本界面
(progn
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
  )

(progn
  ;;显示括号匹配
  (show-paren-mode t)
  ;; show cursor position within line
  (column-number-mode 1)

  )


;; (set-frame-parameter nil 'alpha '(90 . 100))

(when *linux*
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth))
  )

;; (when *win64*
;;   (run-with-idle-timer 0.2 nil 'w32-send-sys-command 61488)
;;   )

(use-package all-the-icons
  :ensure t
  :defer t
  )

;; 括号
(use-package rainbow-delimiters
  :disabled t
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  :config
  (set-face-foreground 'rainbow-delimiters-depth-1-face "DeepPink")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "cyan")
  )

(use-package highlight-indent-guides
  :ensure t
  :disabled t
  :defer t
  :hook(prog-mode . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'character)
  )

(use-package highlight-doxygen
  :ensure t
  :hook
  (prog-mode . highlight-doxygen-mode)
  )

(use-package hl-todo
  :ensure t
  :defer t
  :hook (after-init . global-hl-todo-mode))

(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
