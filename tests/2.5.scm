; exec 2.5

(define  (deep-div x y)
  (define (iter x y n) 
  (if (= (gcd x y) 1)
    n
    (iter (/ x y) y (+ n 1))
    ))
  (iter x y 0)
  )

(define (cons x y) (* (expt 2 x) (expt 3 y)))
(define (car z) (deep-div z 2))
(define (cdr z) (deep-div z 3))

(display "Car: ")(display (car (cons 11 12))) (newline)
(display "Cdr: ")(display (cdr (cons 11 12))) (newline)
