#|Ex 9.6
Write a procedure sentence-version that takes a function f 
as its argument and returns a function g. 
f should take a single word as argument.
g should take a sentence as argument and return 
the sentence formed by applying f to each word 
of that argument.|#
(define (square x)
  (* x x))

(define (sentence-version f)
  (lambda (x) (every f x)))

#| [correct] - output below
> ((sentence-version square) '(8 2 4 6))
'(64 4 16 36)
> ((sentence-version first) '(if if fell))
'(i i f)
|#
