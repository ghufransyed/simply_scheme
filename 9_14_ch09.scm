;Ex 9.14
(define (substitute word1 word2 sent1)
  (every (lambda (x) (if (equal? x word2)
                         word1
                         x))
         sent1))

#| [correct]
(substitute 'maybe 'yeah '(she loves you yeah yeah yeah))
'(she loves you maybe maybe maybe)
|#
