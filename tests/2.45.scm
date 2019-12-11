; exec 2.45


(define (split outside inside)
 (lambda (painter n)
  (if (= n 0)
    painter
    (let ((smaller ((split outside inside) painter (- n 1))))
      (outside painter (inside smaller smaller))
      )
   ))
 )


(define right-split (split beside below))
(define up-split (split below beside))
