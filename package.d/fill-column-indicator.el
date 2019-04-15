;;; fill-column-indicator --- Summary

;;; Commentary:

;; fill-column-indicator.el --- Fill-Column-Indicator package

;;; Code:

(use-package fill-column-indicator
  :init
  (setq fci-rule-width 2)
  (setq fci-rule-column 80)
  (setq fci-rule-color "darkgray")
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  :config
  (global-fci-mode 1))

(provide 'fill-column-indicator)

;;; fill-column-indicator.el ends here
