;Ex9.13
(define (compose f g)
  (lambda (x)
    (f (g x))))

#| [correct]
[output below]
> ((compose sqrt abs) -25)
5
> (define second (compose first bf))
> (second '(higher order function))
'order
|#
