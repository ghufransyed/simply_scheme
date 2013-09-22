(define (vowel? letter)
  (member? letter '(a e i o u)))
(define (square x)
  (* x x))

;8.1
(every last '(algebra purple spaghetti tomato gnu))
;should return '(a e i o u) [correct]
(keep number? '(one two three four))
;should return '() [correct]
(accumulate * '(6 7 13 0 9 42 17))
;should return 0 [correct]
(member? 'h (keep vowel? '(t h r o a t)))
;should return #f [correct]
(every square (keep even? '(87 4 7 12 0 5)))
;should return '(16 144 0) [correct]
(accumulate word (keep vowel? (every first '(and i love her))))
;should return '(ai) [correct]
((repeated square 0) 25)
;should return 25 [correct]
(every (repeated bl 2) '(good day sunshine))
;should return '(go d sunshi) [correct], applies (repeated bl 2) 
;to each member of '(good day sunshine)

;8.2
;(keep vowel? 'birthday) [correct]
;(every first '(golden slumbers)) [correct]
;(first '(golden slumbers) [correct]
;(every last '(little child)) [correct]
;(accumulate word (every last '(little child))) [correct]
;(every + '(2 3 4 5)) [correct]
;(accumulate + '(2 3 4 5)) [correct]

;8.3
;(define (f a)
;   (keep even? a))
;domain sentence of one or more numbers
;returns a sentence of the even numbers from a [correct]

;(define (g b)
;   (every b '(blue jay way)))
;domain: function
;applies function b to every element of '(blue jay way) [correct]

;(define (h c d)
;   (c (c d)))
;takes a function as argument c and sentence with numbers / words
;as required by function c
;function h then applies that to the actual argument d twice in succession [correct]

;(define (i e)
;  (/ (accumulate + e) (count e)))
;takes numeric argument e (sentence of numbers)
; then adds all the elements and divides by the number of elements
; in other words, calculates the arithmetic mean (average) [correct]

;accumulate
;takes a function as an argument that in turn operates on pairs of items from a sentences (lists) of numbers or words
;sqrt 
;takes a real number, and returns another real number, that when squared, gives the input number
;repeated
;takes a function whose input is the same type as the output e.g. real -> real or word -> word
;it then applies it multiple times, feeding the output from one application of the function
;as the input of the next application of the function

;(repeated sqrt 3)
;repeats the sqrt function 3 times = 8th root
;(repeated even? 2)
;this takes a number as input, and has boolean output
;it therefore cannot used as argument to repeated
;(repeated first 2)
;this is a function that applies the first function twice
;(repeated (repeated bf 3) 2)
;this is a function that repeats bf function 3 times and then
;is in turn repeated  twice
; the effect is that of the bf function applied 6 times in series
;i.e. the output of each function is the input of the next 
;successive function

