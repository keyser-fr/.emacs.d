;;; undo-tree --- Summary

;;; Commentary:

;; undo-tree.el --- Undo-Tree package

;;; Code:

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(provide 'undo-tree)

;;; undo-tree.el ends here
