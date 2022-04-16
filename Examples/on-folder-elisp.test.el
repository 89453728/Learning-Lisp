;;; Test suit for `on-folder-elisp.el'.

;; To run tests cases:
;;
;; 1. Eval both `on-folder-elisp.test.el' and `on-folder-elisp.el'
;; files.
;;
;; 2. M-x ert t

(require 'on-folder-elisp)

(ert-deftest test-on-folder-elisp-hook()
  "Expects to find and eval a Elisp file on a parent
directory."
  (let ((found nil)
        (rootdirectory "/tmp/")
        (subdirectory "/tmp/subdirectory/")
        (file "testing-on-save.el"))
    (unwind-protect
        (progn
          (dired-create-directory subdirectory)
          (copy-file on-folder-elisp-file (concat rootdirectory on-folder-elisp-file))
          (add-hook 'after-save 'on-folder-elisp-hook)
          (with-current-buffer
              (find-file-noselect (concat subdirectory file))
            (run-hooks 'after-save)))
      (remove-hook 'after-save 'on-folder-elisp-hook)
      (delete-file (concat subdirectory file))
      (delete-directory subdirectory)
      (delete-file (concat rootdirectory on-folder-elisp-file)))
    (should (eq found t))))

(ert-deftest test-on-folder-elisp-hook--non-existant-script()
  "Expects to not change variable value if the hook cannot find a
directory script."
  (let ((found nil)
        (rootdirectory "/tmp/")
        (subdirectory "/tmp/subdirectory/")
        (file "testing-on-save.el"))
    (unwind-protect
        (progn
          (dired-create-directory subdirectory)
          ;; (copy-file on-folder-elisp-file (concat rootdirectory on-folder-elisp-file))
          (add-hook 'after-save 'on-folder-elisp-hook)
          (with-current-buffer
              (find-file-noselect (concat subdirectory file))
            (run-hooks 'after-save)))
      (remove-hook 'after-save 'on-folder-elisp-hook)
      (delete-file (concat subdirectory file))
      (delete-directory subdirectory))
    (should (eq found nil))))


(ert-deftest test-on-folder-elisp-hook--nil-script-filename()
  "Expects to not change variable value if the script filename is
nil."
  (let ((found nil)
        (subdirectory "/tmp/subdirectory/")
        (file "testing-on-save.el")
        (on-folder-elisp-file nil))
    (unwind-protect
        (progn
          (dired-create-directory subdirectory)
          (add-hook 'after-save 'on-folder-elisp-hook)
          (with-current-buffer
              (find-file-noselect (concat subdirectory file))
            (run-hooks 'after-save)))
      (remove-hook 'after-save 'on-folder-elisp-hook)
      (delete-file (concat subdirectory file))
      (delete-directory subdirectory))
    (should (eq found nil))))


(ert-deftest test-on-folder-elisp-hook--empty-script-filename()
  "Expects to not change variable value if the script filename is
empty."
  (let ((found nil)
        (subdirectory "/tmp/subdirectory/")
        (file "testing-on-save.el")
        (on-folder-elisp-file ""))
    (unwind-protect
        (progn
          (dired-create-directory subdirectory)
          (add-hook 'after-save 'on-folder-elisp-hook)
          (with-current-buffer
              (find-file-noselect (concat subdirectory file))
            (run-hooks 'after-save)))
      (remove-hook 'after-save 'on-folder-elisp-hook)
      (delete-file (concat subdirectory file))
      (delete-directory subdirectory))
    (should (eq found nil))))
