;8.13
(define (ltr2num letter)
  (cond ((member? letter '(a b c)) 2)
        ((member? letter '(d e f)) 3)
        ((member? letter '(g h i)) 4)
        ((member? letter '(j k l)) 5)
        ((member? letter '(m n o)) 6)
        ((member? letter '(p q r s)) 7)
        ((member? letter '(t u v)) 8)
        ((member? letter '(w x y z)) 9)
        (else '(not a number))))
(define (phone-unspell wd)
  (every ltr2num wd))

;8.14
(define (subword wd start finish)
    ((repeated bl (- (count wd) finish)) ((repeated bf (- start 1)) wd)))

;(define (subword wd start finish)
;  ((accumulate (repeated first (- (+ finish 1) start)) (repeated bf (- start 1)) wd)))

