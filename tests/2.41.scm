
;exec 2.41

(load "acc.scm")
(display "===========================================================================")(newline)


(define (enum-interval low high)
  (if (> low high)
    (list )
    (cons low (enum-interval (+ low 1) high)))
  )

(define (remove item seq)
  (filter (lambda (x) (not (= x item))) seq))

(define (uniq-pairs n seq)
  (if (= n 0)
    (list '())
    (accumulate append '() 
                (map 
                  (lambda (element)
                    (map (lambda (k) 
                           (cons element k)
                           )
                         (uniq-pairs (- n 1) (remove element seq))
                         )
                    )
                  seq
                  )
                )

    )
  )

(define (sum-pairs n s)
  (define (match-sum? p)
    (and (not (= (car p) (cadr p)))
         (not (= (car p) (caddr p)))
         (not (= (caddr p) (cadr p)))
         (= s (+ (car p) (cadr p) (caddr p)))
         )
    )
  (filter (lambda (x) (= (accumulate + 0 x) s))
          (uniq-pairs 3 (enum-interval 1 n))
          )
  )


(display "sum-pairs 10:")(newline)
(display (sum-pairs 10 20))(newline)
