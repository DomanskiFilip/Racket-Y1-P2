#lang racket/gui

(define frame #f) ; Define frame globally

(define game (list (make-vector 3 0)
                   (make-vector 3 0)
                   (make-vector 3 0)
                   (make-vector 3 0)))

(define player-position 1) ; Start position of the player
(define current-row 0)     ; Start row of the player

(define (place-obstacles)
  (let* ([obstacle-row (make-vector 3 0)])
    (vector-set! obstacle-row (random 3) 1)
    (vector-set! obstacle-row (random 3) 1)
    (list obstacle-row (make-vector 3 0))))

(define (move-player-left button event)
  (displayln "Move Left Called")
  (set! player-position (- player-position 1))
  (continue-game)
  (send frame show #f)) ; Close the frame after button press

(define (move-player-right button event)
  (displayln "Move Right Called")
  (set! player-position (+ player-position 1))
  (continue-game)
  (send frame show #f)) ; Close the frame after button press

(define (move-player-stay button event)
  (displayln "Stay Called")
  (continue-game)
  (send frame show #f)) ; Close the frame after button press

(define (start-game-round)
  (if (= current-row 5) ; Check if the player reached the end
      (display "Game Won!")
      (begin
        (for ([row game])
          (displayln (vector->list row)))
        (let* ([rows (place-obstacles)]
               [obstacle-row (first rows)]
               [empty-row (second rows)])
          (vector-set! empty-row player-position 2)
          (displayln (vector->list obstacle-row))
          (displayln (vector->list empty-row)))
        (newline)
        (newline)
        (display-gui))))

(define (display-gui)
  (set! frame (new frame% [label "Button GUI"] [width 300] [height 100])) ; Set frame globally
  (define left-button (new button% [parent frame] [label "Left"] [callback move-player-left]))
  (define right-button (new button% [parent frame] [label "Right"] [callback move-player-right]))
  (define stay-button (new button% [parent frame] [label "Stay"] [callback move-player-stay]))
  (send frame show #t))

(define (start-game)
  (start-game-round))

(define (continue-game)
  (displayln (format "Current row: ~a" current-row))
  (if (< current-row 4) ; Check if the game is still in progress
      (begin
        (set! game (cdr game))
        (set! current-row (+ current-row 1))
        (start-game-round))
      (if (= current-row 4)
          (display "Game Won!")
          (display "Game Over!"))))

(start-game)
