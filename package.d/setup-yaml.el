;;; setup-yaml --- Summary

;;; Commentary:

;; setup-yaml.el --- Setup Yaml package

;;; Code:

(use-package indent-guide
  :init (add-hook 'yaml-mode-hook 'indent-guide-mode))

(use-package yaml-mode
  :defer t
  :mode ("\\.yml\\'" "\\.sls\\'")
  :init
  (add-hook 'yaml-mode-hook 'turn-off-auto-fill))

(provide 'setup-yaml)

;;; setup-yaml.el ends here
