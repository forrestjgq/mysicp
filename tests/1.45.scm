; total failure, give up
(define (compose f1 f2)
  (lambda (x) (f1 (f2 x))))

(define (repeated f n)
  (if (= n 1) f (compose f (repeated f (- n 1)))
    )
  )

(define (expti x n)
  ((repeated (lambda (y) (* y x)) (- n 1)) x)
  )

; calc 3^4
(display (expti 3 4))(newline)


; for y^n = x, y -> x/(y^(n-1))
(load "tool.scm")

(define (average-damp f)
  (lambda (x) (average x (f x)))
  )
(define (rep-average f n)
  (repeated (average-damp f) (- n 1)))

; f: function, n: repeat-avg num,
(define (check-avg f n guess)
  (define (check-i g k last-diff guess)
    (let ((next (g guess)) )
      (let ((curr-diff (abs (- next guess))))
        (cond ((k > 10) #t)
              ((> (curr-diff) last-diff) #f)
              (else (check-i g (+ k 1) curr-diff next))
              )
        )
      ))
  (check-i (rep-average f n) 1 10000000 guess)
  )

(define (target x n) (lambda (y) (/ x (expti y (- n 1)))))

(display (check-avg (target 3 4) 10 1.0))

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


