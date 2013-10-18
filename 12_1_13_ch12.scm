;Ex 12.1

(define (addup nums)
  (if (= (count nums) 1)
      nums
      (+ (first nums) (addup (bf nums)))))

;Ex 12.2
(define (acronym sent)
  (if (= (count sent) 1)
      (first (first sent))
      (word (first (first sent))
            (acronym (bf sent)))))


#|
(define (acronym sent) ;;wrong version
  (if (= (count sent) 1)
      (first sent)
      (word (first (first sent))
            (acronym (bf sent)))))
  |#
  
;Ex 12.3
;factorial (-1) is not defined mathematically

;Ex 12.4
(define (f sent)
  (if (empty? sent)
      sent
      (se (f (butfirst sent))
          (first sent))))

#| f reverses the order of the sentence
> (f '(the united states of america))
'(america of states united the)
 |#

;Ex 12.5
(define (exaggerate sent)
  (se 
   (cond ((empty? sent) '() )
         ((number? (first sent)) (se (* 2 (first sent)) (bf sent)))
         ((equal? (first sent) 'good) (se 'great (bf sent)))
         ((equal? (first sent) 'bad)  (se 'terrible (bf sent)))
         (else (se (first sent) (exaggerate (bf sent)))))))
     
                  
         
         
             

  
              