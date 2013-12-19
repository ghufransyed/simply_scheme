;6.5
(define (european-time time)
  (if (equal? (last time) 'am)
      (if (equal? (first time) 12) 
          '00
          (first time))
      (if (equal? (first time) 12)
          '12
          (+ 12 (first time)))))

;I think the example given is wrong, 12 midnight (12 am) should be 00, not 24

(define (american-time time)
  (if (< time 12)
      (if (equal? time 0)
          (sentence 12 'am)  
          (sentence time 'am))
      (if (equal? time 12)
          (sentence 12 'pm)
          (sentence (- time 12) 'pm))))

;--------------------------------------------------
;6.6
(define (teen? number)
  (not (or (< number 13) (> number 19))))
;---------------------------------------------------
;6.7
(define (type-of stuff)
  (cond ((number? stuff) 'number)
        ((word? stuff) 'word)
        ((sentence? stuff) 'sentence)
        ((boolean? stuff) 'boolean)
        (else 'ugh)))
;-----------------------------------------------------
;6.8
(define (indef-article wd)
  (if (member? (first wd) '(a e i o u))
      (sentence 'an wd)
      (sentence 'a wd)))




                       
  






        

  
