; exec 1.38

(load "1.37.scm")

(define (calc-d n)
  (if (= (remainder n 3) 2)
    (* 2 
       (/ (+ n 
             (- 3 (remainder n 3))
             )
          3)
       )
    1.0
    )
  )

(define (dotest k)
  (let ((phy (/ (+ (sqrt 5) 1) 2)))
    (display "k = ") (display k) (display ": ") 
    (display (cont-frac (lambda (i) 1.0) calc-d k))
    (newline)
    )
  )

(display "calculate e - 2:")(newline)
(dotest 5)
(dotest 8)
(dotest 9)
(dotest 10)
(dotest 12)
(dotest 15)
(dotest 18)
(dotest 20)
(dotest 40)

