; exec 2.39

(load "acc.scm")
(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest) 
     result
     (iter (op result (car rest))
           (cdr rest))
     )
    )
  (iter initial sequence)
  )

(define x (list 1 2 3 4))
(define (reverse seq)
  (fold-right 
    (lambda (x y) 
      (append y (list x))
      )
    '()
    seq
    )
  )

(display (reverse x))(newline)
(define (reverse seq)
  (fold-left
    (lambda (x y) 
      (cons y x)
      )
    '()
    seq
    )
  )
(display (reverse x))(newline)
