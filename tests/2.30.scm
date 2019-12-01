; exec 2.30
(define (square-tree tree)
  (cond 
    ((null? tree) tree)
    ((not (pair? tree)) (* tree tree))
    (else (cons (square-tree (car tree)) (square-tree (cdr tree))))
    )
  )

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display (square-tree x))(newline)

(define (square-tree tree)
  (map (lambda (sub-tree) 
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (* sub-tree sub-tree)
           )
         )
       tree
  )
  )

(display (square-tree x))(newline)
