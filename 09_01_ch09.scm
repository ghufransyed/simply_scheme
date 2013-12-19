;9.1
(lambda (x) (+ (* x 3) 4))
; returns a function, evaluation gives a #<procedure.. message
;[correct]
((lambda (x) (+ (* x 3) 4)) 10)
;returns 34
;[correct]
(every (lambda (wd) (word (last wd) (bl wd)))
         '(any time at all))
;evaluates to 'yan etim ta lal'
;[correct]
((lambda (x) (+ x 3)) 10 15)
;returns error, as function returned by lambda takes one argument
;, given 2
;[correct]

