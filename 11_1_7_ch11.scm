;Ex 11.1 [not done]
;Ex 11.2
#|(define (count-ums snt)
  (appearances 'um snt))
|#

(define (count-ums sent)
  (cond ((equal? (count sent) 0) 0)
        ((equal? 'um (first sent))
         (+ 1 (count-ums (bf sent))))
        (else (count-ums (bf sent)))))

#| [correct output]
(count-ums
   '(today um we are going to um talk about the combining um method))
|#

;Ex 11.3
(define (unspell-letter letter)
  (cond ((member? letter 'abc) 2)
	((member? letter 'def) 3)
	((member? letter 'ghi) 4)
	((member? letter 'jkl) 5)
	((member? letter 'mno) 6)
	((member? letter 'prs) 7)
	((member? letter 'tuv) 8)
	((member? letter 'wxy) 9)
	(else 0)))

(define (phone-unspell wd)
  (if (equal? (count wd) 1) 
      (unspell-letter wd)
      (word (unspell-letter (first wd))
            (phone-unspell (bf wd)))))

;Ex 11.5
(define (initials sent)
  (if (equal? (count sent) 1)
      (first (first sent))
      (se (first (first sent)) (initials (bf sent)))))
; Ex 11.6
(define (countdown num)
  (if (equal? num 0)
      (se 'Blastoff!)
      (se num (countdown (- num 1)))))
;Ex 11.7
(define (copies num wd)
  (if (equal? num 0)
      (se wd)
      (se wd (copies (- num 1) wd))))




      