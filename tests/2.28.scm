; exec 2.28


(define (fringe tree)
  (define (iter src dst)
    (display "Iter ") (display src) (display " ") (display dst) (newline)
    (cond
      ((null? src) dst)
      ((not (pair? src)) (cons src dst))
      (else (iter (car src) (iter (cdr src) dst)))
      )
   )
  (iter tree '())
  )

(define obj (list (list 1 (list 2 (list (list 3 4 5) 6) 7)) (list (list 8 9) (list 10 11))))
(display (fringe obj))(newline)
