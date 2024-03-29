; exec 2.21

(define (square-list items)
  (if (null? items)
    '()
    (cons (square (car items)) (square-list (cdr items)))
    )
  )

(display (square-list (list 1 2 3 4)))(newline)

(define (square-list items)
  (map (lambda (x) (square x)) items))

(display (square-list (list 1 2 3 4)))(newline)
