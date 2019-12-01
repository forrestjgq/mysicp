; exec 2.36

(load "acc.scm")

(define (acc-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs )) ; make a list (1 4 7 10)
          (acc-n op init (map cdr seqs)) ; make a list ((2 3) (5 6) (8 9) (11 12)) and recursive
          )
    )
  )

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(display (acc-n + 0 s))(newline)
