(define (scientific number exponent)
  (* number (expt 10 exponent)))

(define (log10 n)
    (/ (log n) (log 10)))

(define (sci-exponent n)
    (floor (log10 n)))

(define (sci-coefficient n)
   (expt 10  (- (log10 n) (floor (log10 n)))))
