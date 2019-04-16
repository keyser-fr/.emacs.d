;;; setup-undo-tree --- Summary

;;; Commentary:

;; setup-undo-tree.el --- Setup Undo-Tree package

;;; Code:

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(provide 'setup-undo-tree)

;;; setup-undo-tree.el ends here
