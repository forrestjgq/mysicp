;exec 2.47

(define (make-frame origin edge1 edge2)
 (list origin edge1 edge2)
 )

(define (Origin frame)
 (car frame)
 )
(define (Edge1 frame)
 (cadr frame)
 )
(define (Edge2 frame)
 (caddr frame)
 )


;============================================================

(define (make-frame origin edge1 edge2)
 (cons origin (cons edge1 edge2))
 )

(define (Origin frame)
 (car frame)
 )
(define (Edge1 frame)
 (cadr frame)
 )
(define (Edge2 frame)
 (cddr frame)
 )
