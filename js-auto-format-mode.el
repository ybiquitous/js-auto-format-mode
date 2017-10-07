;;; js-auto-format-mode.el --- Minor mode for auto-formatting JavaScript code  -*- lexical-binding: t; -*-

;; Copyright (C) 2017 ybiquitous <ybiquitous@gmail.com>

;; Author:  ybiquitous <ybiquitous@gmail.com>
;; Version: 0.0.7
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
(defcustom js-auto-format-command-args "--fix"
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
  (let* ((root (locate-dominating-file default-directory "node_modules"))
         (local-path (expand-file-name "node_modules/.bin" root)))
    (if (file-directory-p local-path)
        (expand-file-name "node_modules/.bin" root))))

(defun js-auto-format-command-path ()
  (let* ((command-path (expand-file-name js-auto-format-command (js-auto-format-command-dir))))
    (if (file-exists-p command-path) command-path js-auto-format-command)))

;;;###autoload
(defun js-auto-format-execute ()
  "Format JavaScript source code."
  (interactive)
  (unless js-auto-format-disabled
    (progn
      (let* ((command (format "\"%s\" %s \"%s\""
                              (js-auto-format-command-path)
                              js-auto-format-command-args
                              (expand-file-name buffer-file-name))))
        (message "js-auto-format-execute: %s" command)
        (shell-command command nil "*Messages*")
        (revert-buffer t t)
        (js-auto-format-mode t)))))

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
