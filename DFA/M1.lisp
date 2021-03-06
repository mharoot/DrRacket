;;; Example 10.21 (Figure 10.1)

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

(define zero-one-even-dfa
 '(q0                                                 ; start state
   (((q0 0) q2) ((q0 1) q1) ((q1 0) q3) ((q1 1) q0)   ; transition fn
    ((q2 0) q0) ((q2 1) q3) ((q3 0) q1) ((q3 1) q2))
   (q0)))                                             ; final states

(define test1
  (lambda ()
    (simulate
     zero-one-even-dfa  ; machine description
     '(0 1 1 0 1))))    ; input string

(define test2
  (lambda ()
    (simulate
     zero-one-even-dfa  ; machine description
     '(0 1 0 0 1 0))))  ; input string
  
(define w1-bbb-w2-dfa
  '(q1                                                 ; start state
   (      ;a          b                                ; transition fn
     ((q1 0) q2) ((q1 1) q3)                        
     ((q2 0) q1) ((q2 1) q3)
     ((q3 0) q1) ((q3 1) q4)
     ((q4 0) q2) ((q4 1) q5) 
     ((q5 0) q5) ((q5 1) q5)
    )
   (q5)))                                             ; final states

(define test-w1-bbb-w2-dfa
  (lambda ()
    (simulate
     w1-bbb-w2-dfa ; machine description
     '(1 1 0 1 1 1 0 1 0 1 0 ))))  ; input string 
   
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

(define test3
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(0 1 1 0 1 0))))  ; input string
   
(define test4
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(0 1 1 1 ))))  ; input string 
 
(define test5
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(1 1 0 1 1 0 1 1 0 ))))  ; input string 
   
(define test6
  (lambda ()
    (simulate
     w1-bbb-w2-or-2a-dfa ; machine description
     '(0 1 1 0 1 1 0 1 1 0 ))))  ; input string 
