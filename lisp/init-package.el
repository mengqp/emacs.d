;;; init-package.el --- package -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(require 'package)

(package-initialize)
;; Set it to `t' to use safer HTTPS to download packages
(defvar melpa-use-https-repo nil
  "By default, HTTP is used to download packages.
But you may use safer HTTPS instead.")


(setq package-archives '(
                         ;; ("melpa-cn-stable" . "http://elpa.emacs-china.org/melpa-stable/")
                         ;; ("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
			 ;; ("org-cn"   . "https://elpa.zilongshanren.com/org/")
			 ;; ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")
                         ;; ("melpa-stable-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
			 ("melpa-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("gnu-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("org-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ;; ("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
                         ;; ("org-cn"   . "http://elpa.emacs-china.org/org/")
                         ;; ("gnu-cn" . "http://elpa.emacs-china.org/gnu/")
                         ;; ("melpa" . "https://melpa.org/packages/")
			 ;; ("gnu" . "https://elpa.gnu.org/packages/")
			 ;; ("popkit" . "http://elpa.popkit.org/packages/")
                         ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ))
;; (package-initialize)


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
;; (package-initialize)

(require-package 'use-package)
(require-package 'diminish)
(require-package 'dash-functional)

(provide 'init-package)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-package.el ends here
