;Ex 12.1

(define (addup nums)
  (if (= (count nums) 1)
      nums
      (+ (first nums) (addup (bf nums)))))

;Ex 12.2
(define (acronym sent)
  (if (= (count sent) 1)
      (first (first sent))
      (word (first (first sent))
            (acronym (bf sent)))))


#|
(define (acronym sent) ;;wrong version
  (if (= (count sent) 1)
      (first sent)
      (word (first (first sent))
            (acronym (bf sent)))))
  |#
  
;Ex 12.3
;factorial (-1) is not defined mathematically

;Ex 12.4
(define (f sent)
  (if (empty? sent)
      sent
      (se (f (butfirst sent))
          (first sent))))

#| f reverses the order of the sentence
> (f '(the united states of america))
'(america of states united the)
 |#

;Ex 12.5
(define (exaggerate sent)
  (se 
   (cond ((empty? sent) '() )
         ((number? (first sent)) (se (* 2 (first sent)) (bf sent)))
         ((equal? (first sent) 'good) (se 'great (bf sent)))
         ((equal? (first sent) 'bad)  (se 'terrible (bf sent)))
         (else (se (first sent) (exaggerate (bf sent)))))))
;Ex 12.6
(define (base-grade grade)
  (cond ((equal? grade 'A) 4)
        ((equal? grade 'B) 3)
        ((equal? grade 'C) 2)
        ((equal? grade 'D) 1)
        (else              0)))

(define (grade-modifier grade)
      (cond ((equal? grade '+) +0.33)
            ((equal? grade '-) -0.33)
            (else              0)))

(define (grade-cum sent)
   (if (equal? (count sent) 1)
      (+ (base-grade (first (first sent))) (grade-modifier (last (first sent))))
      (+ (base-grade (first (first sent)))
          (grade-modifier (last (first sent)))
          (grade-cum (bf sent)))))

(define (gpa sent)
  (/ (grade-cum sent) (count sent)))


;Ex 12.7
(define (spell-digit digit)
  (item (+ 1 digit)
        '(zero one two three four five six seven eight nine)))

(define (spell-number num)
  (if (equal? (count num) 1)
      (spell-digit num)
      (se (spell-digit (first num))
          (spell-number (bf num)))))
                  
;Ex 12.8

(define (return-numbers wd)
  (if (number? wd)
      wd
      '()))

(define (numbers sent)
  (if (equal? (count sent) 1)
      (return-numbers sent)
      (se (return-numbers (first sent))
          (numbers (bf sent)))))

;Ex 12.9
(define (real-words sent)
  (if (equal? (count sent) 1)
      (if (real-word? (first sent))
          (se sent)
          '())
      (se (real-words (se (first sent)))
          (real-words (bf sent)))))
  
  
(define (real-word? wd)
  (not (member? wd '(a the an in of and for to with))))

#| before this version, I ran into a problem where the function
'first' returns a word, but the 'count' function in the first 'if'
statement requires a sentence to work properly (so it sends 1 word
to real-word?). This is why the second branch of the first if statement
 (se (real-words (se (first sent)))... uses '(first sent) to extract the 
first word, but then uses (se (first sent)) to convert it back into a 
sentence before passing it to real-words
count can then use the received sentence to make sure that sent
consists of one word before that part of the program calls 
real-word? However, real-word? expects a word, so (first sent)
is used to extract the word again from the (one word) sentence
|#

;Ex 12.10
(define (remove wd sent)
  (if (equal? (count (se sent)) 1)
      (if (equal? wd sent)
          '()
          sent)
      (se (remove wd (first sent))
          (remove wd (bf sent)))))
      
;Ex 12.11
(define (count arg)
  (if (word? arg)
      (count-letters arg)
      (length arg)))
      
   
(define (count-letters wd)
  (if (equal? wd "")
      0
      (+ 1 (count-letters (bf wd)))))

;Ex 12.12
(define (roman-value letter)
  (cond ((equal? letter 'I) 1)
        ((equal? letter 'V) 5)
        ((equal? letter 'X) 10)
        ((equal? letter 'L) 50)
        ((equal? letter 'C) 100)
        ((equal? letter 'D) 500)
        ((equal? letter 'M) 1000)
        (else 0)))

      
(define (arabic wd)
  (cond ((equal? (count wd) 1) (roman-value wd))
        ((equal? (count wd) 2) (roman-pair wd))
        (else (if (< (roman-value (first wd))
                     (roman-value (first (bf wd))))
                  (+ (roman-pair wd)
                      (arabic (bf (bf wd))))
                  (+ (arabic (first wd))                            
                      (arabic (bf wd)))))))
         
(define (roman-pair wd)
  (if (< (roman-value (first wd))
          (roman-value (first (bf wd))))
      (- (roman-value (first (bf wd)))
         (roman-value (first wd)))
       (+ (roman-value (first wd))
          (roman-value (first (bf wd))))))

#|first attempt
tried processing pairs,  sequentially eg for ABCD
AB, then BC, then CD
but the function I wrote would 'ignore' the second value
It also gave the wrong values for two character arguments e.g IX

I had to change it so that there was a test in the second 
part of the function, if a pair was a 'special' pair, in this 
case, where second character was bigger than the first,
it would call a different function (roman-pair) that would return
the value of the pair as a whole, otherwise, the other branch of the 
if would call 'arabic' with the first character and the remainder
i.e process the word one character at a time, unless a special pair
was encountered. 

(define (arabic wd)
  (cond ((equal? (count wd) 1) (roman-value wd))
        ((equal? (count wd) 2) (roman-pair wd))
        (else (se (arabic (se (first wd)
                              (first (bf wd))))
                  (arabic (bf wd))))))


(define (roman-pair wd)
  (if (< (roman-value (first wd))
          (roman-value (first (bf wd))))
      (- (roman-value (first wd)))
          (roman-value (first (bf wd))))
       (+ (roman-value (first wd))
          (roman-value (first (bf wd))))))
|#
#| another attempt
(define (arabic wd)
  (cond ((equal? (count wd) 1) (roman-value wd))
        ((equal? (count wd) 2) (roman-word wd)
        (else (se (arabic (se (item 1 wd)
                              (item 2 wd)))
                 (arabic (bf wd))))))

(define (roman-word wd)
  (cond ((empty? (butfirst wd)) 
    ((< (roman-value (first wd))
            (roman-value (last wd))) (- (roman-value (first wd))))
        (else (roman-value (first wd))) 
|#     


;Ex12.13
(define (describe-time num)
  (cond ((<= num 60)    (se num 'seconds))
        ((<= num 3600)  (se (/ (- num (modulo num 60))
                             60)
                           'minutes
                           (describe-time (modulo num 60))))
        ((<= num 86400) (se (/ (- num (modulo num 3600))
                             3600)
                           'hours
                           (describe-time (modulo num 3600))))
        ((<= num 604800) (se (/ (- num (modulo num 86400))
                             86400)
                           'days
                           (describe-time (modulo num 86400))))
         ((<= num 31557600) (se (/ (- num (modulo num 604800))
                             604800)
                           'weeks
                           (describe-time (modulo num 604800))))
         ((<= num 3155760000) (se (/ (- num (modulo num 31557600))
                             31557600)
                           'years
                           (describe-time (modulo num 31557600))))
         (else (se (/ (- num (modulo num 3155760000))
                             3155760000)
                           'century
                           (describe-time (modulo num 3155760000))))))

;I didn't do last bit about making the program say '1 century' and '2 centuries'
; because it seemed trivial

      

  
              