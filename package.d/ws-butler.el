;;; ws-butler --- Summary

;;; Commentary:

;; ws-butler.el --- Ws-Butler package

;;; Code:

(use-package ws-butler
  :defer
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode))

(provide 'ws-butler)

;;; ws-butler.el ends here
