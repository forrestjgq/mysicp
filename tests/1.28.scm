; exec 1.28 Miller-Rabin test

(load "tool.scm")

(define (expmod base exp m)
  (cond
    ((= exp 0) 1)
    ((and (= (+ exp 1) m) (= (remainder (square base) m) 1)) 0)
    ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))
    )
  )


(define (miller-test n times)
  (define (try-it a) (= (expmod a (- n 1) n) 1))
  (cond 
    ((= times 0) true)
    ((not (try-it (+ 1 (random (- n 1))))) false)
    (else (miller-test n (- times 1)))
    )
  )

(define (dotest n times)
  (display n)
  (if (miller-test n times)
    (display " is prime")
    (display " is not prime")
    )
  (newline)
  )

(dotest 561 100)
(dotest 1105 100)
(dotest 1729 100)
(dotest 2465 100)
(dotest 2821 100)
(dotest 6601 100)

(dotest 100003 100)
(dotest 10007 100)
