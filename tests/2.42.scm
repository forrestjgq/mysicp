; exec 2.42
(load "flatmap.scm")

(define (enum-interval low high)
  (if (> low high)
    (list )
    (cons low (enum-interval (+ low 1) high)))
  )

(define empty-board (list ))

(define (adjoin-position row col queens)
 ;(display "Ad row ")(display row)(display " col ")(display col)(display " queens ")(display  queens)(newline)
 (cons (list row col) queens)
 )

(define (same r1 c1 r2 c2)
   (and (= r1 r2) (= c1 c2)) )
(define (aligned r1 c1 r2 c2)
   (or (= r1 r2) (= c1 c2)) )
(define (conor? r1 c1 r2 c2)
   (= (abs (- r1 r2)) (abs (- c1 c2))) )

(define (safe? col positions)
  (define (sub-safe? row col sub-pos) 
   ;(display "row ")(display row) (display " col ")(display col)(display " pos ")(display sub-pos)(newline)
   (if (null? sub-pos) 
     #t
    (let ((trow (caar sub-pos)) (tcol (cadar sub-pos)))
     ;(display "  trow ")(display trow)(display "  tcol ")(display tcol)(newline)
     (if (and (not (same trow tcol row col))
              (or 
               (aligned trow tcol row col)
               (conor? trow tcol row col)
               )
          )
       #f
       (sub-safe? row col (cdr sub-pos))
      )
     )
    )
    )
  (define (find-row col sub-pos)
   (if (= col (cadar sub-pos))
    (caar sub-pos)
    (find-row col (cdr sub-pos))
    )
   )
  (sub-safe? (find-row col positions) col positions)
  )

(define (queens board-size)
 (define (queen-cols k)
  (if (= k 0)
   (list empty-board)
   (filter
    (lambda (positions) (safe? k positions))
    (flatmap
     (lambda (rest-of-queens)
      (map (lambda (new-row)
            (adjoin-position new-row k rest-of-queens))
       (enum-interval 1 board-size)
       ) ; end map
      )
     (queen-cols (- k 1))
     ) ; end flatmap
    ) ; end filter
   ) ; end if k = 0
  ) ; end queen-cols

 (queen-cols board-size)
 )

(display "8 Queens: ")(newline)
(display "===================================================================================")(newline)
(display (queens 8))(newline)
