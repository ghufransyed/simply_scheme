(first 'banana)
(first ''banana)

;the output is
;'banana for the first and
;'quote for the second

; this is because 'banana is equivalent to 
;(quote banana)
;therefore ''banana is equivalent to 
;(quote (quote banana))
;of which the first element is quote