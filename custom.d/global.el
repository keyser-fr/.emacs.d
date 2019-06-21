;;; global --- Summary

;;; Commentary:

;; global.el --- Custom configuration

;;; Code:

;; Global mode
(global-visual-line-mode 1) ;; human reading long line (carriage return)
(global-font-lock-mode t) ;; enable syntaxic color
(global-hl-line-mode) ;; highlight current line
(set-face-background 'hl-line "#000001") ;; Set any color as the background face of the current line
(set-face-foreground 'highlight nil) ;; To keep syntax highlighting in the current line
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff") # highlight selected region
(display-time-mode t) ;; time
(set-language-environment "UTF-8") ;; language environnement encoding
(set-default-coding-systems 'utf-8) ;; coding system encoding
;; (menu-bar-mode -1) ;; deactivate menubar
;; (tool-bar-mode -1) ;; deactivate toolbar
;; (scroll-bar-mode -1) ;; deactivate scrollbar
;; (line-number-mode t) ;; print line in state bar
;; (column-number-mode t) ;; print column in state bar
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Parameters definitions
(setq display-time-24hr-format "%H:%M") ;; date
;; (setq inhibit-startup-message t) ;; hide the startup message
;; (setq make-backup-files nil) ;; stop creating those backup~ files
;; (setq auto-save-default nil) ;; stop creating those #auto-save# files
;; (setq confirm-nonexistent-file-or-buffer nil)
(setq tramp-default-method "ssh") ;; tramp mode
(setq scroll-step 1) ;; scrolling line (vim like)
(setq ring-bell-function 'ignore) ;; deactivate ringbell
(setq truncate-partial-width-windows nil) ;; truncate windows when split horizontally (C-x 3)
(setq font-lock-maximum-size nil) ;; max color
(setq ediff-split-window-function 'split-window-vertically) ;; split vertically
(setq ediff-merge-split-window-function 'split-window-vertically) ;; split-vertically

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; remove useless space & carriage return (http://emacswiki.org/emacs/DeletingWhitespace)
(add-hook 'prog-mode-hook 'highlight-indentation-mode) ;; add hl to indentation

;; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'global)

;;; global.el ends here
