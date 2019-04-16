;;; setup-ws-butler --- Summary

;;; Commentary:

;; setup-ws-butler.el --- Setup Ws-Butler package

;;; Code:

(use-package ws-butler
  :defer
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode))

(provide 'setup-ws-butler)

;;; setup-ws-butler.el ends here
