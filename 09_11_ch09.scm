;Ex9.11
(define (unabbrev sent1 sent2)
  (accumulate sentence (every (lambda (x)
                               (if (number? x)
                                   (first ((repeated butfirst (- x 1)) sent2))
                                   x))
                                sent1)))

;[correct]
#| [output]
> (unabbrev '(john 1 wayne fred 4) '(bill hank kermit joey))
'(john bill wayne fred joey)
> (unabbrev '(i 3 4 tell 2) '(do you want to know a secret?))
'(i want to tell you)
|#
                     
