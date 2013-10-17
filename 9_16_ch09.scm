;Ex 9.16
(define (aplize f)
  (lambda (x)
    (if (word? x)
        (f x)
        (every f x))))
     
#| [correct!]
output:
> (define apl-sqrt (aplize sqrt))
> (apl-sqrt 36)
6
> (apl-sqrt '(1 100 25 16))
'(1 10 5 4)
|#

#| initial (incorrect) version
(define (aplize f)
  (lambda (x)
    (every f x)))
for (apl-sqrt 36)
this would give approx 1.7 and 2.44
took me a while to figure out those were the square
roots of '3' and '6'
the EVERY function, applied to a word, applies the 
function in the first argument to each LETTER OF THE 
second argument, hence the need for an if statement 
to test whether the argument passed to the returned 
function (x) is a word or a sentence
|#


    
