; exec 2.23

(define (for-each f items)
  (if (not (null? items)) (f (car items))) ;tricky: how to impl if(a) {f(); return b;}?
  (if (null? items) #t (for-each f (cdr items)))
  )

(for-each (lambda (x) (newline) (display x)) (list 4 11 33))

(newline)
