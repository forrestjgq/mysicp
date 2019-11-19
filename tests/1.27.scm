; exec 1.27

(load "fermat.scm")

(define (carmichael n)
  (check-cam n 2)
)

(define (check-cam n a)
  (if (< a n)
    (= (expmod a n n) (remainder a n))
    (check-cam n (+ a 1))
    )
  )

(define (show-cam n)
  (display "Number ")
  (display n)
  (display ": ")
  (display (carmichael n))
  (newline)
  )

; positive case
(show-cam 561)
(show-cam 1105)
(show-cam 1729)
(show-cam 2465)
(show-cam 2821)
(show-cam 6601)

; negtive case
(show-cam 7601)
