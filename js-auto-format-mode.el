;;; js-auto-format-mode.el --- Minor mode for auto-formatting JavaScript code  -*- lexical-binding: t; -*-

;; Copyright (C) 2017 ybiquitous <ybiquitous@gmail.com>

;; Author:  ybiquitous <ybiquitous@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "24"))
;; Keywords: languages, tools, javascript
;; URL: https://github.com/ybiquitous/js-auto-format-mode
;; Created: Apr 2016
;; License: GNU General Public License v3.0
;; Distribution: This file is not part of Emacs

;;; Commentary:

;; Please see `https://github.com/ybiquitous/js-auto-format-mode'.

;;; Code:

;;;###autoload
(defcustom js-auto-format-command "eslint"
  "JavaScript auto format command."
  :group 'js-auto-format
  :type 'string
  :safe #'stringp)

;;;###autoload
(defcustom js-auto-format-command-args "--fix --format=unix"
  "JavaScript auto format command arguments."
  :group 'js-auto-format
  :type 'string
  :safe #'stringp)

;;;###autoload
(defcustom js-auto-format-disabled nil
  "JavaScript auto format disabled."
  :group 'js-auto-format
  :type 'boolean
  :safe #'booleanp)

(defun js-auto-format-command-dir ()
  "Find directory in which command exists."
  (let* ((root (locate-dominating-file default-directory "node_modules"))
         (local-path (expand-file-name "node_modules/.bin" root)))
    (if (file-directory-p local-path)
        (expand-file-name "node_modules/.bin" root))))

(defun js-auto-format-command-path ()
  "Find command path."
  (let* ((command-path (expand-file-name js-auto-format-command (js-auto-format-command-dir))))
    (if (file-exists-p command-path) command-path js-auto-format-command)))

(defun js-auto-format-full-command ()
  "Return full command with all arguments."
  (format "\"%s\" %s \"%s\""
    (js-auto-format-command-path)
    js-auto-format-command-args
    (expand-file-name buffer-file-name)))

(defvar js-auto-format-buffer "*JS Auto Format*")

(defun js-auto-format-kill-buffer ()
  "Kill command output buffer if command succeeds."
  (when (= 0 (buffer-size (get-buffer js-auto-format-buffer)))
    (delete-windows-on js-auto-format-buffer)
    (kill-buffer js-auto-format-buffer)))

;;;###autoload
(defun js-auto-format-execute ()
  "Format JavaScript source code."
  (interactive)
  (unless js-auto-format-disabled
    (let* ((command (js-auto-format-full-command)))
      (message "js-auto-format-execute: %s" command)
      (shell-command command js-auto-format-buffer)
      (revert-buffer t t t)
      (js-auto-format-kill-buffer))))

;;;###autoload
(define-minor-mode js-auto-format-mode
  "Minor mode for auto-formatting JavaScript code"
  :init-value nil
  :lighter " AutoFmt"
  (if js-auto-format-mode
      (add-hook 'after-save-hook 'js-auto-format-execute t t)
    (remove-hook 'after-save-hook 'js-auto-format-execute t)))

(provide 'js-auto-format-mode)
;;; js-auto-format-mode.el ends here
