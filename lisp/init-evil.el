;;开启evil模式
(require 'evil)
(require 'evil-numbers)
(require 'evil-leader)
(require 'evil-visualstar)
(require 'evil-matchit)
(require 'evil-escape)

(use-package evil
  :init
  :config
  (evil-mode t)
  (define-key evil-normal-state-map (kbd "C-]") 'helm-cscope-find-this-symbol)
  ;;实现c-c++代码折叠
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (hs-minor-mode 1)
	      ))

  (add-hook 'emacs-lisp-mode-hook
	    (lambda()
	      (hs-minor-mode 1)))

  (add-hook 'dired-mode-hook
	    (lambda( )
	      (evil-emacs-state)))

  (add-hook 'cscope-minor-mode-hooks
	    (lambda( )
	      (evil-emacs-state)))
  )

(use-package evil-numbers
  :init
  ;; +/- 代替
  (define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)
  )

;;
(use-package evil-leader
  :init
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  )

(use-package evil-visualstar
  :init
  (global-evil-visualstar-mode)
  )


(use-package evil-matchit
  :init
  (setq evilmi-ignore-comments nil)
  :config
  (global-evil-matchit-mode 1)
  )

(use-package evil-escape
  :init
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  :config
  (evil-escape-mode t)
  )


(provide 'init-evil)
