; exec 2.2

(load "tool.scm")

(define (make-segment start end)
  (cons start end)
  )

(define (start-segment x) (car x))
(define (end-segment x)   (cdr x))

(define (make-point x y)
  (cons x y)
  )

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint-segment seg)
  (make-point 
    (average (x-point (start-segment seg)) (x-point (end-segment seg)))
    (average (y-point (start-segment seg)) (y-point (end-segment seg)))
    )
  )

(define (print-point p)
  (display "(") (display (x-point p)) (display ",")(display (y-point p))(display ")")(newline)
  )

(display "exec 2.2")(newline)(display "==================================")(newline)
(print-point (midpoint-segment (make-segment (make-point 10 20) (make-point 15 33))))
(display "==================================")(newline)(newline)

