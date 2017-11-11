;;; Example { w: w1bbbw2 or #2a }

(define simulate
  (lambda (dfa input)
    (cons (current-state dfa)               ; start state
          (if (null? input)
              (if (infinal? dfa) '(accept) '(reject))
            (simulate (move dfa (car input)) (cdr input))))))

;; access functions for machine description:
(define current-state car)
(define transition-function cadr)
(define final-states caddr)
(define infinal?
  (lambda (dfa)
    (memq (current-state dfa) (final-states dfa))))

(define move
  (lambda (dfa symbol)
    (let ((cs (current-state dfa)) (trans (transition-function dfa)))
      (list
       (if (eq? cs 'error)
           'error
         (let ((pair (assoc (list cs symbol) trans)))
           (if pair (cadr pair) 'error)))   ; new start state
       trans                                ; same transition function
       (final-states dfa)))))               ; same final states

   
(define w1-bbb-w2-or-2a-dfa
  '(q1                                                 ; start state
   (      ;a          b                                ; transition fn
     ((q1 0) q2) ((q1 1) q3)                        
     ((q2 0) q1) ((q2 1) q4)
     ((q3 0) q2) ((q3 1) q5)
     ((q4 0) q1) ((q4 1) q6) 
     ((q5 0) q2) ((q5 1) q7)
     ((q6 0) q1) ((q6 1) q7)
     ((q7 0) q7) ((q7 1) q7)
    )
   (q1 q3 q5 q7)))                                             ; final states
   
(define test1 ; abbb
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(0 1 1 1 1))))  ; input string

 
(define test2 ; ababb
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(0 1 0 1 1 ))))  ; input string 

(define test3 ; bbb
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(1 1 1))))  ; input string
   
(define test4 ; aa
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(1 1 ))))  ; input string 
 
(define test5 ; abbbaa
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(0 1 1 1 0 0 ))))  ; input string 
   
(define test6 ; abababa
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(0 1 0 1 0 1 0 ))))  ; input string 


(define test7 ; babbaabababb
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(1 0 1 1 0 0 1 0 1 0 1 1))))  ; input string 