;4.4
(define (sphere-volume r)
  (* (/ 4 3) 3.141592654)
  (* r r r))
; the first compound expression is ignored, only the second is returned. should be

(define (sphere-volume r)
  (* (/ 4 3) 3.141592654
      r r r))
(define (next x)
  (x + 1)) ; error: (x + 1) should be (+ x 1)
(define (next x)
  (+ x 1))

(define (square)
  (* x x)) ; error is that no formal argument is listed , should be

(define (square x)
  (* x x))

(define (triangle-area triangle)
  (* 0.5 base height)) ; error is that the listed formal argument is not used in the body
; also, the body contains 'base' and 'height' that are not listed formal arguments and 
; so are undefined

#|(define (sum-of-squares (square x) (square y))
  (+ (square x) (square y))) ; error is that square is being used in place of a a formal
; parameter as well as to evaluate an expression
|#

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square x)
  (* x x))

;4.5
(define (f2c f)
  (/ (* 5 (- f 32))
     9))

(define (c2f c)
  (+ (/ (* 9 c)
        5)
     32))

(define (fourth x)
  (* x x x x))

(define (fourth x)
  (square (square x)))

(define (abs-val x)
  (sqrt (square x)))

(define (scientific coeff exp)
  (* coeff (expt 10 exp)))

#|
log(base a) b = log (base k) b / log (base k) a
so log(base 10) x = log (base e) x / log (base e) 10
|#

(define (sci-exponent x)
  (floor (/ (log x)
            (log 10))))

(define (sci-coefficient x)
  (/ x
     (expt 10 (sci-exponent x))))

;4.9
(define (discount price saving)
  (* price (- 1 (/ saving 100))))

;4.10
(define (tip price)
  (- (ceiling (* price 1.15))
     price))










  




