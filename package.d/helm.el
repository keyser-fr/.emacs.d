;;; helm --- Summary

;;; Commentary:

;; helm.el --- helm package

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

(provide 'helm)

;;; helm.el ends here
