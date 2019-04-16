;;; reload_init-file --- Summary

;;; Commentary:

;; reload_init-file.el --- Package configuration

;;; Code:

;; reload emacs configuration
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c <f5>") 'reload-init-file)

(provide 'reload_init-file)

;;; reload_init-file.el ends here
