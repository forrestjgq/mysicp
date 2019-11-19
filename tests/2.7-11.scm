(define (make-intv a b)
  (cons a b)
  )


(define (add-intv x y)
  (make-intv (+ (lower-bound x) (lower-bound y))
             (+ (upper-bound x) (upper-bound y)))
  )

(define (mul-intv x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (upper-bound x) (lower-bound y)))
        (p3 (* (lower-bound x) (upper-bound y)))
        (p4 (* (upper-bound x) (upper-bound y)))
        )
    (make-intv (min p1 p2 p3 p4) (max p1 p2 p3 p4))
    )
  )

(define (div-intv x y)
  (mul-intv x
            (make-intv (/ 1.0 (lower-bound y))
                       (/ 1.0 (upper-bound y)))
    )
  )

; exec 2.7 
(newline) (display "Exec: 2.7") (newline)(display "=========================================")(newline)(newline)
(define (lower-bound x)
  (min (car x) (cdr x))
  )

(define (upper-bound x)
  (max (car x) (cdr x))
  )

; exec 2.8 
(newline) (display "Exec: 2.8") (newline)(display "=========================================")(newline)(newline)
(define (sub-intv x y)
  (make-intv (- (lower-bound x) (upper-bound y))
             (- (upper-bound x) (lower-bound y))
             )
  )

; exec 2.9
(newline) (display "Exec: 2.9") (newline)(display "=========================================")(newline)(newline)
(define (width-intv x)
  (/ (- (upper-bound x) (lower-bound x)) 2.0)
  )

#|
prove: 
(= width-intv (+ x y) (+ (width-intv x) (width-intv y)))

w(x+y) = w (x.lower+y.lower, x.upper+y.upper)
       = (x.upper + y.upper - x.lower - y.lower) / 2.0
w(x) + w(y) = (x.upper - x.lower) / 2.0 + (y.upper - y.lower) / 2.0
            = (x.upper + y.upper - x.lower - y.lower) / 2.0
proved.

same prove for: 
(= width-intv (- x y) (- (width-intv x) (width-intv y)))

|#

(display "w((3,4)/(7,9)):    ") (display (width-intv (div-intv (make-intv 3 4) (make-intv 7 9))))(newline) 
(display "w((3,4))/w((7,9)): ") (display (/ (width-intv (make-intv 3 4)) (width-intv (make-intv 7 9))))(newline) 

; exec 2.10
(newline) (display "Exec: 2.10") (newline)(display "=========================================")(newline)(newline)
(define (div-intv x y)
  (if 
    (and (< (lower-bound y) 0) (> (upper-bound y) 0)) 
    ((display "Invalid divider")(newline))
    (mul-intv x
              (make-intv (/ 1.0 (lower-bound y))
                         (/ 1.0 (upper-bound y)))
              )
    )
  )

(display "(3,4)/(-7,9):    ") (display (div-intv (make-intv 3 4) (make-intv -7 9)))(newline) 
(RESTART 1)(newline)

; exec 2.11
(newline) (display "Exec: 2.11") (newline)(display "=========================================")(newline)(newline)
(display "I know how to solve, but Ben's advice is awful, 
and they is no way to multiple twice for u1 > 0 > l1 and u2 > 0 > l2")
(newline)

; exec 2.12
(newline) (display "Exec: 2.12") (newline)(display "=========================================")(newline)(newline)

(define (make-center-percent c p-num)
  (let ((p (/ p-num 100)))
    (make-intv (- c (* c (/ p 2.0))) (+ c (* c (/ p 2.0))))
    )
  )

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0)
  )

(define (percent intv)
  (* 100 (/ (* 2 (width-intv intv)) (center intv)))
  )

(display (width-intv (make-center-percent 100 12)))(newline)
(display (center (make-center-percent 100 12)))(newline)
(display (percent (make-center-percent 100 12)))(newline)

