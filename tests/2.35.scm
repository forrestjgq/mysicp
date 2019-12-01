; exec 2.35

(load "acc.scm")

(define (count-leaves t) 
  (accumulate 
    +
    0
    (map 
      (lambda (sub-tree)
       (if (pair? sub-tree) (count-leaves sub-tree) 1)
       )
      t)
    )
  )

(define tree (list 1 (list 2 (list 3 4) 5)))

(display (count-leaves tree))(newline)
