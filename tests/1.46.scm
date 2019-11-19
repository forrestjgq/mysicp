; exec 1.46
; good?: a lambda (guess next) to judge if next is good enough
; improver: a lambda (guess) to get next
(define (iter-improve good? improver)
  (lambda (guess) 
    (define (iter guess)
      (let ((next (improver guess)))
        (if (good? guess next) next (iter next))
        )
      )
    (iter guess)
    )
  )


; Calc-sqrt
(define (improve x) (lambda (guess) (average guess (/ x guess))))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? x)
  (lambda (guess next) (< (abs (- (square guess) x)) 0.001))
  )

(define (sqrt x)
  ((iter-improve (good-enough? x) (improve x) ) 1.0)
  )
(display "sqrt(5): ") (display (sqrt 5)) (newline)


(define (good-enough? tolerance) (lambda (guess next) (< (abs (- next guess)) tolerance)))

(define (fixed-point f guess)
  ((iter-improve (good-enough? 0.000001) f) guess)
  )

(define (sqrt x)
  (fixed-point ( lambda (y) (/ (+ y (/ x y)) 2) ) 1.0)
  )

(display "Sqrt 5: ") (display (sqrt 5))(newline)

(define (phy x)
  (fixed-point ( lambda (y) (+ (/ 1.0 y) 1)) 1.0)
  )
(display "Phy: ") (display (phy 5))(newline)
