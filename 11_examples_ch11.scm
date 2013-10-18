(define (downup wrd)
  (if (equal? (count wrd) 1)
      wrd
      (sentence wrd
                (downup (butlast wrd))
                wrd)))

(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(define (explode wrd)
  (cond ((equal? (count wrd) 1) (sentence wrd))
        ((equal? (count wrd) 2) (sentence
                                 (first wrd)
                                 (last wrd)))
        (else (sentence (first wrd)
                        (explode (butfirst (butlast wrd)))
                        (last wrd)))))

(define (letter-pairs wd)
    (cond ((member? (count wd) '(1 2)) (sentence wd))
          
          (else (sentence
                 (word (first wd) (first (butfirst wd)))
                 (letter-pairs (butfirst wd))))))

