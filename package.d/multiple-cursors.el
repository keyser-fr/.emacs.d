;;; multiple-cursors --- Summary

;;; Commentary:

;; multiple-cursors.el --- Multiple-Cursors package

;;; Code:

(use-package multiple-cursors
  :init
  (progn
    ;; these need to be defined here - if they're lazily loaded with
    ;; :bind they don't work.
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "M->") 'mc/unmark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "M-<") 'mc/unmark-previous-like-this)
    (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)))

(provide 'multiple-cursors)

;;; multiple-cursors.el ends here
