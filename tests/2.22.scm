
; exec 2.22.scm

#|
first question:
cons (square ...) answer repeatly add element before answer 
from head to tail of things(which is input: items)

so it reverse the inputting to output through square

second question:
cons answer (square...) makes a fork for new cons:
new  car -> answer
     cdr -> (square)

not expected answer -> (square)

we need create a new list (list (square...)) and append to answer:
(append answer (list (square...)))
|#
