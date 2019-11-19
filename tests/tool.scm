; common tools 

; check a % b == 0
(define (divides? a b)
  (= (remainder a b) 0)
  )
  
(define (even? n) (= (remainder n 2) 0))


(define (fast-expt base n)
  (cond
    ((= n 0) 1)
    ((even? n) (square (fast-expt base (/ n 2))))
    (else (* base (fast-expt base (- n 1))))
    )
  )

(define (average a b)(/ (+ a b) 2))
