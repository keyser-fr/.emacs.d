;;; setup-all-the-icons --- Summary

;;; Commentary:

;; setup-all-the-icons.el --- Setup All-The-Icons package

;;; Code:

;; Installing fonts
;; M-x all-the-icons-install-fonts

(use-package all-the-icons
  :defer 2)

(use-package all-the-icons-dired
  :hook
  (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ivy)

(provide 'setup-all-the-icons)

;;; setup-all-the-icons.el ends here
