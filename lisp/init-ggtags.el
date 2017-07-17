(require 'ggtags)


;(ggtags-mode t)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(global-set-key (kbd "M-q") 'ggtags-find-tag-dwim)


(provide 'init-ggtags)
