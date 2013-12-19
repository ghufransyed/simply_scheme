;Ex 9.15
(define (type-check f pred)
  (lambda (x)
    (if (pred x)
        (f x)
        #f)))
#|
[correct!]
> (define safe-sqrt (type-check sqrt number?))
> (safe-sqrt 16)
4
> (safe-sqrt 'sarsaparilla)
#f
|#




#|
[incorrect]
(define (type-check f pred)
  (if (lambda (x)
        (pred x))
      (lambda (x)
        (f x))
      (lambda (x)
        (pred x))
      ))
I think the lambda's return a function, and function itself
is evaluated as #t, so the first branch of the if always executes
|#