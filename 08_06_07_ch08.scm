;8.6

(define (phonetic letter)
  (cond ((equal? letter (or 'a 'A)) 'alpha)
        ((equal? letter (or 'b 'B)) 'bravo)
        ((equal? letter (or 'c 'C)) 'charlie)
        ((equal? letter (or 'd 'D)) 'delta)
        ((equal? letter (or 'e 'E)) 'echo)
        ((equal? letter (or 'f 'F)) 'foxtrot)
        ((equal? letter (or 'g 'G)) 'golf)
        ((equal? letter (or 'h 'H)) 'hotel)
        ((equal? letter (or 'i 'I)) 'india)
        ((equal? letter (or 'j 'J)) 'juliet)
        ((equal? letter (or 'k 'K)) 'kilo)
        ((equal? letter (or 'l 'L)) 'lima)
        ((equal? letter (or 'm 'M)) 'mike)
        ((equal? letter (or 'n 'N)) 'november)
        ((equal? letter (or 'o 'O)) 'oscar)
        ((equal? letter (or 'p 'P)) 'papa)
        ((equal? letter (or 'q 'Q)) 'quebec)
        ((equal? letter (or 'r 'R)) 'romeo)
        ((equal? letter (or 's 'S)) 'sierra)
        ((equal? letter (or 't 'T)) 'tango)
        ((equal? letter (or 'u 'U)) 'uniform)
        ((equal? letter (or 'v 'V)) 'victor)
        ((equal? letter (or 'w 'W)) 'whiskey)
        ((equal? letter (or 'x 'X)) 'x-ray)
        ((equal? letter (or 'y 'Y)) 'alpha)
        ((equal? letter (or 'z 'Z)) 'zulu)
        (else 'not a letter)))

(define (words wd)
  (every phonetic wd))

;8.7
(define (letter-count sent)
  (accumulate + (every count sent)))




