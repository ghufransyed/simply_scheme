;6.1
(cond ((= 3 4) '(this boy))
      ((< 2 5) '(nowhere a man))
      (else    '(two of us)))

;returns '(nowhere a man) [correct]

(define (square x)
  (* x x))

(cond (empty? 3)
      (square 7)
      (else 9))

;"returns 49 (if square defined)"
;[WRONG: (empty? 3) would return false, but as it stands
;empty? alone is taking the place of the predicate, so is equivalent to
; (empty? ) which returns an error != false and therefore evaluates to true
;therefore the cond evaluates to 3


(define (third-person-singular verb)
  (cond ((equal? verb 'be) 'is)
        ((equal? (last verb) 'o) (word verb 'es))
        (else (word verb 's))))
;returns the appropriate 3rd person singular so 'be' returns 'is'
;echo returns echoes
;run returns runs
;[CORRECT]

;------------------------
;6.2
;predict what will be printed
(or #f #f #f #t)
;#t
(and #f #f #f #t)
;#f
(or (= 2 3) (= 4 3))
;#f
(not #f)
;#t
(or (not (= 2 3)) (= 4 3))
;#t
(or (and (= 2 3) (= 3 3)) (and (< 2 3) (< 3 4)))
;#t
;[ALL CORRECT FOR 6.2]
;---------------------------------------------
;6.3

(define (sign number)
  (cond ((< number 0) 'negative)
        ((= number 0) 'zero)
        (else 'positive)))

;--------------------------------------------------
;6.4
(define (utensil meal)
  (if (equal? meal 'chinese)
      'chopsticks
      'fork))

