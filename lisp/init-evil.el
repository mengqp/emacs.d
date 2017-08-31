;;开启evil模式
;; (require 'evil)
;; (require 'evil-numbers)
;; (require 'evil-leader)
;; (require 'evil-visualstar)
;; (require 'evil-matchit)
;; (require 'evil-escape)

(use-package evil
  :ensure t
  :diminish evil-mode
  :init
  :config
  (evil-mode t)
  ;; (define-key evil-normal-state-map (kbd "C-]") 'helm-cscope-find-this-symbol)

  ;;实现代码折叠
  (use-package hideshow
    :defer t
    :diminish hs-minor-mode
    :init
    (add-hook 'prog-mode-hook
	      (lambda()
		(hs-minor-mode 1)
		))
    (add-hook 'dired-mode-hook
	      (lambda( )
		(evil-emacs-state)))
    )

  (use-package evil-numbers
    :ensure t
    ;; :defer t
    :init
    ;; +/- 代替
    (define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)
    )

  ;;
  (use-package evil-leader
    :ensure t
    :diminish evil-leader-mode
    :init
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    )

  (use-package evil-visualstar
    :ensure t
    :init
    (global-evil-visualstar-mode)
    )


  (use-package evil-matchit
    :ensure t
    :diminish evil-matchit-mode
    :init
    (setq evilmi-ignore-comments nil)
    :config
    (global-evil-matchit-mode 1)
    )

  (use-package evil-escape
    :ensure t
    :diminish evil-escape-mode
    :init
    (setq-default evil-escape-key-sequence "jk")
    (setq-default evil-escape-delay 0.2)
    :config
    (evil-escape-mode t)
    )
  )



(provide 'init-evil)
