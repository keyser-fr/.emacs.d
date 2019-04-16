;;; init --- Summary

;;; Commentary:

;; init.el --- Emacs configuration

;;; Code:

;; Snippets
(load "~/.emacs.d/snippets/load-directory")
(load-directory "~/.emacs.d/snippets/snippets.d/")

;; Customize handler
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror) ; Prevent errors if custom.el does not exist

;; Proxy
(load "~/.emacs.d/proxy")

;; Package handler
(load "~/.emacs.d/package")

(provide 'init)

;;; init.el ends here
