;; * file: scratch-testing-14042022.el
;; * description: The prupose of this file is to
;;   test some elisp features
;; * date: 15 of April of 2022 at 3:26

;; simple addition
(defun sum (a b)
(+ a b))

(message "%d" (sum 10 12))
(message "%f" (sum 1.22 -.65))

;; testing the conditionals
(defun comparation (a b)
	(if (> a b) (message "a es mayor que b") (message "b es mayor o igual que a")))

(comparation 3 4)


;; testing the scopes
(let ((h 0))
(defun equal (a b)
	(if (= a b) (message "a es igual a b") (message "son distintos")))

(equal 1 2)
(equal 3 3))


;; value asignation to global variables
(setq a 11.22)
(setq c a)
(message "%.2f" c)

;; passing function as parameter
(f1 #'hola "hola")
(setq a (let ((a 1) (b 2) (c 3))
      (list a b c)
      ))
(defun hola (m) (message m))

;; bisection numeric method
(defun biseccion(f a b &optional N)
  (let ((c (/ (+ a b) 2)) (i 0))
    (if (not (boundp 'N)) (setq N 10))
    (while (> N i)
      (if (> (* (funcall f c) (funcall f a)) 0) (setq a c)
	(if (> (* (funcall f c) (funcall f b)) 0) (setq b c) c)) (+ i 1)) c ) )

(defun f1 (f a) (funcall f a))

(biseccion #'f 0 2 10)

;; lists
(setq b (car a))
(message "%d" b)
(setq b (+ b 1))

(defun f (x) (- (* 2 (* x x)) 3.5))

(f 3)


