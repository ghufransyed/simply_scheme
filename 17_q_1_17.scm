#| Ex 17.1
 | (car '(Rod Chris Colin Hugh Paul)) -> 'Rod [correct]
 | (cadr '(Rod Chris Colin Hugh Paul)) -> 'Chris [correct]
 | (cdr '(Rod Chris Colin Hugh Paul)) -> '(Chris Colin Hugh Paul) [correct]
 | (car 'Rod) ->  error [correct]
 | (cons '(Rod Argent) '(Chris White)) -> '((Rod Argent) Chris White)[correct]
 | (append '(Rod Argent) '(Chris White)) ->'(Rod Argent Chris White)[correct]
 | (list '(Rod Argent) '(Chris White)) ->'('(Rod Argent) '(Chris White))[correct]
 | (caadr '((Rod Argent) (Chris White)
 |     (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
 |     ->'Chris[correct]
 |(assoc 'Colin '((Rod Argent) (Chris White)
           (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
 | -> '(Colin Blunstone) [correct]
 | (assoc 'Argent '((Rod Argent) (Chris White)
		   (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
 |  ->#F[correct]
|#


#| Ex 17.2
 | input  '(a b c) '(d e f)
 | output needed ((B C D))
 |#

(define (f1 arg1 arg2)
  (list(append (cdr arg1)(list (car arg2)))))

#| output needed ((B C) E) |#

(define (f2 arg1 arg2)
    (list (cdr a1)
          (cadr a2)))

; output needed (A B C A B C)

(define (f3 arg1 arg2)
    (append arg1 arg2))

; output needed ((A D) (B C E F))

(define (f4 arg1 arg2)
    (list (append (list (car arg1))
                  (list (car arg2)))
          (append (cdr arg1)
                  (cdr arg2))))

#| 17.3
 | describe the value returned by this invocation of map:
 | (map (lambda (x) (lambda (y) (+ x y))) '(1 2 3 4))
 |
 | returns  a list of four functions
 | the first takes one argument and adds it to 1
 | the second takes one argument and adds it to 2
 | the third takes one argument and adds it to 3
 | the fourth takes one argument and adds it to 4
 |
|#

#| 17.4
 | returns the last element of the list -> wrong
 | reverses the elements of the list
 | mystery calls mystery helper with other = '()
 | after removing first element, mystery helper calls itself with 
 | lst = cdr of original list and other = first element of list
 | after removing 2nd element of (original) list, mystery helper
 | calls itself with lst as original list minus first 2 elements, and
 | other containing a list with the first two elements reversed until
 | it arrives at base case (lst = '()), by which time 'other' contains
 | the entire original list in reverse order
 |#

#| 17.5
 |#
(define (max2 a b)
  (if (> b a) b a))

(define (max num)
  (cond ((number? num) num)
        ((list? num) (cond ((equal? (length num) 0) #f)
                           ((equal? (length num) 1) (car num))
                           ((equal? (length num) 2) (max2 (car num)
                                                         (cadr num)))
                           (else (max2 (car num)
                                       (max (cdr num))))))))

#| 17.6
 |#

(define (reverse_17 lst)
  (reverse_17-helper lst '()))

(define (reverse_17-helper lst other)
  (if (null? lst)
      other
      (reverse_17-helper (cdr lst) (cons (car lst) other))))

(define (append_17 arg1 arg2)
  (cond ((null? arg1) arg2)
        ((word? arg1) (cons arg1 arg2))
        ((equal? (length arg1) 1) (cons (car arg1)
                                        arg2))
        (else (append_17 (reverse_17 (cdr (reverse_17 arg1)))
                         (cons (car (reverse_17 arg1))
                               arg2)))))

(define a1 '(a b c))
(define a2 '(d e f))
#|
 |(append_17 a1 a2)
 |->  '(a b c d e f)
 |#
