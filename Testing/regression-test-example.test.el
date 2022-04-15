;;; Test suit for `regression-test-example' package

;; In order to use it you must eval the package to test and then the
;; test.
;;
;; Once evaluated both files use `M-x ert t' to run Emacs Regression
;; Test suit.

(require 'ert)
(require 'regression-test-example)

(ert-deftest regression-test-example--sum()
  (should (eq (regression-test-example--sum 3 4) 7)))
