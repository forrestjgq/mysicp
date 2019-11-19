; check if a number is a prime
(load "tool.scm")

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n n))
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))
        )
  )

(define (prime? n)
  (= n (smallest-divisor n)))

(load "fermat.scm")

(define (fast-prime? n times)
  (cond
    ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)
    )
  )
