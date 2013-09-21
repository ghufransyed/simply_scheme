(define (tip bill)
  (/ (round (* 100 (- (ceiling (* 1.15 bill)) bill))) 100.0))

