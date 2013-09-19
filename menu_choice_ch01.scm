(load "Documents/scheme/functions.scm")
(define (choices menu)
  (if (null? menu)
      '(())
      (let ((smaller (choices (cdr menu))))
        (reduce append
                (map (lambda (item) (prepend-every item smaller))
                     (car menu))))))
(define (prepend-every item 1st)
  (map (lambda (choice) (se item choice)) 1st))

