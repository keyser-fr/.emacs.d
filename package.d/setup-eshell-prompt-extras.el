;;; setup-eshell-prompt-extras --- Summary

;;; Commentary:

;; setup-eshell-prompt-extras.el --- Custom configuration

;;; Code:

;; See eshell-prompt-function below
  (setq eshell-prompt-regexp "^[^#$\n]* [#$] ")

  ;; So the history vars are defined
  (require 'em-hist)
  (if (boundp 'eshell-save-history-on-exit)
      ;; Don't ask, just save
      (setq eshell-save-history-on-exit t))

;; https://github.com/zwild/eshell-prompt-extras
(use-package eshell-prompt-extras
  :init
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
	  eshell-prompt-function 'epe-theme-lambda))
  (with-eval-after-load "esh-opt"
    (require 'virtualenvwrapper)
    (venv-initialize-eshell)
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
	  eshell-prompt-function 'epe-theme-lambda)))

(defun eshell/magit ()
  "Function to open magit-status for the current directory"
  (interactive)
  (magit-status default-directory)
  nil)

(provide 'setup-eshell-prompt-extras)

;;; setup-eshell-prompt-extras.el ends here
