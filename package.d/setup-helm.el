;;; setup-helm --- Summary

;;; Commentary:

;; setup-helm.el --- Setup helm package

;;; Code:

(use-package helm
  :init
  (setq helm-split-window-default-side 'other)
  (helm-mode 1)
  :config
  (define-key helm-find-files-map
    (kbd "<backtab>") #'helm-select-action)
  (define-key helm-find-files-map
    (kbd "C-i")  #'helm-execute-persistent-action)
  :bind
  (("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-f" . helm-find-files)
   ("C-c o" . helm-occur)
   ("C-x b" . helm-mini)
   ("C-x r b" . helm-bookmarks)
   ("C-h a" . helm-apropos)
   ("C-h d" . helm-info-at-point)
   ("C-c L" . helm-locate)
   ("C-c r" . helm-resume)
   ("C-c i" . helm-imenu)))

(use-package helm-swoop
  :bind
  (("C-s" . helm-swoop-without-pre-input)
   ("C-S-s" . helm-swoop)))

(use-package helm-descbinds
  :init
  (helm-descbinds-mode))

(use-package helm-git-grep
  :bind
  (("C-c j" . helm-git-grep)
   ("C-c J" . helm-git-grep-at-point)))

(use-package helm-ls-git
  :bind
  (("C-c g" . helm-ls-git-ls)))

(use-package helm-make
  :bind
  (("C-c K" . helm-make)))

(use-package helm-c-yasnippet
  :bind
  (("C-c y" . helm-yas-complete)))

(use-package helm-tramp
  :if (display-graphic-p)
  :defer t)

(use-package helm-projectile
  :ensure t
  :if (display-graphic-p)
  :bind* (("C-c p D" . projectile-dired)
          ("C-c p v" . projectile-vc)
          ("C-c p k" . projectile-kill-buffers)

          ("C-c p p" . helm-projectile-switch-project)
          ("C-c p f" . helm-projectile-find-file)
          ("C-c p F" . helm-projectile-find-file-in-known-projects)
          ("C-c p g" . helm-projectile-find-file-dwin)
          ("C-c p d" . helm-projectile-find-dir)
          ("C-c p C-r" . helm-projectile-recentf)
          ("C-c p b" . helm-projectile-switch-to-buffer)
          ("C-c p s s" . helm-projectile-ag)
          ("C-c p s g" . helm-projectile-grep)
          )
  :diminish projectile-mode
  :init
  (setq projectile-keymap-prefix (kbd "C-c p")
        projectile-enable-caching t
        projectile-indexing-method 'alien
        projectile-completion-system 'helm
        projectile-mode-line '(:eval (format " {%s}" (projectile-project-name))))
  :config
  (projectile-global-mode)
  (helm-projectile-on))

(provide 'setup-helm)

;;; setup-helm.el ends here
