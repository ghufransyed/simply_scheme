;Ex 9.12
(define (first-last sent1)
  (keep (lambda (x)
          (equal? (first x) (last x)))
        sent1))

#| [correct]
[output below]
> (first-last '(california ohio nebraska alabama alaska massachusetts))
'(ohio alabama alaska)
|#

