;;; init-coding.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)

(setq locale-coding-system 'utf-8
      default-process-coding-system '(utf-8 . utf-8))
;; (when *win64*
;;   ;; (prefer-coding-system 'cp950)
;;   ;; (prefer-coding-system 'gb2312)
;;   ;; (prefer-coding-system 'cp936)
;;   ;;(prefer-coding-system 'gb18030)
;; 					;(prefer-coding-system 'utf-16le-with-signature)
;;   (prefer-coding-system 'utf-8)
;;   ;; 新建文件使用 utf-8-unix 方式
;;   ;; 如果不写下面两句，只写
;;   ;; (prefer-coding-system 'utf-8)
;;   ;; 这一句的话，新建文件以 utf-8 编码，行末结束符平台相关
;;   ;; (prefer-coding-system 'utf-8-dos)
;;   ;; (prefer-coding-system 'utf-8-unix)
;;   )



(provide 'init-coding)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-coding.el ends here
