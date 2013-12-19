;Ex 9.8
#|(define (hang-letter letter guesses)
  (if (member? letter guesses)
      letter
      '_))
|#
;do NOT use the above helper procedure, 
;use an anonymous function instead, BASED ON the helper procedure
;using 'every is only possible when passing one function 
;and one other argument
;by using an anonymous function, the guesses argument
;does not need to be passed to every, as it is within the 
;scope of the overall function

(define (hang secretword guesses)
  (every (lambda (x)
           (if (member? x guesses)
               x
               '_))
         secretword))