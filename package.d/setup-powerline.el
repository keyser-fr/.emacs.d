;;; setup-powerline --- Summary

;;; Commentary:

;; setup-powerline.el --- Setup Powerline package

;;; Code:

(use-package powerline
  :if window-system
  :config
  (setq-default
   powerline-default-separator 'utf-8
   powerline-height 24
   powerline-default-separator 'arrow))

(provide 'setup-powerline)

;;; setup-powerline.el ends here
