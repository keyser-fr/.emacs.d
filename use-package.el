;;; use-package --- Summary

;;; Commentary:

;; use-package.el --- Emacs use-package configuration

;; https://jwiegley.github.io/use-package
;; https://github.com/jwiegley/use-package

;;; Code:

(setq use-package-always-ensure t) ; always set ":ensure t"

(use-package diminish)
(use-package bind-key)

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(provide 'use-package)

;;; use-package.el ends here
