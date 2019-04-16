;;; custom --- Summary

;;; Commentary:

;; custom.el --- Package configuration

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-bullets org-inlinetask yasnippet-snippets dired-sidebar dired-subtree vscode-icon yaml-mode undo-tree company-jedi jedi highlight-indent-guides company-anaconda anaconda-mode elpy flycheck-pyflakes markdown-mode magit fill-column-indicator dockerfile-mode company bm ws-butler multiple-cursors smartparens helm-c-yasnippet helm-make helm-ls-git helm-git-grep helm-descbinds helm-swoop helm powerline spaceline molokai-theme diff-hl diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-directory "~/.emacs.d/custom.d/")

(provide 'custom)

;;; custom.el ends here
