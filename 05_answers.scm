#| 5.1
> (sentence 'I '(me mine))
'(I me mine)
> (sentence '() '(is empty))
'(is empty)
> (word '23 '45)
2345
> (se '23 '45)
'(23 45)
> (bf 'a)
""
> (bf '(aye))
'()
> (count (first '(maggie mae)))
6
> (se "" '() "" '())
'("" "")
> (se "" '() "" '())
'("" "")
|#
; 5.2
(define (f1 s1 s2)
  (se (bf s1)
      (bl s2)))
; '(b c d e)

(define (f2 s1 s2)
  (se (f1 s1 s2)
      (word (first s1)
          (last s2))))
;'(b c d e af)

(define (f3 s1 s2)
  (se s1 s1))
;'(a b c a b c)

(define (f4 s1 s2)
  (word (first (bf s1))
        (first (bf s2))))
; 'be
#|
5.3 (first 'mezzanine) applies first to a word
returning a letter, m.
(first '(mezzanine) applies first to a one-word
sentence, returning the first element of the sentence
, 'mezzanine
|#

#|
5.4
(first (square 7)) applies first to the evaluated
result of (square 7), which is 49, returning 4
(first '(square 7)) applies first to the non-evaluated
(quoted) sentence '(square 7), returning 'square

5.5 word makes a word out of the args (three letters)
se makes a sentence out of the three one-letter 
'words'

5.6
no difference

5.7
(bf 'x) returns '' (what is left of the word 'x' after
removal of the first element (letter))
(bf '(x)) returns (), an empty sentence, after removal
of the only 'word' (x) in that sentence
5.8
(here, there and everywhere)  no
(help!) no
(all i've got to do) no
(you know my name (look up the number)) yes (if quoted)

5.9
matt wright
brian harvey

5.10
a word with more than one letter
a sentence that contains more than one word

5.11
a word with more than one letter
a sentence with more than one word

5.12
first and last cannot return an empty word
bf and bl can, if given a word with one letter only

5.13
''banana is equivalent to (quote (quote banana))
|#

;5.14
(define (third thing)
  (item 3 thing))
#|
> (third 'blah)
'a
> (third '(this is the end))
'the
> 
|#
;5.15
(define (first-two wd)
  (word (first wd)
        (first (bf wd))))
;> (first-two 'ambulatory)
;'am

;5.16
(define (two-first wd1 wd2)
  (word (first wd1)
        (first wd2)))
;'be

(define (two-first-sent sent)
  (word (first (first sent))
        (first (last sent))))
;> (two-first-sent '(brian epstein))
;'be

;5.17
(define (knight name)
  (se 'sir name))
#|
> (knight '(david wessel))

'(sir david wessel)
|#
;5.18
(define (ends word)
  (word (first word) (last word)))
; the problem appears to be that 'word' is used
; as parameter (formal argument), when it is 
; already defined as a procedure
; the function body therefore becomes:
; ('john (first 'john) (last 'john)))

;5.19
(define (insert-and sent)
  (se (bl sent)
      'and
      (last sent)))

#|
> (insert-and '(john bill wayne fred joey))
'(john bill wayne fred and joey)
|#

;5.20
(define (middle-names sent)
  (bf (bl sent)))
#|
> (middle-names '(james paul mccartney))
'(paul)
> (middle-names '(john ronald raoul tolkien))
'(ronald raoul)
> (middle-names '(bugs bunny))
'()
> (middle-names '(peter blair denis bernard noone))
'(blair denis bernard)
|#

;5.21
(define (query sent)
  (se (item 2 sent)
      (first sent)
      (bl (bf (bf sent)))
      (word (last sent)
            '?)))
#|
> (query '(you are experienced))
'(are you experienced?)
> (query '(i should have known better))
'(should i have known better?)
|#




















