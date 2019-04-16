;;; setup-smex --- Summary

;;; Commentary:

;; setup-smex.el --- Setup Smex package

;;; Code:

(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)))

(provide 'setup-smex)

;;; setup-smex.el ends here
