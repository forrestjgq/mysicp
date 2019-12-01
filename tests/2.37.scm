; exec 2.37

(load "2.36.scm")

(define (dot v w) (accumulate + 0 (map * v w)))

(define (m*v m v)
  (map 
    (lambda (x) (dot x v))
    m)
  )

(define (transpose mat)
  (acc-n 
    cons
    '()
    mat)
  )

(define (m*m m n)
  (let ((cols (transpose n)))
    (map
      (lambda (x) (m*v cols x))
      m)
    )
  )

    
(define x (list 1 2 3))
(define y (list 4 5 6))
(define z (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define m (list (list 1 2) (list 3 4)))
(define n (list (list 5 6) (list 7 8)))

(display (dot x y))(newline)
(display (m*v z x))(newline)
(display (transpose z))(newline)
(display (m*m m n))(newline)
