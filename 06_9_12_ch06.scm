;6.9
(define (thismany num noun)
  (if (equal? num 1)
      (sentence num noun)
      (sentence num (word noun 's))))
;6.10
(define (sort2 argument)
  (if (< (first argument) (last argument))
      argument
      (sentence (last argument) (first argument))))
;6.11
(define (valid-date? month day year)
  (and (>= month 1)
       (<= month 12)
       (>= day 1)
       (cond ((member? month '(1 3 5 7 8 10 12)) (<= day 31))
             ((member? month '(4 6 9 11)) (<= day 30))
             ((member? month '(2)) (if (equal? (remainder year 4) 0)
                                       (if (and (equal? (remainder year 100) 0)
                                                (equal? (remainder year 400) 0))
                                           (<= day 29)
                                           (<= day 28))
                                       (<= day 28)))
             (else #f))
       (> year 0)))

;6.12
;given version from text, 'version two'
;(define (plural wd)
;  (if (equal? (last wd) 'y)
;      (word (bl wd) 'ies)
;      (word wd 's)))

(define (plural wd)
  (cond ((equal? (last wd) 'y) (if (member? (last (butlast wd)) '(a e i o u))
                                   (word wd 's)
                                   (word (bl wd) 'ies)))
        ((equal? (last wd) 'o) (word wd 'es))
        ((equal? (last wd) 'x) (word wd 'es))
        (else (word wd 's))))





       


  
  

