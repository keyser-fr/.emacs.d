;;; setup-dired-sidebar --- Summary

;;; Commentary:

;; setup-dired-sidebar.el --- Setup Dired-Sidebar package

;;; Code:

;; Hack for icons size
;; rename elpa/vscode-icon/icons/128 directory to 128.bak + create symlink
;; cd elpa/vscode-icon-<revision>/icons/
;; cp 128 128.bak
;; ln -s 23 128

(use-package vscode-icon
  :commands (vscode-icon-for-file))

(use-package dired-subtree
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  ;; (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  ;; (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

(provide 'setup-dired-sidebar)

;;; setup-dired-sidebar.el ends here
