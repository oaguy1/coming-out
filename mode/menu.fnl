;; main menu
(local version-num "0.0.1")
(local capitalize {
                   :a "A"
                   :b "B"
                   :c "C"
                   :d "D"
                   :e "E"
                   :f "F"
                   :g "G"
                   :h "H"
                   :i "I"
                   :j "J"
                   :k "K"
                   :l "L"
                   :m "M"
                   :n "N"
                   :o "O"
                   :p "P"
                   :q "Q"
                   :r "R"
                   :s "S"
                   :t "T"
                   :u "U"
                   :v "V"
                   :w "W"
                   :x "X"
                   :y "Y"
                   :z "Z"
                   :1 "!"
                   :2 "@"
                   :3 "#"
                   :4 "$"
                   :5 "%"
                   :6 "^"
                   :7 "&"
                   :8 "*"
                   :9 "("
                   :0 ")"
                   :- "_"
                   := "+"
                   "," "<"
                   "." ">"
                   "/" "?"})

(fn inside-button? [x y button-x button-y button-width button-height]
  (and (<= button-x x)
       (<= button-y y)
       (<= x (+ button-x button-width))
       (<= y (+ button-y button-height))))

{
 :init (fn init []
         (global shift false)
         (global banner (love.graphics.newImage "assets/banner.png"))
         (global font (love.graphics.newFont 16))
         (global small-font (love.graphics.newFont 10))
         (global screen-name "")
         (global cursor "|")
         (global cursor-count 0)
         (global text-area (love.graphics.newText font "")))
 
 :update (fn update [dt set-mode]
           ;; blink cursor
           (set cursor-count (+ cursor-count dt))
           (when (> cursor-count .5)
             (set cursor-count 0)
             (if (= cursor "|")
                 (set cursor "")
                 (set cursor "|")))

           ;; set screen-name text-area
           (text-area.set text-area screen-name))

 :draw (fn draw []
         ;; desktop background
         (love.graphics.setColor .893 .444 .792) ;; pink temporary background color
         (love.graphics.rectangle "fill" 0 0 800 600)

         ;; window decoration 
         (love.graphics.setColor .004 .40 .984) ;; win xp blue
         (love.graphics.rectangle "fill" 200 50 400 500 10 10)
         (love.graphics.rectangle "fill" 200 80 400 470)
         (love.graphics.setColor .902 .271 .188)
         (love.graphics.rectangle "fill" 570 55 25 25 5 5)
         (love.graphics.setColor 1 1 1)
         (love.graphics.setLineWidth 1)
         (love.graphics.setFont font)
         (love.graphics.rectangle "line" 570 55 25 25 5 5)
         (love.graphics.printf "x" 570 58 25 "center")
         (love.graphics.printf "LÖVE Instant Messenger" 205 60 350 "left")
 
         ;; main body background
         (love.graphics.setColor .925 .914 .847) ;; win xp window color
         (love.graphics.rectangle "fill" 205 85 390 460)

         ;; username textbox
         (love.graphics.setColor 1 1 1)
         (love.graphics.rectangle "fill" 210 350 380 40)
         (love.graphics.setColor 0 0 0)
         (love.graphics.setLineWidth 1)
         (love.graphics.setFont font)
         (love.graphics.printf "ScreenName" 210 330 380 "left")
         (love.graphics.draw text-area 215 360)
         (love.graphics.print cursor (+ 215 (text-area:getWidth)) 360)
         (love.graphics.rectangle "line" 210 350 380 40)
         (love.graphics.setFont small-font)
         (love.graphics.printf "only letters and some symbols supported" 210 392 380 "left")

         ;; logo graphic 
         (love.graphics.setColor 1 1 1)
         (love.graphics.draw banner 210 90)
         (love.graphics.setColor 0 0 0)
         (love.graphics.rectangle "line" 210 90 380 230)
         

         ;; sign-in button
         (let [x 210
               y 420
               width 380
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
           (love.graphics.printf "Sign In" x (+ 10 y) width "center"))

         ;; exit button
         (let [x 210
               y 470
               width 380
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
           (love.graphics.printf "Exit" x (+ 10 y) width "center"))

         ;; version number
         (love.graphics.setColor 0 0 0)
         (love.graphics.setFont font)
         (love.graphics.printf (.. "Version: " version-num) 210 520 380 "center"))

 :mousereleased (fn mousereleased [x y button set-mode]
                  ;; hit sign-in button
                  (when (inside-button? x y 210 420 380 40)
                    (set-mode "mode.chat" screen-name))

                  ;; hit exit button
                  (when (inside-button? x y 210 470 380 40)
                    (love.event.quit))

                  ;; hit close button on window bar
                  (when (inside-button? x y 570 55 25 25)
                    (love.event.quit)))

 :keypressed (fn keypressed [key set-mode]
               (when (or (= key :lshift) (= key :rshift))
                 (set shift true))

               (when (= key :return)
                 (set-mode "mode.chat" screen-name))

               (when (and (= key :backspace) (> (length screen-name) 0))
                 (set screen-name (string.sub screen-name 1 (- (length screen-name) 1))))

               (when (and (= 1 (length key)) (< (text-area:getWidth) 360))
                 (if shift
                     (set screen-name (.. screen-name (. capitalize key)))
                     (set screen-name (.. screen-name key)))))

 :keyreleased (fn keyreleased [key set-mode]
                (when (or (= key :lshift) (= key :rshift))
                  (set shift false)))
}
