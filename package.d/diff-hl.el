;;; diff-hl --- Summary

;;; Commentary:

;; diff-hl.el --- Template package

;;; Code:

(use-package diff-hl
  :defer 1
  :diminish " D"
  :init
  (add-hook 'org-mode-hook (lambda () (run-at-time "1 sec" nil #'diff-hl-mode)))
  :config
  (global-diff-hl-mode)
  ;; Highlight changes to the current file in the fringe
  (add-hook 'prog-mode-hook #'diff-hl-mode)
  (add-hook 'org-mode-hook #'diff-hl-mode)
  ;; Highlight changed files in the fringe of Dired
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  ;; Fall back to the display margin, if the fringe is unavailable
  (unless (display-graphic-p) (diff-hl-margin-mode))
  (setq diff-hl-fringe-bmp-function 'diff-hl-fringe-bmp-from-type)
  (diff-hl-margin-mode)
  (setq diff-hl-margin-side 'right)
  )

(provide 'diff-hl)

;;; diff-hl.el ends here
