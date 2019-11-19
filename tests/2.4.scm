; exec 2.4

(define (cons x y)
  (lambda (m) (m x y)) 
  )
(define (car z)
  (z (lambda (p q) p))
  )

(define (cdr z)
  (z (lambda (p q) q))
  )

(display (car (cons 10 9)))(newline)
(display (cdr (cons 10 9)))(newline)
