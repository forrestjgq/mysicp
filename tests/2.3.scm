; exec 2.3

(load "2.2.scm")

(define (len-rect r)
  (cons
    (abs (- (x-point (start-rect r)) (x-point (end-rect r))))
    (abs (- (y-point (start-rect r)) (y-point (end-rect r))))
    )
  )

(define (perimeter-rect rect)
  (* 2 (+ (car (len-rect rect))
          (cdr (len-rect rect))))
  )
(define (area-rect rect)
  (* (car (len-rect rect))
     (cdr (len-rect rect)))
  )


(display "exec 2.3")(newline)(display "==================================")(newline)
(display "Solution 1: ")(newline)

(define (make-rect start end)
  (cons start end)
  )
(define (start-rect r) (car r))
(define (end-rect r)   (cdr r))



(display (perimeter-rect (make-rect (make-point 10 2) (make-point -3 33))))(newline)
(display (area-rect (make-rect (make-point 10 2) (make-point -3 33))))(newline)


(define (make-rect x1 y1 x2 y2)
  (cons (cons x1 x2) (cons y1 y2))
  )

(define (start-rect r) 
  (make-point (car (car r))(car (cdr r)))
  )
(define (end-rect r) 
  (make-point (cdr (car r))(cdr (cdr r)))
  )
(display "Solution 2: ")(newline)
(display (perimeter-rect (make-rect 10 2 -3 33)))(newline)
(display (area-rect (make-rect 10 2 -3 33)))(newline)

(display "==================================")(newline)(newline)
