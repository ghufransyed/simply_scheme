;Ex 9.9
(define (common-words sent1 sent2)
  (keep (lambda (x)
          (member? x sent2))
        sent1))
