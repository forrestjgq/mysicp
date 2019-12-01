; exec 2.31

(define (tree-map proc tree)
  (map (lambda (sub-tree) 
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (proc sub-tree)
           )
         )
       tree
  )
  )

(define (square-tree tree)
  (tree-map square tree)
  )

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display (square-tree x))(newline)
