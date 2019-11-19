(load "tool.scm")

(define (average-damp f)
  (lambda (x) (average x (f x)))
  )


(define tolerance 0.000000001)

(define (fixed-point f guess)
  (define (close-enough v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (let ((next (f guess)))
      (if (close-enough next guess)
        next
        (try next (+ step 1))
        )
      ))
  (try guess 1)
  )

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0)
  )

(display "Sqrt 4: ") (display (sqrt 4))(newline)
(display "Sqrt 5: ") (display (sqrt 5))(newline)

(define dx 0.0000000001)

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))
  )
(define (newton-transform g)
  (lambda (x) 
    (- x (/ (g x) ((deriv g) x)))
    )
  )

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess)
  )
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess)
  )

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x)) newton-transform 1.0)
  )

(display "Sqrt 4: ") (display (sqrt 4))(newline)
(display "Sqrt 5: ") (display (sqrt 5))(newline)

(define (cubic a b c)
  (lambda (x) 
  (+
    (* x x x) (* a x x) (* b x) c
   )))

(define (calc-cubic a b c)
  (newtons-method (cubic a b c) 1.0)
  )

(let 
  ((a 4) (b -3) (c 4))
    (display "a = ") (display a)
    (display ",b = ") (display b)
    (display ",c = ") (display c)
    (display ": ") (display (calc-cubic a b c))
    (newline)
  )
(let 
  ((a -4) (b 3) (c 4))
    (display "a = ") (display a)
    (display ",b = ") (display b)
    (display ",c = ") (display c)
    (display ": ") (display (calc-cubic a b c))
    (newline)
  )
