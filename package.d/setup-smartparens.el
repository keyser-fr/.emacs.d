;;; setup-smartparens --- Summary

;;; Commentary:

;; setup-smartparens.el --- Setup Smartparens package

;;; Code:

(use-package smartparens
  :diminish smartparens-mode
  :config
  ;; Activate smartparens globally
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)

  ;; Activate smartparens in minibuffer
  (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode))

(provide 'setup-smartparens)

;;; setup-smartparens.el ends here
