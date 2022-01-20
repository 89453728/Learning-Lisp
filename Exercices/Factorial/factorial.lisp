; function to get factorial number
; the number must be bigger than 0 or 0

(defun factorial (x) 
        (if (= 0 x) 1 (* x (factorial (- x 1) )))
)

(format t "~d~%" (factorial 4))
(format t "~d~%" (factorial 5))
(format t "~d~%" (factorial 6))
(format t "~d~%" (factorial 7))
(format t "~d~%" (factorial 8))
(format t "~d~%" (factorial 9))
(format t "~d~%" (factorial 10))
