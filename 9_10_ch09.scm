;Ex 9.10
(define (appearances_9_9 arg1 arg2)
  (/ (count (keep (lambda (y)
          (member? y arg1))
        arg2))
     (count arg1)))



  
  