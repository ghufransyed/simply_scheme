;Reverse
(define (reverse wd)
  (if (equal? (count wd) 1)
      (word wd)
      (word (last wd)
            (reverse (butlast wd)))))
;Factorial
(define (factorial num)
  (if (= num 0)
      1
      (* num (factorial (- num 1)))))
;Downup
(define (downup wd)
  (if (= (count wd) 1)
      (se wd)
      (se wd
          (se (downup (bl wd)))
          wd)))
;Evens
(define (evens sent)
  (if (member? (count sent) '(0 1))
      '()
      (se (item 2 sent)
          (evens (bf (bf sent))))))

      
      

  