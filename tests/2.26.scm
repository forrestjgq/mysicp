; exec

#|
(1 2 3 4 5 6)
((1 2 3) . (4 5 6)) : wrong
((1 2 3) 4 5 6) : correct, why?
((1 2 3) (4 5 6))
|#

(define x (list 1 2 3))
(define y (list 4 5 6))

(display (append x y))(newline)
(display (cons x y))(newline)
(display (list x y))(newline)
