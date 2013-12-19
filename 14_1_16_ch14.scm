;Ex 14.1
;(remove-once 'morning '(good morning good morning))
;(good good morning)

;"keep" pattern

(define (remove-once wd sent)
  (if (equal? (count (se sent)) 1)
      (if (equal? wd (first sent))
          '()
          sent)
      (se (remove-once wd (se (first sent)))
          (if (equal? wd (first sent))
              (se (bf sent))
              (remove-once wd (bf sent))))))

;Ex 14.2
;(up 'town)
;(T TO TOW TOWN)
(define (up wd)
  (up-helper wd (count wd)))
(define (up-helper wd len)
  (if (equal? len 1)
      wd
      (se ((repeated bl (- len 1)) wd)
          (up-helper wd (- len 1)))))

;Ex 14.3
;(remdup '(ob la di ob la da))
;(ob la di da)
(define (remdup sent)
  (cond ((equal? (count (se sent)) 1) (sent))
        ((equal? (count (se sent)) 2)
         (if (member? (first sent)(bf sent))
             (se (bf sent))
             sent)) 
        ((member? (first sent)(bf sent))
         (remdup (bf sent)))
        (else (se (first sent)
                  (remdup (bf sent))))))

;Ex 14.4
;(odds '(i lost my little girl))
;(i my girl)

(define (odds sent)
  (cond ((equal? (count (se sent)) 1) (se sent))
        ((equal? (count sent) 2) (first sent))
        (else (se (first sent)
                  (odds (se (bf (bf sent))))))))

;Ex 14.5
;(letter-count '(fixing a hole))
;11
(define (letter-count sent)
  (cond ((equal? (count (se sent)) 0) 0)
        ((equal? (count (se sent)) 1) (count (first sent)))
        (else (+ (count (first sent))
                 (letter-count (bf sent))))))
  
;Ex 14.6
(define (member? arg1 arg2)
  (if (equal? (count (se arg2)) 1)
      (if (equal? arg1 (word (first arg2)))
          #t
          #f)
       (or (if (equal? arg1 (word (first arg2)))
               #t
               #f)
           (member? arg1 (bf arg2)))))
                                 
;Ex 14.7
(define (differences sent)
  (if (equal? (length (se sent)) 2)
      (se (- (first (bf sent)) (first sent)))
      (se
       (se (- (first (bf sent)) (first sent)))
       (se (differences (bf sent))))))
#| output
> (differences '(4 23 9 87 6 12))
'(19 -14 78 -81 6)
|#

;Ex 14.8

(define (times num wd)
  (if (equal? num 1)
      (se wd)
      (se wd (times (- num 1) wd))))

(define (expand sent)
  (if (equal? (count sent) 1)
      (se sent)
      (if (number? (first sent))
          (se (times (first sent) (first (bf sent)))
              (expand (bf (bf sent))))     
          (se (first sent)
              (expand (bf sent))))))
#| 
output:
> (expand '(4 calling birds 3 french hens))
'(calling calling calling calling birds french french french hens)
|#

;Ex 14.9
(define (location wd sent)
  (if (equal? (count sent) 1)
      (if (equal? wd (first sent))
          1
          #f)
      (if (equal? wd (first sent))
          1
          (if (location wd (bf sent))
              (+ 1 (location wd (bf sent)))
              #f))))
#|
I initially had problems with handling the #f value returned if the target string was not found
I then realized I needed to test the value, if 'not false', I could add it to one and make another 
call to locate
if 'false', then just to return #f as the value
output:
> (location 'me '(me))
1
> (location 'me '(you))
#f
> (location 'me '(you me))
2
> (location 'me '(you you))
#f
> (location 'me '(you never give me your money))
4
> 
|#

;Ex 14.10
(define (count-adjacent-duplicates sent)
  (cond ((equal? (count sent) 0) 0)
        ((equal? (count sent) 1) 0)
        ((equal? (count sent) 2) (if (equal? (first sent) (first (bf sent)))
                                     1
                                     0))
        (else (if (equal? (first sent) (first (bf sent)))
                  (+ 1 (count-adjacent-duplicates (bf sent)))
                  (+ 0 (count-adjacent-duplicates (bf sent)))))))
#|
output:
> (count-adjacent-duplicates '(y a b b a d a b b a d o o))
3
> (count-adjacent-duplicates '(yeah yeah yeah))
2
> (count-adjacent-duplicates '(one two three))
0
|#

;Ex 14.11
(define (remove-adjacent-duplicates sent)
    (cond ((equal? (count sent) 0) sent)
        ((equal? (count sent) 1) sent)
        ((equal? (count sent) 2) (if (equal? (first sent) (first (bf sent)))
                                     (se (bf sent))
                                     (se sent)))
        (else (if (equal? (first sent) (first (bf sent)))
                  (se (remove-adjacent-duplicates (bf sent)))
                  (se (first sent) (remove-adjacent-duplicates (bf sent)))))))
  
#|
output:
> (remove-adjacent-duplicates '(y a b b a d a b b a d o o))
'(y a b a d a b a d o)
> (remove-adjacent-duplicates '(yeah yeah yeah))
'(yeah)
> (remove-adjacent-duplicates '())
'()
> (remove-adjacent-duplicates '(yeah yeah))
'(yeah)
> 
|#

;Ex 14.12
(define (square num)
  (* num num))

(define (progressive-squares? sent)
  (cond ((equal? (count sent) 0) #F)
        ((equal? (count sent) 1) #F)
        ((equal? (count sent) 2) 
         (if (equal? (square (first sent)) (first (bf sent)))
             #T
             #F))
        (else (and (equal? (square (first sent)) (first (bf sent)))
                   (progressive-squares? (bf sent))))))
#|
output:
> (progressive-squares? '(0))
#f
> (progressive-squares? '(0 1))
#f
> (progressive-squares? '(1 1))
#t
> (progressive-squares? '(2 3))
#f
> (progressive-squares? '(2 4))
#t
> (progressive-squares? '(2 4 15 225))
#f
> (progressive-squares? '(2 4 16 256))
#t
> (progressive-squares? '(3 9 81 6561))
#t
> (progressive-squares? '(25 36 49 64))
#f
> 
|#

;Ex 14.13
; not done

;Ex 14.14
(define (same-shape? sent1 sent2)
  (and (equal? (count sent1) (count sent2))
       (if (equal? (count sent1) 1)
           (equal? (count sent1) (count sent2))
           (and (equal? (count (first sent1)) (count (first sent2)))
                (same-shape? (bf sent1) (bf sent2))))))
#|
output:
> (same-shape? '(blah) '(blah))
#t
> (same-shape? '(blah) '(blah))
#t
> (same-shape? '(blah) '(hlab))
#t
> (same-shape? '(blah) '(blah one))
#f
> (same-shape? '(blah one two) '(blah one two))
#t
> (same-shape? '(the fool on the hill) '(you like me too much))
#t
> (same-shape? '(the fool on the hill) '(and your bird can sing))
#f
> 
|#

;Ex 14.15
(define (merge sent1 sent2)
  (cond ((equal? (count sent1) 0) sent2)
        ((equal? (count sent2) 0) sent1)
        (else (if (< (first sent1) (first sent2))
                  (se (first sent1) (merge (bf sent1) sent2))
                  (se (first sent2) (merge (bf sent2) sent1))))))

#|
> (merge '(1 3 5) '(10 11 12))
'(10 11 12 1 3 5)
> (oops, I think I put a > instead of a < sign)

corrected version:
> (merge '(1 3 5) '(10 11 12))
'(1 3 5 10 11 12)
> (merge '(1 3 5) '(2 4 7 11 12))
'(1 2 3 4 5 7 11 12)
> (merge '() '(10 11 12))
'(10 11 12)
> (merge '(0) '(10 11 12))
'(0 10 11 12)
> (merge '(4 7 18 40 99) '(3 6 9 12 24 36 50))
'(3 4 6 7 9 12 18 24 36 40 50 99)
> 
|#

;Ex 14.16
;Not Done (usually because it looks like it will take a while to do without significant 
;additional educational value)

                  
  


      
       
       


          