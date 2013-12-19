(define (square x)
  (* x x))

(first (square 7))
(first '(square 7))

;the first calls the square function, returns '49', and applies 'first' to it, giving '4'
;the second appliex the 'first' function to the sentence 'square 7' and therefore returns 'square