;;; smartparens --- Summary

;;; Commentary:

;; smartparens.el --- Smartparens package

;;; Code:

(use-package smartparens
  :diminish smartparens-mode
  :config
  ;; Activate smartparens globally
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)

  ;; Activate smartparens in minibuffer
  (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode))

(provide 'smartparens)

;;; smartparens.el ends here
