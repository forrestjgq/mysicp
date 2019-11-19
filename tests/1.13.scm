(define (fib n) 
(fib-i 1 0 n)
)

(define (fib-i a b n)
  (if (= n 0)
    b
    (fib-i (+ a b) a (- n 1)))
  )

(define sq (sqrt 5.0))
(define theta (/ (+ 1 sq) 2))
(define gamma (/ (- 1 sq) 2))

(fib 5)
(display sq)
(display theta)
(display gamma)

(define (calc n)
  (/ (- (expt theta n) (expt gamma n)) sq)
  )

; check n-th fib = (theta^n - gamma ^ n)/sq
(define (check n)
  (= (calc n) (fib n))
  )

(check 19)

(fib 100)
