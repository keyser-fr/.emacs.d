;;; magit --- Summary

;;; Commentary:

;; magit.el --- Magit package

;;; Code:

;; (use-package magit
;;   :commands (magit-status)
;;   :bind (("C-x g" . magit-status)))

(use-package magit
  :commands magit-get-top-dir
  :bind (("C-c g" . magit-status)
         ("C-c C-g l" . magit-file-log)
         ("C-c f" . magit-grep)))

(provide 'magit)

;;; magit.el ends here
