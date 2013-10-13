;Ex 9.5 write 'prepend-every based on given examples

(define (prepend-every pre post)
  (every (lambda (x) (word pre x)) post))

;[correct]
;> (prepend-every 's '(he aid he aid))
;'(she said she said)
;> (prepend-every 'anti '(dote pasto gone body))
;'(antidote antipasto antigone antibody)
