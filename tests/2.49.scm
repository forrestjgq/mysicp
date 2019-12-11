;exec 2.49

(load "2.48.scm")

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))
          )
        )
      segment-list
      )
    )
  )

(define (border frame)
  (let (
        (tl (make-vect 0 1))
        (bl (make-vect 0 0))
        (br (make-vect 1 0))
        (tr (make-vect 1 1))
        )
    ((segments->painter
       (list
         (make-segment (make-segment bl tl))
         (make-segment (make-segment bl br))
         (make-segment (make-segment tl tr))
         (make-segment (make-segment br tr))
         )
       )
     frame
     )
    )
  )

(define (cross frame)
  (let (
        (tl (make-vect 0 1))
        (bl (make-vect 0 0))
        (br (make-vect 1 0))
        (tr (make-vect 1 1))
        )
    ((segments->painter
       (list
         (make-segment (make-segment bl tr))
         (make-segment (make-segment tl br))
         )
       )
     frame
     )
    )
  )
(define (diamond frame)
  (let (
        (l (make-vect 0 0.5))
        (b (make-vect 0.5 0))
        (r (make-vect 1 0.5))
        (t (make-vect 0.5 1))
        )
    ((segments->painter
       (list
         (make-segment (make-segment b r))
         (make-segment (make-segment r t))
         (make-segment (make-segment t l))
         (make-segment (make-segment l b))
         )
       )
     frame
     )
    )
  )
