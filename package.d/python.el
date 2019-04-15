;;; python --- Summary

;;; Commentary:

;; http://rakan.me/emacs/python-dev-with-emacs-and-pyenv/

;; python.el --- Python package

;;; Code:

(use-package flycheck-pyflakes)

;; The package is "python" but the mode is "python-mode":
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (setq python-indent-offset 4)
  (add-hook 'python-mode-hook 'smartparens-mode)
  (add-hook 'python-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'python-mode-hook 'company-mode)
  (add-hook 'python-mode-hook 'yas-minor-mode)
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'python-mode-hook 'anaconda-mode)

  (require 'flycheck-pyflakes)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-to-list 'flycheck-disabled-checkers 'python-flake8)
  (add-to-list 'flycheck-disabled-checkers 'python-pylint)

  (setq warning-suppress-types '((python)
                                 (emacs)))

  (use-package anaconda-mode
    :bind ("C-c C-d" . anaconda-mode-show-doc)
    :config
    (setq python-shell-interpreter "ipython"))

  (use-package company-anaconda
    :init
    (eval-after-load "company"
      '(add-to-list 'company-backends '(company-anaconda :with company-capf))))

  (use-package highlight-indent-guides
    :config
    (setq highlight-indent-guides-method 'character))

  (use-package jedi
    :init
    (add-to-list 'company-backends 'company-jedi)
    :config
    (use-package company-jedi
      :init
      (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
      (setq company-jedi-python-bin "python")))
  )

(use-package elpy
  :config
  (elpy-enable)
  (electric-indent-local-mode -1)
  (delete 'elpy-module-highlight-indentation elpy-modules)
  (delete 'elpy-module-flymake elpy-modules)

  (defun ha/elpy-goto-definition ()
    (interactive)
    (condition-case err
        (elpy-goto-definition)
      ('error (xref-find-definitions (symbol-name (symbol-at-point))))))

  :bind (:map elpy-mode-map ([remap elpy-goto-definition] .
                             ha/elpy-goto-definition)))

(provide 'python)

;;; python.el ends here
