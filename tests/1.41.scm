; exec 1.41

(define (inc x) (+ x 1))

(define (double f)
  (lambda (x) (f (f x)))
  )

(display (((double (double double)) inc) 5))
(newline)
