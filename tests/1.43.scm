; exec 1.43

(define (square x) (* x x))

(define (repeated f n)
  (lambda (x) 
    (define (rep-it k result)
      (if  (> k n) result (rep-it (+ k 1) (f result)))
      )
    (rep-it 1 x)
    )
  )

(display
  ((repeated square 2) 5)
  )
(newline)

(load "1.42.scm")

(define (repeated f n)
  (if (= n 1) f (compose f (repeated f (- n 1)))
    )
  )

(display
  ((repeated square 2) 5)
  )
(newline)
