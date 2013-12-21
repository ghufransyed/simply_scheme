; Ch 15 Examples
; sort (name of function changed to sort-new due to previous function with same name)
(define (sort-new sent)
  (if (empty? sent)
      '()
      (se (earliest-word sent)
          (sort-new (remove-once (first (earliest-word sent)) sent)))))
#|Initially ended up in an infinite loop, it turned out that
earliest-word returns a SENTENCE (containing one word), not a WORD
so I had to use (first '(blah)) to return 'blah as a word so that 
remove-once would actually remove it
|#


(define (earliest-word sent)
  (if (equal? (count sent) 1)
      sent
      (if (before? (first sent) (first (bf sent)))
          (earliest-word (se (first sent)
                             (bf (bf sent))))
          (earliest-word (bf sent)))))
              
  
  
(define (remove-once wd sent)
  (if (equal? (count (se sent)) 1)
      (if (equal? wd (first sent))
          '()
          sent)
      (se (remove-once wd (se (first sent)))
          (if (equal? wd (first sent))
              (se (bf sent))
              (remove-once wd (bf sent))))))  

;Example: from-binary
(define (from-binary num)
  (if (equal? (count num) 1)
      (if (equal? num 1)
          1
          0)
      (+ (last num)
         (* 2 (from-binary (bl num))))))

#|output
> (from-binary 00010111)
23
> (from-binary 00101110)
46
> (from-binary 00010111)
23
> (from-binary 01011100)
92
> (from-binary 1001011)
75
> (from-binary 00010111)
23
> (from-binary 0010111)
23
> (from-binary 10010111)
151
> (from-binary 0010111)
23
> (from-binary 1101)
13
> (from-binary 111)
7
|#

;Example: Subsets
      
#|maybe start with full length of word L
then chop word into sections of original length -1
may be best to remove one letter from the original set to get
set of cardinality L-1

basecase = empty set
next most complex |S|=1
then |S|=2

in terms of process, maybe need to start with set cardinality n
then n-1 ... until 1
to allow recursive procedure

|#

(define (subsets thing)
  (remdup (if (sentence? thing)
               (subsets-sent thing)
               (subsets-word thing))))
      
(define (subsets-sent sent)
  (if (equal? (count sent) 1)
      (subsets-word (first sent))
      (se (subsets-word (first sent))
          (subsets-sent (bf sent)))))
  
(define (subsets-word wd)
  (if (equal? (count wd) 1)
      (se wd "")
      (se wd
          (minus-1 wd)
          (subsets (minus-1 wd))
          "")))


#| not needed
(define (split-word wd)
  (if (equal? (count wd) 1)
      wd
      (se (first wd)
          (split-word (bf wd)))))
|#


(define (remove-once-wd ltr wd)
  (if (equal? (count wd) 1)
      (if (equal? ltr wd)
          ""
          wd)
      (if (equal? ltr (first wd))
          (bf wd)
          (word (first wd) (remove-once-wd ltr (bf wd))))))

;write procedure for giving every combination using all the letters
;just realized, not needed (order doesn't matter in a set)
  
; try to define procedure that gives each version of the word with one letter
;missing at a time


(define (minus-1 wd)
  (minus-1-helper wd (count wd)))

(define (minus-1-helper wd counter)
  (if (equal? counter 1)
      (remove-once-wd (item counter wd) wd)
      (se (remove-once-wd (item counter wd) wd)
          (minus-1-helper wd (- counter 1)))))

(define (minus-1-sent sent)
  (if (equal? (count sent) 1)
      (minus-1 (first sent))
      (se (minus-1 (first sent))
          (minus-1-sent (bf sent)))))

;removes duplicates in the results, from 14.3
(define (remdup sent)
  (cond ((equal? (count (se sent)) 1) sent)
        ((equal? (count (se sent)) 2)
         (if (member? (first sent)(bf sent))
             (se (bf sent))
             sent)) 
        ((member? (first sent)(bf sent))
         (remdup (bf sent)))
        (else (se (first sent)
                  (remdup (bf sent))))))


#| Looking at the 'official' version, I'm not sure whether to be pleased that my 
version worked, or depressed at the difference in complexity and length.. :-)
|#
#|(define (subsets wd)                         ;; second version
  (if (empty? wd)
      (se "")
      (se (subsets (bf wd))
          (prepend-every (first wd) (subsets (bf wd))))))
|#

(define (subsets-o wd)
  (if (empty? wd)
      (se "")
      (let ((smaller (subsets (bf wd))))
        (se smaller
            (prepend-every (first wd) smaller)))))


(define (prepend-every letter sent)
  (if (empty? sent)
      '()
      (se (word letter (first sent))
	  (prepend-every letter (bf sent)))))






