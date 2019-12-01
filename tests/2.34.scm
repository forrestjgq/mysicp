; exec 2.34

(load "acc.scm")

; eval a(n)x^n + a(n-1)x^(n-1)+ ... + a(0)
(define (horner-eval x seq)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x)))
              0
              seq)
  )

(display (horner-eval 2 (list 1 3 0 5 0 1)))(newline)
