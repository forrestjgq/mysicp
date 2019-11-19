; exec 1.24

(load "1.22.scm")

(newline) (display ">>>>>> Now starts 1.24") (newline)

(define (start-prime-test n start-time)
  (if (fast-prime? n k)
    (report-prime n (- (runtime) start-time))
  )
  )

(define k 100) (newline)(newline)(display "check times: ") (display k) (dotest)
(define k 1000) (newline)(newline)(display "check times: ") (display k) (dotest)
(define k 10000) (newline)(newline)(display "check times: ") (display k) (dotest)
(define k 100000) (newline)(newline)(display "check times: ") (display k) (dotest)


#|
result:

check times: 100
1009 *** 9.999999999990905e-3
10007 *** 0.
10009 *** 0.
100003 *** 0.
1000003 *** 0.
10000019 *** 1.0000000000005116e-2
100000007 *** 0.


check times: 1000
1009 *** 1.0000000000005116e-2
10007 *** .01999999999999602
10009 *** 9.999999999990905e-3
100003 *** 2.0000000000010232e-2
1000003 *** .01999999999999602
10000019 *** 3.0000000000001137e-2
100000007 *** 3.0000000000001137e-2


check times: 10000
1009 *** .10999999999999943
10007 *** .1599999999999966
10009 *** .14000000000000057
100003 *** .18000000000000682
1000003 *** .19999999999998863
10000019 *** .25
100000007 *** .29000000000000625


check times: 100000
1009 *** 1.2199999999999989
10007 *** 1.5799999999999983
10009 *** 1.5100000000000051
100003 *** 1.769999999999996
1000003 *** 2.0400000000000063
10000019 *** 2.4499999999999886
100000007 *** 2.940000000000012
|#
