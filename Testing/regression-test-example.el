;;; regression-test-example.el --- Tests package for documenting ERT

;; Version: 0
;; Homepage: https://github.com/89453728/Learning-Lisp.git

;;; Commentary:
;; Test package for documenting how to make regression tests with ERT (Emacs Regression Test)

;;; Code:

(defun regression-test-example--sum (arg1 arg2)
  "Simple function to sum 2 numbers."
  (+ arg1 arg2))

(provide 'regression-test-example)

;;; regression-test-example.el ends here
