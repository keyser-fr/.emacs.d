;;; setup-magit --- Summary

;;; Commentary:

;; setup-magit.el --- Setup Magit package

;;; Code:

(use-package magit
  :commands magit-get-top-dir
  :bind (("C-c g" . magit-status)
         ("C-c C-g l" . magit-file-log)
         ("C-c f" . magit-grep)))

(provide 'setup-magit)

;;; setup-magit.el ends here
