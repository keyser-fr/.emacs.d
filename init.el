;;; init --- Summary

;;; Commentary:

;; init.el --- Emacs configuration

;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;; https://lupan.pl/dotemacs/

;;; Code:

;; Customize handler
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror) ; Prevent errors if custom.el does not exist

;; Proxy
(load "~/.emacs.d/proxy")

;; Package handler
(load "~/.emacs.d/package")

(provide 'init)

;;; init.el ends here
