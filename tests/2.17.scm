; exec 2.17

(define (last-pair p)
  (if (or (null? p) (null? (cdr p)))
    p
    (last-pair (cdr p))
    )
  )

(display (last-pair (list 1 3 5 7))) (newline)
