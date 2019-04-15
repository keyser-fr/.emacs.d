;;; markdown-mode --- Summary

;;; Commentary:

;; markdown-mode.el --- Markdown-Mode package

;;; Code:

(use-package markdown-mode
  :commands (markdown-mode)
  :config
  (unless window-system
    ;; `C-t' confilict to tmux's escape key, so avoid it
    (bind-key "C-c t 0" 'markdown-remove-header markdown-mode-map)
    (bind-key "C-c t 1" 'markdown-insert-header-atx-1 markdown-mode-map)
    (bind-key "C-c t 2" 'markdown-insert-header-atx-2 markdown-mode-map)
    (bind-key "C-c t 3" 'markdown-insert-header-atx-3 markdown-mode-map)
    (bind-key "C-c t 4" 'markdown-insert-header-atx-4 markdown-mode-map)
    (bind-key "C-c t 5" 'markdown-insert-header-atx-5 markdown-mode-map)
    (bind-key "C-c t 6" 'markdown-insert-header-atx-6 markdown-mode-map)
    (bind-key "C-c t h" 'markdown-insert-header-dwim markdown-mode-map)
    (bind-key "C-c t s" 'markdown-insert-header-setext-2 markdown-mode-map)
    (bind-key "C-c t t" 'markdown-insert-header-setext-1 markdown-mode-map))
  :mode
  (("\\.markdown$" . markdown-mode)
   ("\\.md$" . markdown-mode))
  )

(provide 'markdown-mode)

;;; markdown-mode.el ends here
