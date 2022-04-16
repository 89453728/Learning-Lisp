;;; on-folder-elisp.el --- Eval a Elisp file on current or parenting folder

;; Version: 0
;; Homepage: https://github.com/89453728/Learning-Lisp.git


;;; Commentary:
;; On folder elisp.
;;
;; Look for a Elisp file named after `on-folder-elisp-file' variable
;; on current or parent folder and eval the file if it is found.  The
;; inspiration comes from
;; http://www.howardism.org/Technical/Emacs/save-hooks.html by Howard
;; where executes a script on a current directory or a parenting one.
;; So I have just adapted a bit to evaluate a Elisp file.
;;
;; Installation.
;;
;; (add-to-list load-path "path/to/package")
;; (add-hook 'after-save-hook 'on-folder-elisp-hook)
;;
;; Create a .el file named after `on-folder-elisp-file' custom
;; variable and add to it what you want to eval on hook evaluation.

;;; Code:

(defcustom on-folder-elisp-file ".on-folder-elisp-script.el"
  "A Elisp file that is seek to be evaluated.")

(defun on-folder-elisp-hook ()
  "Hook that look for a Elisp file on current or parent folders and
evaluates it."
  (if (and
       (boundp 'on-folder-elisp-file)
       on-folder-elisp-file
       (not (equal "" on-folder-elisp-file)))
      (let ((script-folder (locate-dominating-file
                            (buffer-file-name) on-folder-elisp-file)))
        (when (file-exists-p (concat script-folder on-folder-elisp-file))
          (load-file (concat script-folder on-folder-elisp-file))))))

(provide 'on-folder-elisp)

;;; on-folder-elisp.el ends here
