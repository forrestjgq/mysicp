
(define (fexpt-i result b n)
  (if (= n 0) result (fexpt-i (* result b) b (- n 1))))

(define (even n) (= (remainder n 2) 0))

(define (fexpt b n)
  (cond 
    ((even n) (fexpt-i 1 (* b b) (/ n 2)))
    (else (fexpt-i b (* b b) (/ (- n 1) 2)))
    ))

(fexpt 903 29)
