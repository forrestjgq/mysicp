;exec 2.48

(load "2.46.scm")

(define (make-segment v1 v2)
  (cons v1 v2)
 )

(define (start-segment segment)
 (car segment)
  )
(define (end-segment segment)
 (cdr segment)
  )


