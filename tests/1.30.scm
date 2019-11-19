
(load "tool.scm")

(define (cube n) (* n n n))

; integral method
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
  )

(define (sum term a next b)
  (define (iter a result)
;    (display a)(display " ")(display result)(newline)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
      )
    )
  (iter a 0)
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

