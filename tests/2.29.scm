; exec 2.29

(define (make-mobile left right)
  (list left right)
  )

(define (make-branch length structure)
  (list length structure)
  )

(define (left-branch mobile)
  (car mobile)
  )
(define (right-branch mobile)
  (cadr mobile)
  )

(define (branch-length branch)
  (car branch)
  )

(define (branch-structure branch)
  (cadr branch)
  )

(define (add x y) (display "add ")(display x) (display " ")(display y)(newline)(+ x y))
(define (total-weight mobile)
  (cond 
    ((null? mobile) 0)
    ((not (pair? mobile)) mobile)
    (else (+  (total-weight (branch-structure (right-branch mobile))) 
              (total-weight (branch-structure (left-branch mobile)))))
    )
  )

(define mobile 
  (make-mobile
    (make-branch 3 4)
    (make-branch 5 6)
   ))
(display (left-branch mobile))(newline)
(display (right-branch mobile))(newline)
(display (branch-length (left-branch mobile)))(newline)
(display (branch-structure (left-branch mobile)))(newline)
(display (total-weight mobile))(newline)
