; exec 1.42

(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (compose f1 f2)
  (lambda (x) (f1 (f2 x)))
  )

(display
  ((compose square inc) 6)
  )
(newline)
