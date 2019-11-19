; exec 1.35

(define tolerance 0.00001)
(define (fixed-point f guess)
  (define (close-enough v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough next guess)
        next
        (try next)
        )
      ))
  (try guess)
  )

(define (sqrt x)
  (fixed-point ( lambda (y) (/ (+ y (/ x y)) 2) ) 1.0)
  )

(display "Sqrt 5: ") (display (sqrt 5))(newline)

(define (phy x)
  (fixed-point ( lambda (y) (+ (/ 1.0 y) 1)) 1.0)
  )
(display "Phy: ") (display (phy 5))(newline)
