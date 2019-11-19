; exec 2.18

(define (reverse lst)
  (define (concat src dst)
    (if (null? src)
      dst
      (concat (cdr src) (cons (car src) dst))
      )
    )
  (concat  lst (list )) ; (list ) for empty list
  )


(display (reverse (list 1 3 5 7))) (newline)
