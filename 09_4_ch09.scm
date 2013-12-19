;Ex 9.4 the program in comments is the program that needs fixing
;(define (who sent)
;  (every describe '(pete roger john keith)))

;(define (describe person)
;  (se person sent))

(define (who sent)
  (every (lambda (person) 
           (se person sent)) 
         '(pete roger john keith)))
;[correct]