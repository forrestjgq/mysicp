; exec 1.23

(load "1.22.scm")

(newline) (display ">>>>>> Now starts 1.23") (newline)

; redefine find-divisor and do test again
; scheme makes sure using latest defined find-divisor
(define (next n) 
  (if (= n 2) 3 (+ n 2))
  )

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n n))
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (next test-divisor)))
        )
  )

(dotest)

