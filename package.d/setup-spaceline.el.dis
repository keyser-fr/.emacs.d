;;; setup-spaceline --- Summary

;;; Commentary:

;; setup-spaceline.el --- Setup Spaceline package

;;; Code:

(use-package spaceline
  :init
  (require 'spaceline-config)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  :config
  ;; (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main))))
  (progn
    (spaceline-define-segment buffer-id
      (if (buffer-file-name)
          (let ((project-root (projectile-project-p)))
            (if project-root
                (file-relative-name (buffer-file-name) project-root)
              (abbreviate-file-name (buffer-file-name))))
        (powerline-buffer-id)))
    (spaceline-spacemacs-theme)
    (spaceline-toggle-minor-modes-off)))

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
      (major-mode)))
  (setq-default
   spaceline-flycheck-bullet "❖ %s"
   spaceline-separator-dir-left '(right . right)
   spaceline-separator-dir-right '(left . left)))

;; https://github.com/domtronn/spaceline-all-the-icons.el
(use-package spaceline-all-the-icons
  :after spaceline
  :config
  (spaceline-all-the-icons-theme)
  (setq

   ;; Icon Sets
   spaceline-all-the-icons-icon-set-modified 'chain
   spaceline-all-the-icons-icon-set-bookmark 'heart
   spaceline-all-the-icons-icon-set-dedicated 'pin
   spaceline-all-the-icons-icon-set-window-numbering 'circle
   spaceline-all-the-icons-icon-set-eyebrownse-workspace 'circle
   spaceline-all-the-icons-icon-set-multiple-cursors 'caret
   spaceline-all-the-icons-icon-set-git-stats 'diff-icons
   spaceline-all-the-icons-icon-set-flycheck-slim 'dots
   spaceline-all-the-icons-icon-set-sun-time 'rise/set

   ;; Separators
   spaceline-all-the-icons-separator-type 'arrow

   ;; Customize
   spaceline-all-the-icons-flycheck-alternate t
   spaceline-all-the-icons-highlight-file-name t
   spaceline-all-the-icons-hide-long-buffer-path t)

  ;; Disabled Segments
  (spaceline-toggle-all-the-icons-bookmark-off)
  (spaceline-toggle-all-the-icons-dedicated-off)
  (spaceline-toggle-all-the-icons-fullscreen-off)
  (spaceline-toggle-all-the-icons-package-updates-off)
  (spaceline-toggle-all-the-icons-buffer-position-on)

  ;; Enabled Segments
  (spaceline-toggle-all-the-icons-narrowed-on)
  (spaceline-toggle-all-the-icons-flycheck-status-on)
  (spaceline-toggle-all-the-icons-git-status-on)
  (spaceline-toggle-all-the-icons-vc-icon-on)
  (spaceline-toggle-all-the-icons-mode-icon-on)
  (spaceline-toggle-all-the-icons-package-updates-on)
  (spaceline-toggle-all-the-icons-text-scale-on)
  (spaceline-toggle-all-the-icons-region-info-on)

  ;; Optional dependencies
  (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
  (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
  (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
  (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
  (spaceline-all-the-icons--setup-neotree))        ;; Enable Neotree mode line

(provide 'setup-spaceline)

;;; setup-spaceline.el ends here
