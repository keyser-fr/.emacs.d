;;; key-binding --- Summary

;;; Commentary:

;; key-binding.el --- Custom configuration

;; https://www.emacswiki.org/emacs/WindowResize

;;; Code:

;; Resize window
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(provide 'key-binding)

;;; key-binding.el ends here
