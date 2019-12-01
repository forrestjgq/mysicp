; exec 2.27

(define (reverse-tree tree)
  (
     cond 
     ((null? tree) tree)
     ((not (pair? tree)) tree)
     (else (reverse (list (reverse-tree (car tree)) (reverse-tree (cadr tree)))))
  )
  )

(define obj (list 3 4))
(display (reverse-tree obj))(newline)
(define obj (list (list 1 2) (list 3 4)))
(display (reverse-tree obj))(newline)
