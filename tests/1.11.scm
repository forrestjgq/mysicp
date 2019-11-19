; Type 1
(define num 10)
(define (fun n) 
  (cond ((< n 3) n)
        (else (+ 
                (fun (- n 1)) 
                (* 2 (fun (- n 2)))
                (* 3 (fun (- n 3)))
                )
              )
        )
  )

(fun num)

; Type 2
(define (add n1 n2 n3) (+ n1 (* n2 2) (* n3 3)))
(define (fun-i n1 n2 n3 amount) 
  (cond ((= amount 0) n1)
        (else (fun-i (add n1 n2 n3) n1 n2 (- amount 1)))
        )
  )

(define (fun2 n) 
  (cond ((< n 3) n)
        (else (fun-i 2 1 0 (- n 2)))
        )
  )

(fun2 num)
