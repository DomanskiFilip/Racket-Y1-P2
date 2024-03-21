#lang racket/gui

(define game '(#("⬜" "⬜" "⬜" "⬜" "⬜")
               #("⬜" "⬜" "⬜" "⬜" "⬜")
               #("⬜" "⬜" "⬜" "⬜" "⬜")
               #("⬜" "⬜" "⬜" "⬜" "⬜")
               #("⬜" "⬜" "⬜" "⬜" "⬜")))

(define start-game(λ (game)
                    
                    (let ([vec (vector "⬛" "⬛" "⬛" "⬛" "⬛")])    
                      (vector-set! vec (random 5) "⬜")
                      (set! game (cons vec game)))
                    
                    (set! game (drop-right game 1))
       
                    (for/list ([i game])
                      (display i)
                      (newline))
                    (newline)
    
                    (sleep 1)
     
                    (set! game (cons (vector "⬜" "⬜" "⬜" "⬜" "⬜") game))
                    
                    (set! game (drop-right game 1))
       
                    (for/list ([i game])
                      (display i)
                      (newline))
                    (newline)
       
                    (sleep 1)
                    
                    (start-game game)))

(start-game game)

