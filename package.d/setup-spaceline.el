;;; setup-spaceline --- Summary

;;; Commentary:

;; setup-spaceline.el --- Setup Spaceline package

;;; Code:

(use-package spaceline
  :config
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-helm-mode 1)
  (spaceline-install
   'main
   '((buffer-modified)
     ((remote-host buffer-id) :face highlight-face)
     (process :when active))
   '((selection-info :face 'region :when mark-active)
     ((flycheck-error flycheck-warning flycheck-info) :when active)
     (which-function)
     (version-control :when active)
     (line-column)
     (global :when active)
     (major-mode))))

(setq-default
 powerline-height 24
 powerline-default-separator 'wave
 spaceline-flycheck-bullet "❖ %s"
 spaceline-separator-dir-left '(right . right)
 spaceline-separator-dir-right '(left . left))

(provide 'setup-spaceline)

;;; setup-spaceline.el ends here
