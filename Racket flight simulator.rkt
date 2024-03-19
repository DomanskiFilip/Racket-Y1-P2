#lang racket/gui
            
(define game '((list 0 0 0 0 0)
               (list 0 0 0 0 0)
               (list 0 0 0 0 0)
               (list 0 0 0 0 0)
               (list 0 0 0 0 0)))

(define (create-hole game)
  (define random-number (random 5))
  (list-tail game random-number) 
  (append (take game random-number) (list 0) (drop game (+ random-number 1))))

(define start-game(λ (game)
       (set! game (cons (create-hole(list 1 1 1 1 1)) game))
       (set! game (drop-right game 1))
       
       (for/list ([i game])
         (display i)
         (newline))
       (newline)
    
       (sleep 1)
     
       (set! game (cons (list 0 0 0 0 0) game))
       (set! game (drop-right game 1))
       
       (for/list ([i game])
         (display i)
         (newline))
       (newline)
       
       (sleep 1)
       
       (start-game game)))

(start-game game)
