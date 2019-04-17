;;; setup-auto-package-update --- Summary

;;; Commentary:

;; setup-auto-package-update.el --- Setup Auto-Package-Update package

;;; Code:

;; With that setup, packages will be updated every 4 days, and the old packages will be removed.
(use-package auto-package-update
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 4)
   (auto-package-update-maybe))

(provide 'setup-auto-package-update)

;;; setup-auto-package-update.el ends here
