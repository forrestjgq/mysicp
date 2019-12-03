;exec 2.40

(load "acc.scm")
(load "prime.scm")

(display "===========================================================================")(newline)

(define (enum-interval low high)
  (if (> low high)
    (list )
    (cons low (enum-interval (+ low 1) high)))
  )

(define (uniq-pairs n)
  (accumulate append '()
              (map 
                (lambda (i) 
                  (map (lambda (j) (list i j))
                       (enum-interval 1 (- i 1))
                       )
                  )
                (enum-interval 1 n)
                )
              )
  )

(display "uniq-pairs 10:")(newline)
(display (uniq-pairs 10))(newline)

(display "===========================================================================")(newline)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair)))
  )
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
  )
(define (prime-sum-pairs n)
  (map make-pair-sum 
       (filter prime-sum?
               (uniq-pairs n)
               )
       )
  )


(display "prime-sum-pairs 10:")(newline)
(display (prime-sum-pairs 10))(newline)
