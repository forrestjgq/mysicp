; exec 1.25 

(load "1.22.scm")

(newline) (display ">>>>>> Now starts 1.25") (newline)

(define (expmod base exp m)
  (remainder (fast-expt base exp) m)
  )

(define (start-prime-test n start-time)
  (if (fast-prime? n k)
    (report-prime n (- (runtime) start-time))
  )
  )

(display "too slow to run")
#|
(define k 100) (newline)(newline)(display "check times: ") (display k) (dotest)
(define k 1000) (newline)(newline)(display "check times: ") (display k) (dotest)
(define k 10000) (newline)(newline)(display "check times: ") (display k) (dotest)
(define k 100000) (newline)(newline)(display "check times: ") (display k) (dotest)

part of result:

check times: 100
1009 *** 0.
10007 *** .29000000000000004
10009 *** .29000000000000004
100003 *** 43.93^C^C^C^C^C^C^C^C^C^C^C^C^C
;Quit!

check times: 1000
1009 *** 3.0000000000001137e-2
10007 *** 2.8300000000000125
10009 *** 2.8300000000000125^C^C

|#

