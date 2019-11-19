(define (same-parity . lst)
  (define (filter f src dst)
    ( if (null? src)
     dst
     (filter f (cdr src) 
             (if (f (car src))
               (append dst (list (car src))) ; awful
               dst)
             )
     )
    )
  (filter (if (even? (car lst)) even? odd?) lst (list))
  )


(display (same-parity 1 2 3 4 5))(newline)
(display (same-parity 4 2 3 4 5))(newline)
