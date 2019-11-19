(load "rat.scm")

(define (make-rat n d)
  (define (make-i n d) 
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))
      )
    )
  (if (or (and (> n 0) (> d 0)) (and (< n 0) (< d 0))) 
      (make-i (abs n) (abs d))
      (make-i (abs n) (* -1 (abs d)))
      )
  )

(print-rat (make-rat -1 2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat 1 2))
(print-rat (make-rat -1 -2))