;5.10 if you pass a word to butfirst, it returns a word
; if you pass a sentence to butfirst it returns a sentence

;5.11 if you pass a word to last, it returns a letter
;> (last 'help)
;'p
;> (last '(help me))
;'me
;> (last '((the first) (the second) (the third)))
;'(the third)
;if you pass a sentence to last it returns a word
;if you pass a list of sentences to last it returns a sentence

;5.12 first and last cannot return an empty word or sentence
;butfirst and butlast can return an empty word if passed a one letter word
;butfirst and butlast can return an empty sentence if passed a one word sentence


