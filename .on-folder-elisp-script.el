;; Elisp on folder.

;; Add the package `on-folder-elisp' and set your `after-save-hook' to
;; execute this file on any on-save event of any file on this folder
;; and subfolders.

(message "Executing Elisp on folder.")
(shell-command "sh update_index.sh")
