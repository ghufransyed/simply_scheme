;5.16
(define (two-first wd1 wd2)
  (word (first wd1) (first wd2)))
(define (two-first-sent snt)
  (word (first (first snt))
        (first (first (butfirst snt)))))

;5.17
(define (knight name)
  (se 'Sir name))

;5.18
(define (ends word)
  (word (first word) (last word)))
;word is already defined as a function, so cannot also be used as a formal argument

;5.19
(define (insert-and snt)
  (se (butlast snt) 'and (last snt)))

;5.20
(define (middle-names names)
  (butfirst (butlast names)))

;5.21
(define (query snt)
  (sentence
   (first (butfirst snt))
   (first snt)
   (butlast (butfirst (butfirst snt)))
   (word (last snt) '?)))

   
   








