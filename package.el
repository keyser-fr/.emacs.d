;;; package --- Summary

;;; Commentary:

;; package.el --- Package configuration

;;; Code:

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these lines to enable/disable "ELPA", "MELPA" and "MELPA Stable" as desired
  ;; (add-to-list 'package-archives (cons "elpa" (concat proto "://elpa.gnu.org/packages/")) t)
  ;; (add-to-list 'package-archives (cons "marmalade" (concat proto "://marmalade-repo.org/packages/")) t)
  ;; (add-to-list 'package-archives (cons "org" (concat proto "://orgmode/elpa/")) t)
  ;; (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/"))))
  (setq tls-checktrust t
	tls-program '("gnutls-cli --x509cafile %t -p %p %h")
	gnutls-verify-error t))
(package-initialize)

;; USE-PACKAGE SECTION

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(load "~/.emacs.d/use-package")
(load-directory "~/.emacs.d/package.d/")

(provide 'package)

;;; package.el ends here
