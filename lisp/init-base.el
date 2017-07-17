;;这就一个进行基本配置的文件

;; ---------------------------------gui ----------------------------------------
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

;; NO tool bar
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
;; no scroll bar
(if (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))
;; no menu bar
(if (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))


;;不产生备份
(setq make-backup-files nil)
(setq auto-save-default -1)
(setq backup-inhibited t)

;;当前行高亮
(global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")

;;显示括号匹配
(show-paren-mode t)

;;文件在改变时自动加载
(global-auto-revert-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;指针不要闪
(blink-cursor-mode -1)

; 去除 M-x 里面的 ^
(setq ivy-initial-inputs-alist nil)

;;80列
(require 'fill-column-indicator)
(use-package fill-column-indicator
  :init
  (setq fci-rule-column 80)
  (setq fci-rule-width 3)
  (setq fci-rule-color "darkblue")
  :config
  (add-hook 'prog-mode-hook 'fci-mode)
  )

;;在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;;允许minibuffer自由变化其宽度大小
(setq resize-mini-windows t)


;; 最近的文件
;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-menu-items 1000)

;; 清楚白块
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; --------------------------------coding --------------------------------------
(require 'unicad)


;; --------------------------------other  --------------------------------------
;; 去除一个警告
(setq exec-path-from-shell-check-startup-files nil)

;; 输入法切换时不出现问题
(global-set-key (kbd "C-SPC") nil)


(provide 'init-base)
