; exec 1.39

(define (cont-frac n x k)
  (let ((x2 (square x)))
    (define (cont-iter i)
      (if (> i k)
        0
        (/ x2 (- (n i) (cont-iter (+ i 1))))
        )
      )
    (cont-iter 1)
    )
  )

(define (tan-cf x k)
  (/ (cont-frac (lambda (i) (+ 1 (* 2 (- i 1)))) x k) x)
  )

(define (dotest x k)
    (display "x = ") (display x) 
    (display " k = ") (display k) (display ": ") 
    (display 
      (tan-cf x k)
      )
    (newline)
  )

(define pi 3.1415926)

(dotest (/ pi 4) 10)
(dotest (/ pi 3) 10)

