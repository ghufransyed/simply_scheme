;(define (second stuff)
;   (first (bf stuff)))
(define second (lambda (stuff) (first (bf stuff))))
;[correct]
;(define (make-adder num)
;    (lambda (x) (+ num x)))

(define make-adder (lambda (num) (lambda (x) (+ num x))))
;[correct]

;9.3
(define (let-it-be sent)
  (accumulate (lambda (x y) y) sent))
;this takes a sentence as an argument
;the lambda takes two arguments, and returns the second one
;it returns all but the first element [incorrect]
;actually only returns last element
;accumulate applies the first argument which is a function
;to each element of the second argument successively
;applying the function to element 1 and element 2
;then applying the function to the RESULT of the previous step
;and the next element (element 3 in this case)
;BUT the function returned by lambda returns the second argument
;of 2. so the function returns in turn, element 2, element 3, 
;until it finally returns the final element
