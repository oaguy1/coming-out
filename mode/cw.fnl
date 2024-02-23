;; main menu
(local version-num "0.0.1")


(fn inside-button? [x y button-x button-y button-width button-height]
  (and (<= button-x x)
       (<= button-y y)
       (<= x (+ button-x button-width))
       (<= y (+ button-y button-height))))

{
 :init (fn init []
         (global content-warning "This game is a coming out story from the early 2000's between two boys over the internet. As such, some paths of the interactive story contain slurs against gay people.\n\nIf you don't want to experience that, please click the 'Exit' button below. Otherwise, click the 'Play' button to continue.")
         (global font (love.graphics.newFont 16)))
 
 :update (fn update [dt set-mode])

 :draw (fn draw []
         ;; desktop background
         (love.graphics.setColor .893 .444 .792) ;; pink temporary background color
         (love.graphics.rectangle "fill" 0 0 800 600)

         ;; window decoration 
         (love.graphics.setColor .004 .40 .984) ;; win xp blue
         (love.graphics.rectangle "fill" 150 175 500 250 10 10)
         (love.graphics.rectangle "fill" 150 215 500 210)
         (love.graphics.setColor .902 .271 .188)
         (love.graphics.rectangle "fill" 620 180 25 25 5 5)
         (love.graphics.setColor 1 1 1)
         (love.graphics.setLineWidth 1)
         (love.graphics.setFont font)
         (love.graphics.rectangle "line" 620 180 25 25 5 5)
         (love.graphics.printf "x" 620 183 25 "center")
         (love.graphics.printf "Content Warning!" 155 185 350 "left")
 
         ;; main body background
         (love.graphics.setColor .925 .914 .847) ;; win xp window color
         (love.graphics.rectangle "fill" 155 215 490 205)

         ;; content warning
         (love.graphics.setColor 0 0 0)
         (love.graphics.setFont font)
         (love.graphics.printf content-warning 165 225 470 "left")

         ;; play button
         (let [x 228
               y 370
               width 100
               height 40]
           (love.graphics.setColor 1 1 1)
           (love.graphics.rectangle "fill" x y width height 5 5)
           (love.graphics.setColor (/ 159 255) (/ 189 255) (/ 232 255))
           (love.graphics.setLineWidth 5)
           (love.graphics.rectangle "line" x y width height 5 5)
           (love.graphics.setColor 0 0 0)
           (love.graphics.setLineWidth 1)
           (love.graphics.rectangle "line" x y width height 5 5)
           (love.graphics.setFont font)
           (love.graphics.printf "Play" x (+ 10 y) width "center"))

         ;; exit button
         (let [x 473
               y 370
               width 100
               height 40]
           (love.graphics.setColor 1 1 1)
           (love.graphics.rectangle "fill" x y width height 5 5)
           (love.graphics.setColor (/ 159 255) (/ 189 255) (/ 232 255))
           (love.graphics.setLineWidth 5)
           (love.graphics.rectangle "line" x y width height 5 5)
           (love.graphics.setColor 0 0 0)
           (love.graphics.setLineWidth 1)
           (love.graphics.rectangle "line" x y width height 5 5)
           (love.graphics.setFont font)
           (love.graphics.printf "Exit" x (+ 10 y) width "center")))

 :mousereleased (fn mousereleased [x y button set-mode]
                  ;; hit play button
                  (when (inside-button? x y 228 370 100 40)
                    (set-mode "mode.menu"))

                  ;; hit exit button
                  (when (inside-button? x y 473 370 100 40)
                    (love.event.quit))

                  ;; hit close button on window bar
                  (when (inside-button? x y 620 180 25 25)
                    (love.event.quit)))

 :keypressed (fn keypressed [key set-mode])

 :keyreleased (fn keyreleased [key set-mode])
}
