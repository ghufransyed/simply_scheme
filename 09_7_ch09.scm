;Ex 9.7
(define (keeper letter)
  (lambda (sent)
    (keep (lambda (wd) (member? letter wd)) sent)))
(define (letterwords letter sent)
  ((keeper letter) sent))

; correct (output below)
#|> (letterwords 'o '(got to get you into my life))
'(got to you into)|#

