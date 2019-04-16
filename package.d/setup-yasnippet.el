;;; setup-yasnippet --- Summary

;;; Commentary:

;; setup-yasnippet.el --- Setup Yasnippet package

;;; Code:

(use-package yasnippet
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  ;; (yas-global-mode 1)
  :config
  (yas-reload-all))

(use-package yasnippet-snippets)

(provide 'setup-yasnippet)

;;; setup-yasnippet.el ends here
