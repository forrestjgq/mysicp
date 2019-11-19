; exec 1.44



(define (compose f1 f2)
  (lambda (x) (f1 (f2 x))))

(define (repeated f n)
  (if (= n 1) f (compose f (repeated f (- n 1)))
    )
  )

(define dx 0.5)
(define (smooth f)
  (lambda (x) 
    (/ (+ (f x) (f (+ x dx)) (f (- x dx))) 3.0)
    )
  )

(define (sample x)
  (+ (square x) 1)
  )

; ((repeated smooth n) f) makes lots of difference vs (repeated (smooth f) n)
; we should repeat smooth, not result of smooth, which is actually f
; so smooth(smooth(smooth(f))) is required, not f(f(f(smooth)))
(define (calc f n)
  (define (calci f n x)
    (display (f x)) (display " vs ") (display (((repeated smooth n) f) x)) (newline)
    (if (> x 0)  (calci f n (- x 0.4)) )
    )
  (calci f n 10)
  )

(calc sample 10)
