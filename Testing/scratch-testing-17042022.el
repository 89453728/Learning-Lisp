;; * file: scratch-testing-17042022.el
;; * description: The prupose of this file is to
;;   test some elisp features
;; * date: 17 of April of 2022 at 11:58


(+ 2 2)
(number-to-string (+ 2 fill-column))

(string-to-number "3.4")
(setq a 1)
(if (= a 1) (message "is 1") (if (= a 2) (message "is 2") (message "is 3 or other")))

(format (concat "hola " "%d")  4)

;; mirando los tipos
(type-of (type-of "hola"))
(type-of "hola")
(type-of a)
(type-of 2.33)
(type-of '(a b c))
(defun regresion-function (x) (+ x x))
(type-of 'regresion-function)
(type-of t)
(type-of nil)

;; suma de multiples valores
(+ 1.22 3.4 -0.33)

(setq l '(regresion-function))
(funcall (car l) 2)

(message "the buffer name is %s" (buffer-name))

(message "this buffer %s is in the file %s" (buffer-name) (buffer-file-name))
(message "type of 'hola' is %s" (type-of "hola"))


(format "%s" (type-of "hola"))

(if (string= (format "%s" (type-of "hola")) "string" ) (message "is string") (message "is not a string"))

;; tamano en bytes del buffer
(buffer-size)


(defun diff (f x &optional h)
  (when (not h) (setq h 0.0001))
  (/ (- (funcall f (+ x h)) (funcall f x)) h))

(defun f (x) (* x x))

(diff #'f 2)

(defun temporal ()
  (let ((vble-temp 1))
    (setq vble-temp 2)))
(temporal)

(defun exit-on-error (a)
  (when (< a 0) (return nil))
  (let ((h 0))
    (setq h 10)))
(exit-on-error 3)

(defun newton (f &optional N &optional seed)
  (or N (setq N 10))
  (or seed (setq seed 0))
  (when (< N 0) (error "N must be greater than 0"))
  (let ((xn seed) (counter 0))
    (while (< counter N)
      (setq xn (- xn (/ (funcall f xn) (diff #'f xn))))
      (setq counter (+ counter 1)))
    (return xn)))

(defun functionx (x) (- (* x x) 2.46))
(setq r 10)
(when (> r 3) (message "r is greater than 3"))


;; esta funcion hay que retocarla
(newton #'f 10 0.4)

