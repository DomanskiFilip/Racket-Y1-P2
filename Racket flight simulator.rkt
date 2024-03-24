#lang racket/gui
(define frame (new frame%
                         [label "Racket flight simulator"]
                         [width 300]
                         [height 300]))
                         
(define game '(#("⬜" "⬜" "⬜" "⬜" "⬜") 
               #("⬜" "⬜" "⬜" "⬜" "⬜")
               #("⬜" "⬜" "⬜" "⬜" "⬜")
               #("⬜" "⬜" "⬜" "⬜" "⬜")))

(define player-row #("⬜" "X" "⬜" "⬜" "⬜"))



(define (player-position player-row)
  (for/first ([i (in-range (vector-length player-row))]
              #:when (equal? (vector-ref player-row i) "X"))
    i))

(define start-game(λ (game)
                    
                    (let ([vec (vector "⬛" "⬛" "⬛" "⬛" "⬛")])    
                      (vector-set! vec (random 5) "⬜")
                      (set! game (cons vec game)))
                    
                    (set! game (drop-right game 1))
       
                    (for/list ([i game])
                      (display i)
                      (newline))
                    (display player-row)
                    (newline)
                    (newline)
    
                    (sleep 1)      
     
                    (set! game (cons (vector "⬜" "⬜" "⬜" "⬜" "⬜") game))
                    
                    (set! game (drop-right game 1))
       
                    (for/list ([i game])
                      (display i)
                      (newline))
                    (display player-row)
                    (newline)
                    (newline)
       
                    (sleep 1)

                    (if (equal? (vector-ref (fourth game)(player-position player-row)) "⬛")
                        (display "Game Over!")
                        (start-game game))))
(send frame show #t)

(start-game game)

