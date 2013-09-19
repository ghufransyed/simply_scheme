(load "Documents/scheme/functions.scm")

(define (combinations size set)
  (cond ((= size 0) '(()))
	((empty? set) '())
	(else (append (prepend-every (first set)
				     (combinations (- size 1)
						   (butfirst set)))
		      (combinations size (butfirst set))))))

(define (prepend-every item lst)
  (map (lambda (choice) (se item choice)) lst))

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

