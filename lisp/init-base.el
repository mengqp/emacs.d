;;这就一个进行基本配置的文件

;; ;; ---------------------------------gui ----------------------------------------
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

;; (defun fullscreen ()
;;   (interactive)
;;   (set-frame-parameter nil 'fullscreen
;; 		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

;; (fullscreen)

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
;; (require 'fill-column-indicator)
(use-package fill-column-indicator
  :defer t
  :init
  (add-hook 'prog-mode-hook 'fci-mode)
  (add-hook 'prog-mode-hook (lambda () (setq truncate-lines nil)))
  (setq fci-rule-column 80)
  (setq fci-rule-width 3)
  (setq fci-rule-color "darkblue")

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
(use-package unicad
  :defer t)
;; (require 'unicad)


;; --------------------------------other  --------------------------------------
;; 去除一个警告
(setq exec-path-from-shell-check-startup-files nil)

;; 输入法切换时不出现问题
(global-set-key (kbd "C-SPC") nil)

(use-package cnfonts
  ;; :defer t
  :config
  ;; 让 cnfonts 随着 Emacs 自动生效。
  (cnfonts-enable)
  )
;; (require 'cnfonts)


(use-package savehist
    :init
    (progn
      ;; Minibuffer history
      (setq savehist-file (concat "~/.emacs.d/" "savehist")
            enable-recursive-minibuffers t ; Allow commands in minibuffers
            history-length 1000
            savehist-additional-variables '(mark-ring
                                            global-mark-ring
                                            search-ring
                                            regexp-search-ring
                                            extended-command-history)
            savehist-autosave-interval 60)
      (savehist-mode t)))


;; http://emacsredux.com/blog/2014/04/05/which-function-mode/
(which-func-mode)
;; when editing js file, this feature is very useful
(setq-default header-line-format
	      '((which-func-mode ("" which-func-format " "))))
(setq-default mode-line-misc-info
	      (assq-delete-all 'which-function-mode mode-line-misc-info))

(use-package expand-region
  :commands er/expand-region
  :init
  (global-set-key (kbd "C-=") 'er/expand-region)

  )
;; (require 'expand-region)

(provide 'init-base)
