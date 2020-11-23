;;; init-dap.el --- c++ -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package dap-mode
  :ensure t
  :defer t
  :hook (c++-mode . dap-mode)
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (require 'dap-lldb)
  (setq dap-lldb-debug-program "/usr/bin/lldb-server")
  (setq dap-lldb-debugged-program-function "/media/sf_workspace/EM761_BV2/02_src/V2/02src/01v2/Debug/EM761_BV2")
  )


(provide 'init-dap)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dap.el ends here
