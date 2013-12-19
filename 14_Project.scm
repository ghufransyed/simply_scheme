;number-name project (just after ch 14)
(define (number-name num)
  (cond  ((equal? (power_index num) 0) (3block num))
         ((equal? num '()) (3block 0))
         (else (se (3block (split_number num))
                   (item (power_index num)
                         '(thousand million billion trillion
                                    quadrillion quintillion sextillion
                                    septillion octillion nonillion 
                                    decillion))
                   (number-name (if (string? ((repeated bf (count (split_number num))) num))
                           (string->number ((repeated bf (count (split_number num))) num))
                           ((repeated bf (count (split_number num))) num)))))))

(define (power_index num)
  (if (equal? (modulo (count num) 3) 0)
      (- (quotient (count num) 3) 1)
      (quotient (count num) 3)))

;need a procedure to remove the right side of the number in groups of 3
(define (split_number num)
  (cond ((or (equal? (count num) 0)
          (equal? (count num) 1)
          (equal? (count num) 2)
          (equal? (count num) 3)) num)
        ((equal? (modulo (count num) 3) 0) 
         ((repeated bl (- (count num) 3)) num))
        (else ((repeated bl (- (count num) (modulo (count num) 3))) num))))

(define (remnant_number num)
  (if (string? ((repeated bf (count (split_number num))) num))
      (string->number ((repeated bf (count (split_number num))) num))
                           ((repeated bf (count (split_number num))) num)))
      

(define (3block num)
  (cond ((not (number? num)) '(This is not a number))
        ((equal? (count num) 1) (digit (first num)))
        ((equal? (count num) 2) (two_digit num))
        ((equal? (count num) 3) (three_digit num))
        (else #F)))


;procedure digit takes a one digit number, and returns the corresponding word number
(define (digit num)
  (se (item (+ num 1)'(() one two three four five six seven eight nine))))

; procedure teen takes a two digit number, assumes the first digit is 1, and returns the corresponding word number
(define (teen num)
  (if (equal? (last num) 0)
      '(ten)
      (se (item (bf num) '(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)))))


; procedure two_digit takes  two digit number, and returns the corresponding word number
(define (two_digit num)
  (case (first num)
    ((0) (digit num))
    ((1) (teen num))
    ((2) (if (equal? (last num) 0)
             '(twenty)
             (se '(twenty) (digit (last num)))))
    ((3) (if (equal? (last num) 0)
             '(thirty)
             (se '(thirty) (digit (last num)))))
    ((4) (if (equal? (last num) 0)
             '(forty)
             (se '(forty) (digit (last num)))))
    ((5) (if (equal? (last num) 0)
             '(fifty)
             (se '(fifty) (digit (last num)))))
    ((6) (if (equal? (last num) 0)
             '(sixty)
             (se '(sixty) (digit (last num)))))
    ((7) (if (equal? (last num) 0)
             '(seventy)
             (se '(seventy) (digit (last num)))))
    ((8) (if (equal? (last num) 0)
             '(eighty)
             (se '(eighty) (digit (last num)))))
    ((9) (if (equal? (last num) 0)
             '(ninety)
             (se '(ninety) (digit (last num)))))))   
    
    
; procedure three_digit takes a three digit number, and returns the corresponding word number
(define (three_digit num)
  (if (equal? (bf num) "00")
      (se (digit (first num)) 'hundred)
      (se (digit (first num)) 'hundred (two_digit (bf num)))))

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

#|
output:
> (number-name 5513345)
'(five million five hundred thirteen thousand three hundred forty five)
> (number-name (factorial 20))
'(two quintillion four hundred thirty two quadrillion nine hundred two trillion eight billion one hundred seventy six million six hundred forty thousand)
> (number-name 1000529)
'(one million five hundred twenty nine)
> (number-name 13)
'(thirteen)
> 
|#


  
    
    
  
    
    