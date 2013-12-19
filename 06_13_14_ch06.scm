;6.13 not done
;6.14
(define (describe-time num)
  (cond ((< num 60) (sentence num 'seconds))
        ((< num 3600) (sentence (/ num 60.) 'minutes))
        ((< num 86400) (sentence (/ num (* 60. 60)) 'hours))
        ((< num 604800) (sentence (/ num (* 60. 60 24)) 'days))
        ((< num 31449600) (sentence (/ num (* 60. 60 24 7)) 'weeks))
        ((< num 3144960000) (sentence (/ num (* 60. 60 24 7 52)) 'years))
        ((< num 314496000000) (sentence (/ num (* 60. 60 24 7 52 100)) 'centuries))
        ))
;no adjustment made for leap years
;if needed, change the multiplier for weeks / year to (365.25/7)
  