; exec 1.36

(define tolerance 0.00001)
(define (fixed-point f guess)
  (define (close-enough v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (display "step ")(display step)(display ": ")(display guess)(newline)
    (let ((next (f guess)))
      (if (close-enough next guess)
        next
        (try next (+ step 1))
        )
      ))
  (try guess 1)
  )

(define (calc x)
  (fixed-point ( lambda (y) (/ (log x) (log y)) ) 1.1)
  )

(display "result: ") (display (calc 1000))(newline)

(define (calc y)
  (fixed-point ( lambda (x) (/ 
                              (+ (log 1000) (* x (log x)))
                              (* 2 (log x))
                              ) ) 1.1)
  )

(display "result: ") (display (calc 1000))(newline)
