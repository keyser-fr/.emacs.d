;;; setup-ido --- Summary

;;; Commentary:

;; setup-ido.el --- Setup Ido package

;;; Code:

(use-package ido
  :init
  (setq ido-create-new-buffer 'always
        ido-enable-flex-matching t
        ;; ido-everywhere t
        ido-use-filename-at-point 'guess
        ido-case-fold nil
        ido-use-faces nil
        ido-default-buffer-method 'selected-window)
  (ido-mode t))

;; Fuzzy matching for ido.
(use-package flx-ido
  :init
  (flx-ido-mode t))

(use-package ido-vertical-mode
  :requires ido
  :config (ido-vertical-mode))

(use-package ido-hacks
  :requires ido
  :config (ido-hacks-mode))

;; Present ido search results as a grid.
(use-package ido-grid-mode
  :init
  (setq ido-grid-mode-min-rows 1
        ido-grid-mode-max-rows 15
        ido-grid-mode-prefix-scrolls t)
  (ido-grid-mode t))

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

(provide 'setup-ido)

;;; setup-ido.el ends here
