; exec 1.31

(define (product term a next b)
  (define (iter a result)
;    (display "iter ")(display a)(display " ")(display result)(newline)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))
      )
    )
  (iter a 1)
  )

(define (inc a) (+ a 1))
(define (f a)
  (/ 
    (* (quotient (+  a 3) 2) 2)
    (+  (* (quotient (+ a 2) 2) 2) 1)
    )
  )

(define (factorial a b)
  (product f a inc b)
  )

(define (dotest n)
  (display n)(display ": ")(display (exact->inexact (factorial 0 n)))(newline)
  )

(display "pi/4 = 0.7853981633974483")(newline)
(dotest 10)
(dotest 20)
(dotest 50)
(dotest 100)
(dotest 1000)
(dotest 10000)
(dotest 100000)

(define (product term a next b)
;    (display "iter ")(display a)(display " ")(display result)(newline)
    (if (> a b)
      1
      (* (term a) (product term (next a) next b))
      )
    )
  )

(dotest 10)
(dotest 20)
(dotest 50)
(dotest 100)
; maximum recursion depth exceeded
