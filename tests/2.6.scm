; exec 2.6

(define zero 
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one 
  (lambda (f) (lambda (x) (f x)))
  )

(define two 
  (lambda (f) (lambda (x) (f (f x))))
  )

(define (+ a b)
  (lambda (f) 
    (lambda (x) 
     ((a f) ((b f ) x))
     ))
  )

(define (pt x)
  (display "display")(newline)
  )

(display "One: ")(newline)
((one pt) 0)
(newline)
(newline)

(display "Two: ")(newline)
((two pt) 0)
(newline)
(newline)

(display "One+Two: ")(newline)
(((+ one two) pt) 0)
(newline)
(newline)

(display "Two+Two ")(newline)
(((+ two two) pt) 0)
(newline)
(newline)

