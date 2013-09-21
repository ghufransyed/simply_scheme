(define (discount price dscnt)
  (/ (round (* 100 (* price (/ (- 100.0 dscnt) 100.0)))) 100.0))

