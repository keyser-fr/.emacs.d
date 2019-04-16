;;; setup-projectile --- Summary

;;; Commentary:

;; setup-projectile.el --- Setup Projectile package

;;; Code:

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  (projectile-global-mode)
  (setq projectile-enable-caching t
  	;; ignore some common files for projectile
  	projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")
        projectile-globally-ignored-files '(".DS_Store" "Icon" "TAGS")))

(provide 'setup-projectile)

;;; setup-projectile.el ends here
