;;; init-cnfonts.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package cnfonts
  :ensure t
  :disabled t
  ;; :defer t
  :config
  (defconst cnfonts-personal-fontnames
    '(()
      ("思源黑体" "思源黑体 CN")
      ()
      ))
  ;; 让 cnfonts 随着 Emacs 自动生效。
  (cnfonts-enable)
  )

(when *linux*
  ;; Auto generated by cnfonts
  ;; <https://github.com/tumashu/cnfonts>
  (set-face-attribute
   'default nil
   :font (font-spec :name "-ADBO-Source Code Pro-ultrabold-italic-normal-*-*-*-*-*-m-0-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 12.5))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-ADBO-Source Han Serif CN-semibold-normal-normal-*-*-*-*-*-*-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 15.0)))
  )

(when *win64*
  (set-face-attribute
   'default nil
   :font (font-spec :name "-outline-Consolas-bold-normal-normal-mono-*-*-*-*-c-*-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 12.5))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-outline-微软雅黑-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 15.0)))
  )
(provide 'init-cnfonts)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cnfonts.el ends here
