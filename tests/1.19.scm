; a[n+1] = (b[n]+a[n])*q + a[n]p
; b[n+1] = b[n]p + a[n]q
; compute to:
; a[n+2] = (b[n]+a[n]) * (q^2+2pq) + a[n](p^2+q^2) 
; b[n+2] = b[n](p^2+q^2) + a[n](q^2+2pq)
; so:
; p' = p^2+q^2, q' = q^2+2pq

(define (even? n) (= (remainder n 2) 0))

(define (fib n) (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ; p' = p^2 + q^2, q' = q^2 + 2pq
        ((even? count) (fib-iter a b (+ (* p p) (* q q)) (+ (* q q) (* 2 p q)) (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- count 1)))
        )
  )

(fib 100)
