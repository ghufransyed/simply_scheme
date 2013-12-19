;9.1
;nothing [actually prints 'procedure]
;34  [correct]
;'(yan etim ta lal) [correct]
;error (two arguments) [correct]
;'#<procedure>: expects 1 argument, given 2: 10 15

;9.2
;(define (second stuff)
;  (first (bf stuff)))
(define second (lambda (stuff) (first (bf stuff))))


