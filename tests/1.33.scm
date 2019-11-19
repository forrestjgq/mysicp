; exec 1.33


(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (if (filter a) (combiner result (term a) ) result))
      )
    )
  (iter a null-value)
  )

(define (inc a) (+ a 1))
(define (f a) a)

; =====================================================================
(newline)(display ">>>> exec a:")(newline)

(load "prime.scm")

(define (filter n) (prime? n))
(define (add-prime a b)
  (filtered-accumulate filter + 0 f a inc b)
  )

(define (dotest n)
  (display n)(display ": ")(display (add-prime 2 n))(newline)
  )

(dotest 10) ; 2 + 3 + 5 + 7 = 17
(dotest 1000)

; =====================================================================
(newline)(display ">>>> exec b:")(newline)

(define (gcd1 a b)
  (define (filter a) (= (gcd a b) 1))
  (filtered-accumulate filter * 1 f a inc b)
  )

(define (dotest n)
  (display n)(display ": ")(display (gcd1 2 n))(newline)
  )

(dotest 10) ; 3 7 9 
(display "expected: ")(display (* 3 7 9))(newline)
(dotest 20) ; 
(display "expected: ")(display (* 3 7 9 11 13 17 19))(newline)
