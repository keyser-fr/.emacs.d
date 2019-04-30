;;; setup-powerline --- Summary

;;; Commentary:

;; setup-powerline.el --- Setup Powerline package

;;; Code:

(use-package powerline
  :if window-system
  :config
  (powerline-default-theme))

(provide 'setup-powerline)

;;; setup-powerline.el ends here
