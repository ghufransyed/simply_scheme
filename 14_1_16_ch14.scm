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
                                 

          