;;; init --- Summary

;;; Commentary:

;; init.el --- Emacs configuration

;;; Code:

;; This snippet loads all *.el files in a directory.
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))

;; Customize handler
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror) ; Prevent errors if custom.el does not exist

;; Proxy
(load "~/.emacs.d/proxy")

;; Package handler
(load "~/.emacs.d/package")

(provide 'init)

;;; init.el ends here
