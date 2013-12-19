;8.4
(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (ends-vowel? wd)
  (vowel? (last wd)))

(define (even-count? wd)
  (even? (count wd)))

(define (choose-beatles wd)
  (keep wd '(george ringo paul john)))
;8.5
(define (transform-beatles wd)
  (every wd '(john paul george ringo)))
(define (amazify name)
       (word 'the-amazing- name))



