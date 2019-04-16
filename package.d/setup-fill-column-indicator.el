;;; setup-fill-column-indicator --- Summary

;;; Commentary:

;; setup-fill-column-indicator.el --- Setup Fill-Column-Indicator package

;;; Code:

(use-package fill-column-indicator
  :init
  (add-hook 'prog-mode-hook #'fci-mode)
  (setq fci-rule-width 2
	fci-rule-column 80
	fci-rule-color "darkgray")
  ;; (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  ;; :config
  ;; (global-fci-mode 1))
  )

(provide 'setup-fill-column-indicator)

;;; setup-fill-column-indicator.el ends here
