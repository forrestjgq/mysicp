(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x)) (display "/") (display (denom x))(newline) 
  )


(define (make-rat n d) 
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))
    )
  )

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))
            )
  )

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))
            )
  )

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))
            )
  )

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))
            )
  )

(define (div-rat x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))
            )
  )

(define one-half (make-rat 1 2))

