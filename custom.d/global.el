;;; custom --- Summary

;;; Commentary:

;; custom.el --- Custom configuration

;;; Code:

;; (setq inhibit-startup-message t) ;; hide the startup message
;; (setq make-backup-files nil) ;; stop creating those backup~ files
;; (setq auto-save-default nil) ;; stop creating those #auto-save# files
;; (setq confirm-nonexistent-file-or-buffer nil)

;; (menu-bar-mode -1) ;; deactivate menubar
;; (tool-bar-mode -1) ;; deactivate toolbar
;; (scroll-bar-mode -1) ;; deactivate scrollbar
;; (line-number-mode t) ;; print line in state bar
;; (column-number-mode t) ;; print column in state bar

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(set-language-environment "UTF-8") ;; environnement
(setq display-time-24hr-format "%H:%M") ;; date
(display-time-mode t) ;; time
(setq tramp-default-method "ssh") ;; tramp mode
(setq scroll-step 1) ;; scrolling line (vim like)
(setq ring-bell-function 'ignore) ;; deactivate ringbell
(setq truncate-partial-width-windows nil) ;; truncate windows when split horizontally (C-x 3)
(global-visual-line-mode 1) ;; human reading long line (carriage return)
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; remove useless space & carriage return (http://emacswiki.org/emacs/DeletingWhitespace)
(add-hook 'prog-mode-hook 'highlight-indentation-mode) ;; add hl to indentation
(global-font-lock-mode t) ;; enable syntaxic color
(global-hl-line-mode) ;; highlight current line
(setq font-lock-maximum-size nil) ;; max color
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'custom)

;;; custom.el ends here
