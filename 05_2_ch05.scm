(define (f1 wd1 wd2)
  (sentence (butfirst wd1) (butlast wd2)))
(define (f2 wd1 wd2)
  (sentence (f1 wd1 wd2) (word (first wd1) (last wd2))))
(define (f3 wd1 wd2)
  (sentence wd1 wd1))
(define (f4 wd1 wd2)
  (word (first (butfirst wd1)) (first (butfirst wd2))))




