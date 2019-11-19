; sicp exec 1.22
(load "prime.scm")

(newline) (display ">>>>>> Now starts 1.22") (newline)

; to verify 1.21
(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)

(define (timed-prime-test n)
  (start-prime-test n (runtime))
  )

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime n (- (runtime) start-time))
  )
  )

(define (report-prime n elapsed-time)
  (newline) 
  (display n)
  (display " *** ")
  (display elapsed-time)
  )

(timed-prime-test 199)
(timed-prime-test 1999)
(timed-prime-test 19999)

(define (search-for-prime start end)
  (search-odd-even 
    (if (even? start) (+ start 1) start)
    (if (even? end) end (+ end 1))
    )
  )
(define (search-odd-even start end)
  (timed-prime-test start)
  (if (< start end) 
     (search-odd-even (+ start 2) end)
    )
  )

(define (dotest)
  (search-for-prime  1000 1010) ; 1009, time 0
  (search-for-prime  10000 10010) ; 10007, time 0.01
  (search-for-prime  100000 100010) ; 100003, time 0.06
  (search-for-prime  1000000 1000010) ; 1000003, time 0.6
  (search-for-prime  10000000 10000020) ; 10000019, time 5.92
  (search-for-prime  100000000 100000010) ; 10000007, time 58.9
  (newline)
  )

(dotest)

; seems sqrt(n) does not fit


