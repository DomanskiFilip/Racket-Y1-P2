#lang racket/gui
   
(define game '((vector 0 0 0 0 0)
               (vector 0 0 0 0 0)
               (vector 0 0 0 0 0)
               (vector 0 0 0 0 0)
               (vector 0 0 0 0 0)))

(define start-game(λ (game)
                    
       (let ([vec (vector 1 1 1 1 1)])    
       (vector-set! vec (random 5) 0)
       (set! game (cons vec game)))
                    
       (set! game (drop-right game 1))
       
       (for/list ([i game])
         (display i)
         (newline))
       (newline)
    
       (sleep 1)
     
       (set! game (cons (vector 0 0 0 0 0) game))
                    
       (set! game (drop-right game 1))
       
       (for/list ([i game])
         (display i)
         (newline))
       (newline)
       
       (sleep 1)
       
       (start-game game)))

(start-game game)
