(load "tool.scm")

(define (cube n) (* n n n))

; integral method
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
  )

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))
    )
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

; sompson method
(define (sompson f a b n)
  (define (h) (/ (- b a) n))
  (* (/ (h) 3) (sompson-i f a b (h) 0 n))
  )

(define (cof idx n) 
  (cond 
    ((or (= idx 0) (= idx n)) 1)
    ((even? idx) 2)
    (else 4)
    )
  )

(define (sompson-i f a b h idx n)
(if (> idx n)
  0
  (+ 
    (* (cof idx n) (f (+ a (* idx h))))
    (sompson-i f a b h (+ idx 1) n)
    )
  )
  )


; test simpson
(display "cube")(newline)
(define (dotest n)
  (display n)(display ": ") (display (sompson cube 0 1 n))(newline)
  )
(dotest 2)
(dotest 10)
(dotest 100)
(dotest 1000)
(dotest 10000)

; also test simpson, but use sqrt instead of cube
(display "sqrt")(newline)
(define (dotest n)
  (display n)(display ": ") (display (sompson sqrt 0 1 n))(newline)
  )
(dotest 2)
(dotest 10)
(dotest 100)
(dotest 1000)
(dotest 10000)
