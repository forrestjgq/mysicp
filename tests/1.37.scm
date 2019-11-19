; exec 1.37

(define (cont-frac n d k)
  (define (cont-iter n d k i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (cont-iter n d k (+ i 1)))))
    )
  (cont-iter n d k 1)
  )

(define (dotest k)
  (let ((phy (/ (+ (sqrt 5) 1) 2)))
    (display "k = ") (display k) (display ": ") 
    (display 
      (- phy (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))
      )
    (newline)
    )
  )

(dotest 5)
(dotest 8)
(dotest 9)
(dotest 10)
(dotest 12)
(dotest 15)
(dotest 18)
(dotest 20)
(dotest 40)

(newline)

(define (cont-frac n d k)
  (define (cont-iter n d k i result)
    (if (= i 0)
      result
      (cont-iter n d k (- i 1) 
                 (/ (n i) (+ (d i) result))
                 )
      )
    )
  (cont-iter n d k k 0)
  )

(dotest 5)
(dotest 8)
(dotest 9)
(dotest 10)
(dotest 12)
(dotest 15)
(dotest 18)
(dotest 20)
(dotest 40)

(newline)

