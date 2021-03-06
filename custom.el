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
    (treemacs-magit treemacs-icons-dired treemacs-projectile treemacs smex ido-completing-read+ ido-grid-mode ido-hacks ido-vertical-mode flx-ido auto-package-update all-the-icons em-term em-prompt em-cmpl esh-opt all-the-icons-ivy all-the-icons-dired spaceline-all-the-icons indent-guide terraform-mode virtualenvwrapper helm-projectile helm-tramp docker-compose-mode docker-api docker lua-mode org-bullets org-inlinetask yasnippet-snippets dired-sidebar dired-subtree vscode-icon yaml-mode undo-tree company-jedi jedi highlight-indent-guides company-anaconda anaconda-mode elpy flycheck-pyflakes markdown-mode magit fill-column-indicator dockerfile-mode company bm ws-butler multiple-cursors smartparens helm-c-yasnippet helm-make helm-ls-git helm-git-grep helm-descbinds helm-swoop helm powerline spaceline molokai-theme diff-hl diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-directory "~/.emacs.d/custom.d/")

(provide 'custom)

;;; custom.el ends here
