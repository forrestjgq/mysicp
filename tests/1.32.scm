
; exec 1.32
(display "accumulate for product")(newline)
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
;    (display "iter ")(display a)(display " ")(display result)(newline)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))
      )
    )
  (iter a null-value)
  )

(define (inc a) (+ a 1))
(define (f a)
  (/ 
    (* (quotient (+  a 3) 2) 2)
    (+  (* (quotient (+ a 2) 2) 2) 1)
    )
  )

(define (factorial a b)
  (accumulate * 1 f a inc b)
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

(newline)
(display "accumulate for sum")(newline)

(load "tool.scm")

(define (cube n) (* n n n))

; integral method
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
  )

(define (sum term a next b)
  (accumulate + 0 term a next b)
  )

; test integral
(define (dotest n)
  (display n)(display ": ") (display (integral cube 0 1 n))(newline)
  )
(display "integral")(newline)
(dotest 0.1)
(dotest 0.01)
(dotest 0.001)
(dotest 0.0001)

(define (accumulate combiner null-value term a next b)
;    (display "iter ")(display a)(display " ")(display result)(newline)
    (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))
      )
  )

(newline)(newline)(display "==> recursive now")(newline)(newline)

(define (dotest n)
  (display n)(display ": ")(display (exact->inexact (factorial 0 n)))(newline)
  )
(display "accumulate for product")(newline)
(display "pi/4 = 0.7853981633974483")(newline)
(dotest 10)
(dotest 20)
(dotest 50)
(dotest 100)

(newline)
(display "accumulate for sum")(newline)
(display "integral")(newline)
(define (dotest n)
  (display n)(display ": ") (display (integral cube 0 1 n))(newline)
  )
(dotest 0.1)
(dotest 0.01)
(dotest 0.001)
(dotest 0.0001)
