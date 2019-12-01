; exec 2.32

(define (subsets s)
  (if (null? s)
    (list (list))
    (let ((rest (subsets (cdr s))))
      ; rest + a list that mapping from rest, for each element(which is a list), append car
      (append rest 
              (map 
                (lambda (x) (cons (car s) x))
                rest)
              )
       )
    )
  )

(display (subsets (list 1 2 3))) (newline)
