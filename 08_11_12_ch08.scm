;8.11
(define (base-grade lg)
  (cond ((equal? (first lg) 'A) 4)
        ((equal? (first lg) 'a) 4)
        ((equal? (first lg) 'B) 3)
        ((equal? (first lg) 'b) 3)
        ((equal? (first lg) 'C) 2)
        ((equal? (first lg) 'c) 2)
        ((equal? (first lg) 'D) 1)
        ((equal? (first lg) 'd) 1)
        (else 0)))
(define (grade-modifier lg)
  (cond ((equal? (bf lg) '+) 0.33)
        ((equal? (bf lg) "") 0)
        ((equal? (bf lg) '-) -0.33)))

(define (gpa grades)
     (/
      (+
       (accumulate + (every base-grade grades))
       (accumulate + (every grade-modifier grades)))
      (count grades)))

;8.12
(define (um? wd)
  (if (equal? wd 'um)
      #t
      #f))
(define (count-ums sent)
  (count (keep um? sent)))

  


