;7.1
(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (gertrude wd)
  (let ((v_article (if (vowel? (first wd))
                       'an
                       'a)))
      (se v_article wd 'is v_article wd 'is v_article wd)))
;7.2
(let ((pi 3.14159)
      (pie '(lemon meringue)))
     (se 'pi 'is pi 'but 'pie 'is pie))

;7.3
(define (superlative adjective wd)
  (se (word adjective 'est) wd))
; in given version, word is used as both procedure and formal argument, giving the error

;7.4
(define (sum-square a b)
  (let ((+ *)
        (* +))
    (* (+ a a) (+ b b))))
; it squares each number, then adds the squares
; it does this by substituting + for * and * for +






