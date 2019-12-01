; exec 2.33

(load "acc.scm")

(define x (list 1 2 3 4))
(define y (list 5 6 7 8))
(display (map square x))(newline)

(define (map p sequence)
  (accumulate 
    (lambda (x y)
      (cons (map p x) y)
      )
    '()
    sequence
    )
  )
(display (map square x))(newline)

(display "==================================================")(newline)

(display (append x y))(newline)
(define (append seq1 seq2)
  (accumulate cons 
              seq2
              seq1
              )
  )
(display (append x y))(newline)
(display "==================================================")(newline)

(display (length x))(newline)
(define (length seq)
  (accumulate (lambda (a n) (+ n 1)) 0 seq)
  )
(display (length x))(newline)


