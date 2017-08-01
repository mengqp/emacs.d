
(require 'package)

;; Set it to `t' to use safer HTTPS to download packages
(defvar melpa-use-https-repo nil
  "By default, HTTP is used to download packages.
But you may use safer HTTPS instead.")


(setq package-archives '(
			 ("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
                          ("org-cn"   . "https://elpa.zilongshanren.com/org/")
                          ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")
                          ("melpa" . "https://melpa.org/packages/")
                          ("melpa-stable" . "https://stable.melpa.org/packages/")
                          ))



;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;;------------------------------------------------------------------------------
;; Fire up package.el and ensure the following packages are installed.
;;------------------------------------------------------------------------------
(package-initialize)

(require-package 'use-package)
(require-package 'general)

(require-package 'color-theme)
(require-package 'color-theme-solarized)
(require-package 'monokai-theme)
(require-package 'zenburn-theme)
(require-package 'spacemacs-theme)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'cyberpunk-theme)

(require-package 'chinese-fonts-setup)

(require-package 'linum-relative)
(require-package 'fill-column-indicator)


(require-package 'which-key)


(require-package 'ivy)
(require-package 'counsel)
(require-package 'swiper)
(require-package 'counsel-projectile)
(require-package 'ivy-todo)


(require-package 'helm)
(require-package 'helm-ag)
(require-package 'helm-cscope)
(require-package 'helm-make)
(require-package 'helm-projectile)

(require-package 'popup)
(require-package 'expand-region)
(require-package 'dired+)


(require-package 'projectile)
(require-package 'org-projectile)

(require-package 'evil)
(require-package 'evil-numbers)
(require-package 'evil-leader)
(require-package 'evil-visualstar)
(require-package 'evil-search-highlight-persist)
(require-package 'evil-matchit)
(require-package 'evil-org)
(require-package 'evil-escape)
(require-package 'evil-nerd-commenter)

(require-package 'xcscope)
(require-package 'company)

(require-package 'google-c-style)
(require-package 'smex)

(require-package 'window-numbering)

(require-package 'ace-jump-mode)
(require-package 'ace-jump-helm-line)


(require-package 'smartparens)
(require-package 'flymake)
(require-package 'hungry-delete)
(require-package 'popwin)
(require-package 'powerline)
(require-package 'spaceline)
(require-package 'diminish)



(require-package 'yasnippet)

(require-package 'irony)
(require-package 'company-irony)
(require-package 'company-irony-c-headers)
(require-package 'flycheck-irony)

(require-package 'ycmd)
(require-package 'company-ycmd)
(require-package 'flycheck-ycmd)


(require-package 'magit)
(require-package 'evil-magit)
(require-package 'git-gutter)

(require-package 'realgud)
(require-package 'flycheck-package)
(require-package 'package-lint)
(require-package 'helm-c-yasnippet)

(require-package 'persp-mode)

(require-package 'exec-path-from-shell)

(require-package 'multiple-cursors)
(require-package 'evil-mc)
(require-package 'switch-window)


(provide 'init-package)

;;; init-package ends here
