;Ch 9 Bridge project
(define (card-val card)
  (cond ((equal? (bf card) 'a) 4)
        ((equal? (bf card) 'k) 3)
        ((equal? (bf card) 'q) 2)
        ((equal? (bf card) 'j) 1)
        (else 0)))

(define (high-card-points hand)
  (accumulate + (every card-val hand)))

(define (count-suit suit hand)
  (count (keep (lambda (x) (member? suit x)) hand)))

(define (suit-counts hand)
  (sentence
   (count-suit 's hand)
   (count-suit 'h hand)
   (count-suit 'c hand)
   (count-suit 'd hand)))

(define (suit-dist-points hand-size)
  (cond ((equal? hand-size 2) 1)
        ((equal? hand-size 1) 2)
        ((equal? hand-size 0) 3)
        (else 0)))
(define (hand-dist-points hand)
  (accumulate + (every suit-dist-points (suit-counts hand))))

(define (bridge-val hand)
  (+ (high-card-points hand) (hand-dist-points hand)))

;[correct output!]
  





  
    
    
                             
                              