;8.8
(define (hyper_thing thing)
    (cond ((equal? thing 'good) '(great))
          ((equal? thing 'bad) '(terrible))
          ((equal? thing 'nice) '(fabulous))
          (else (if (number? thing)
                    (* 2 thing)
                    thing))))
(define (exaggerate sent)
  (every hyper_thing sent))

;8.9
;sentence
;sentence
;sentence

;8.10
(define (true-for-all? pred sent)
  (if (equal? (count sent) (count (keep pred sent)))
      #t
      #f))

