;;; setup-eshell --- Summary

;;; Commentary:

;; setup-eshell.el --- Custom configuration

;; Source : https://github.com/howardabrams/dot-files/blob/master/emacs-eshell.org

;;; Code:

;; Set up the Correct Path
(setenv "PATH"
        (concat
         "/usr/local/bin:/usr/local/sbin:"
         (getenv "PATH")))

;; Pager Setup
(setenv "PAGER" "cat")

;; Navigation and Keys
;; Eshell comes with some interesting features:
;; * M-RET can be used to accumulate further commands while a command is currently running. Since all input is passed to the subprocess being executed, there is no automatic input queueing as there is with other shells.
;; * C-c C-t can be used to truncate the buffer if it grows too large.
;; * C-c C-r will move point to the beginning of the output of the last command. With a prefix argument, it will narrow to view only that output.
;; * C-c C-o will delete the output from the last command.
;; * C-c C-f will move forward a complete shell argument.
;; * C-c C-b will move backward a complete shell argument.

;; Configuration
(use-package eshell
  :init
  (setq eshell-buffer-shorthand t ;; ...  Can't see Bug#19391
	eshell-scroll-to-bottom-on-input 'all
	eshell-error-if-no-glob t
	eshell-hist-ignoredups t
	eshell-save-history-on-exit t
	eshell-prefer-lisp-functions nil
	eshell-destroy-buffer-when-process-dies t)
  ;; Visual Executables
  (add-hook 'eshell-mode-hook
	    (lambda ()
	      (add-to-list 'eshell-visual-commands "ssh")
	      (add-to-list 'eshell-visual-commands "tail")
	      (add-to-list 'eshell-visual-commands "top")))
  ;; Aliases
  (add-hook 'eshell-mode-hook
	    (lambda ()
	      (eshell/alias "e" "find-file $1")
	      (eshell/alias "emacs" "find-file $1")
	      (eshell/alias "ee" "find-file-other-window $1")
	      (eshell/alias "ff" "find-file $1")
	      (eshell/alias "fw" "find-file-other-window $1")
	      (eshell/alias "fr" "find-file-other-frame $1")
	      (eshell/alias "gd" "magit-diff-unstaged")
	      (eshell/alias "gds" "magit-diff-staged")
	      (eshell/alias "d" "dired $1")

	      ;; The 'ls' executable requires the Gnu version on the Mac
	      (let ((ls (if (file-exists-p "/usr/local/bin/gls")
			    "/usr/local/bin/gls"
			  "/bin/ls")))
		(eshell/alias "ll" (concat ls " -AlohG --color=always"))
		))))

;; Git
(defun eshell/gst (&rest args)
    (magit-status (pop args) nil)
    (eshell/echo))   ;; The echo command suppresses output

;; Find File
(defun eshell/f (filename &optional dir try-count)
  "Searches for files matching FILENAME in either DIR or the
current directory. Just a typical wrapper around the standard
`find' executable.

Since any wildcards in FILENAME need to be escaped, this wraps the shell command.

If not results were found, it calls the `find' executable up to
two more times, wrapping the FILENAME pattern in wildcat
matches. This seems to be more helpful to me."
  (let* ((cmd (concat
               (executable-find "find")
               " " (or dir ".")
               "      -not -path '*/.git*'"
               " -and -not -path '*node_modules*'"
               " -and -not -path '*classes*'"
               " -and "
               " -type f -and "
               "-iname '" filename "'"))
         (results (shell-command-to-string cmd)))

    (if (not (s-blank-str? results))
        results
      (cond
       ((or (null try-count) (= 0 try-count))
        (eshell/f (concat filename "*") dir 1))
       ((or (null try-count) (= 1 try-count))
        (eshell/f (concat "*" filename) dir 2))
       (t "")))))

(defun eshell/ef (filename &optional dir)
  "Searches for the first matching filename and loads it into a
file to edit."
  (let* ((files (eshell/f filename dir))
         (file (car (s-split "\n" files))))
    (find-file file)))

(defun eshell/find (&rest args)
  "Wrapper around the ‘find’ executable."
  (let ((cmd (concat "find " (string-join args))))
    (shell-command-to-string cmd)))

;; Clear
(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

;; Predicate Filters and Modifiers
(defun eshell-org-file-tags ()
  "Helps the eshell parse the text the point is currently on,
looking for parameters surrounded in single quotes. Returns a
function that takes a FILE and returns nil if the file given to
it doesn't contain the org-mode #+TAGS: entry specified."

  (if (looking-at "'\\([^)']+\\)'")
      (let* ((tag (match-string 1))
             (reg (concat "^#\\+TAGS:.* " tag "\\b")))
        (goto-char (match-end 0))

        `(lambda (file)
           (with-temp-buffer
             (insert-file-contents file)
             (re-search-forward ,reg nil t 1))))
    (error "The `T' predicate takes an org-mode tag value in single quotes.")))

(add-hook 'eshell-pred-load-hook
	  (lambda ()
	    (add-to-list 'eshell-predicate-alist '(?T . (eshell-org-file-tags)))))

;; Special Prompt
(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (not (file-remote-p pwd))
             (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let* ((git-url (shell-command-to-string "git config --get remote.origin.url"))
           (git-repo (file-name-base (s-trim git-url)))
           (git-output (shell-command-to-string (concat "git rev-parse --abbrev-ref HEAD")))
           (git-branch (s-trim git-output))
           (git-icon  "\xe0a0")
           (git-icon2 (propertize "\xf020" 'face `(:family "octicons"))))
      (concat git-repo " " git-icon2 " " git-branch))))

(defun pwd-replace-home (pwd)
  "Replace home in PWD with tilde (~) character."
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and
         (>= (length pwd) home-len)
         (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      pwd)))

(defun pwd-shorten-dirs (pwd)
  "Shorten all directory names in PWD except the last two."
  (let ((p-lst (split-string pwd "/")))
    (if (> (length p-lst) 2)
        (concat
         (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                               (substring elm 0 1)))
                    (butlast p-lst 2)
                    "/")
         "/"
         (mapconcat (lambda (elm) elm)
                    (last p-lst 2)
                    "/"))
      pwd)))  ;; Otherwise, we just return the PWD

(defun split-directory-prompt (directory)
  (if (string-match-p ".*/.*" directory)
      (list (file-name-directory directory) (file-name-base directory))
    (list "" directory)))

(defun ruby-prompt ()
  "Returns a string (may be empty) based on the current Ruby Virtual Environment."
  (let* ((executable "~/.rvm/bin/rvm-prompt")
         (command    (concat executable "v g")))
    (when (file-exists-p executable)
      (let* ((results (shell-command-to-string executable))
             (cleaned (string-trim results))
             (gem     (propertize "\xe92b" 'face `(:family "alltheicons"))))
        (when (and cleaned (not (equal cleaned "")))
          (s-replace "ruby-" gem cleaned))))))

(defun python-prompt ()
  "Returns a string (may be empty) based on the current Python
   Virtual Environment. Assuming the M-x command: `pyenv-mode-set'
   has been called."
  (when (fboundp #'pyenv-mode-version)
    (let ((venv (pyenv-mode-version)))
      (when venv
        (concat
         (propertize "\xe928" 'face `(:family "alltheicons"))
         (pyenv-mode-version))))))

(defun eshell/eshell-local-prompt-function ()
  "A prompt for eshell that works locally (in that is assumes
that it could run certain commands) in order to make a prettier,
more-helpful local prompt."
  (interactive)
  (let* ((pwd        (eshell/pwd))
         ;; (directory (split-directory-prompt
         ;;             (pwd-shorten-dirs
         ;;              (pwd-replace-home pwd))))
         (directory (split-directory-prompt
		     (pwd-replace-home pwd)))
         (parent (car directory))
         (name   (cadr directory))
         (branch (curr-dir-git-branch-string pwd))
         (ruby   (when (not (file-remote-p pwd)) (ruby-prompt)))
         (python (when (not (file-remote-p pwd)) (python-prompt)))

         (dark-env   (eq 'dark (frame-parameter nil 'background-mode)))
         (for-bars                `(:weight ultra-bold))
         (for-parent (if dark-env `(:foreground "dark orange") `(:foreground "blue")))
	 (for-dir    (if dark-env `(:foreground "orange" :weight bold) `(:foreground "blue" :weight bold)))
         (for-git                 `(:foreground "green"))
         (for-ruby                `(:foreground "red"))
         (for-python              `(:foreground "#5555FF")))

    ;; http://ergoemacs.org/emacs/emacs_n_unicode.html
    (concat
     ;; (propertize "⟣─ "  'face for-bars)
     (propertize "┌ "   'face for-bars)
     (propertize parent 'face for-parent)
     (propertize name   'face for-dir)
     (when branch
       (concat (propertize " ── " 'face for-bars)
               (propertize branch 'face for-git)))
     (when ruby
       (concat (propertize " ── " 'face for-bars)
               (propertize ruby   'face for-ruby)))
     (when python
       (concat (propertize " ── " 'face for-bars)
               (propertize python 'face for-python)))
     (propertize "\n" 'face for-bars)
     (propertize "↳ " 'face (if (= (user-uid) 0) `(:weight ultra-bold :foreground "red") `(:weight ultra-bold)))
     (propertize (if (= (user-uid) 0) "#" "$") 'face `(:weight ultra-bold))
     (propertize " "  'face `(:weight bold))
     )))

(setq-default eshell-prompt-function #'eshell/eshell-local-prompt-function)

(setq eshell-highlight-prompt nil)

;; Shell Here
;; (defun eshell-here ()
;;   "Opens up a new shell in the directory associated with the
;; current buffer's file. The eshell is renamed to match that
;; directory to make multiple eshell windows easier."
;;   (interactive)
;;   (let* ((parent (if (buffer-file-name)
;;                      (file-name-directory (buffer-file-name))
;;                    default-directory))
;;          (height (/ (window-total-height) 3))
;;          (name   (car (last (split-string parent "/" t)))))
;;     (split-window-vertically (- height))
;;     (other-window 1)
;;     (eshell "new")
;;     (rename-buffer (concat "*eshell: " name "*"))

;;     (insert (concat "ls"))
;;     (eshell-send-input)))

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
    current buffer's file. The eshell is renamed to match that
    directory to make multiple eshell windows easier."
  (interactive)
  (let* ((height (/ (window-total-height) 3)))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (insert (concat "ls"))
    (eshell-send-input)))

(bind-key "C-!" 'eshell-here)

(use-package eshell
  :config
  (defun ha/eshell-quit-or-delete-char (arg)
    (interactive "p")
    (if (and (eolp) (looking-back eshell-prompt-regexp))
        (progn
          (eshell-life-is-too-much) ; Why not? (eshell/exit)
          (ignore-errors
            (delete-window)))
      (delete-forward-char arg)))
  :init
  (add-hook 'eshell-mode-hook
            (lambda ()
              (bind-keys :map eshell-mode-map
                         ("C-d" . ha/eshell-quit-or-delete-char)))))

;; Shell There
(defun eshell-there (host)
  "Creates an eshell session that uses Tramp to automatically
connect to a remote system, HOST.  The hostname can be either the
IP address, or FQDN, and can specify the user account, as in
root@blah.com. HOST can also be a complete Tramp reference."
  (interactive "sHost: ")

  (let* ((default-directory
           (cond
            ((string-match-p "^/" host) host)

            ((string-match-p (ha/eshell-host-regexp 'full) host)
             (string-match (ha/eshell-host-regexp 'full) host) ;; Why!?
             (let* ((user1 (match-string 2 host))
                    (host1 (match-string 3 host))
                    (user2 (match-string 6 host))
                    (host2 (match-string 7 host)))
               (if host1
                   (ha/eshell-host->tramp user1 host1)
                 (ha/eshell-host->tramp user2 host2))))

            (t (format "/%s:" host)))))
    (eshell-here)))

;; Shell Here to There
(defun ha/eshell-host-regexp (regexp)
  "Returns a particular regular expression based on symbol, REGEXP"
  (let* ((user-regexp      "\\(\\([[:alpha:].]+\\)@\\)?")
         (tramp-regexp     "\\b/ssh:[:graph:]+")
         (ip-char          "[[:digit:]]")
         (ip-plus-period   (concat ip-char "+" "\\."))
         (ip-regexp        (concat "\\(\\(" ip-plus-period "\\)\\{3\\}" ip-char "+\\)"))
         (host-char        "[[:alpha:][:digit:]-]")
         (host-plus-period (concat host-char "+" "\\."))
         (host-regexp      (concat "\\(\\(" host-plus-period "\\)+" host-char "+\\)"))
         (horrific-regexp  (concat "\\b"
                                   user-regexp ip-regexp
                                   "\\|"
                                   user-regexp host-regexp
                                   "\\b")))
    (cond
     ((eq regexp 'tramp) tramp-regexp)
     ((eq regexp 'host)  host-regexp)
     ((eq regexp 'full)  horrific-regexp))))

(defun ha/eshell-scan-for-hostnames ()
  "Helper function to scan the current line for any hostnames, IP
or Tramp references.  This returns a tuple of the username (if
found) and the hostname.

If a Tramp reference is found, the username part of the tuple
will be `nil'."
  (save-excursion
    (goto-char (line-beginning-position))
    (if (search-forward-regexp (ha/eshell-host-regexp 'tramp) (line-end-position) t)
        (cons nil (buffer-substring-no-properties (match-beginning 0) (match-end 0)))

      ;; Returns the text associated with match expression, NUM or `nil' if no match was found.
      (cl-flet ((ha/eshell-get-expression (num) (if-let ((first (match-beginning num))
                                                         (end   (match-end num)))
                                                    (buffer-substring-no-properties first end))))

        (search-forward-regexp (ha/eshell-host-regexp 'full) (line-end-position))

        ;; Until this is completely robust, let's keep this debugging code here:
        ;; (message (mapconcat (lambda (tup) (if-let ((s (car tup))
        ;;                                       (e (cadr tup)))
        ;;                                  (buffer-substring-no-properties s e)
        ;;                                "null"))
        ;;             (-partition 2 (match-data t)) " -- "))

        (let ((user1 (ha/eshell-get-expression 2))
              (host1 (ha/eshell-get-expression 3))
              (user2 (ha/eshell-get-expression 6))
              (host2 (ha/eshell-get-expression 7)))
          (if host1
              (cons user1 host1)
            (cons user2 host2)))))))

(defun ha/eshell-host->tramp (username hostname &optional prefer-root)
  "Returns a TRAMP reference based on a USERNAME and HOSTNAME
that refers to any host or IP address."
  (cond ((string-match-p "^/" host)
           host)
        ((or (and prefer-root (not username)) (equal username "root"))
           (format "/ssh:%s|sudo:%s:" hostname hostname))
        ((or (null username) (equal username user-login-name))
           (format "/ssh:%s:" hostname))
        (t
           (format "/ssh:%s|sudo:%s|sudo@%s:%s:" hostname hostname username hostname))))

(defun eshell-here-on-line (p)
  "Search the current line for an IP address or hostname, and call the `eshell-here' function.

Call with PREFIX to connect with the `root' useraccount, via
`sudo'."
  (interactive "p")
  (destructuring-bind (user host) (ha/eshell-scan-for-hostnames)
    (let ((default-directory (ha/eshell-host->tramp user host (> p 1))))
      (message "Connecting to: %s" default-directory)
      ;; With the `default-directory' set to a Tramp reference, rock on!
      (eshell-here))))

(bind-key "M-s-1" #'eshell-here-on-line)

(provide 'setup-eshell)

;;; setup-eshell.el ends here
