;;; load-directory --- Summary

;;; Commentary:

;; load-directory.el --- Load directory

;;; Code:

;; This snippet loads all *.el files in a directory.
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(provide 'load-directory)

;;; load-directory.el ends here
