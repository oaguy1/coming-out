;; game mode

(fn inside-button? [x y button-x button-y button-width button-height]
  (and (<= button-x x)
       (<= button-y y)
       (<= x (+ button-x button-width))
       (<= y (+ button-y button-height))))
          
{
 :init (fn init [...]
         (local user-screen-name ...)
         (global story (narrator.init_story book))
         (story:begin)

         (global font (love.graphics.newFont 16))
         (global text-area (love.graphics.newText font ""))
         (global text-area-y 38)
         (global chat-log [])
         (global choice-buttons [])
         (global paragraphs [])
         (global game-over false)

         (if (> (length user-screen-name) 0)
             (global screen-name user-screen-name)
             (global screen-name "player"))

         (global peace-profile (love.graphics.newImage "assets/peace-profile.png"))
         (global yinyang-profile (love.graphics.newImage "assets/yinyang-profile.png")))

 :update (fn update [dt set-mode]
           ;; get next paragraph from existing paragraphs
           (when (> (length paragraphs) 0)
             (let [paragraph (table.remove paragraphs 1)]
               (when (= (string.sub paragraph.text 1 3) "...")
                 (love.timer.sleep (love.math.random 3)))
               (when (= (string.sub paragraph.text 1 7) "oaguy1:")
                 (love.timer.sleep (love.math.random (* dt .01 (length paragraph.text))))
                 (table.insert chat-log [1 0 0])
                 (table.insert chat-log "oaguy1:")
                 (table.insert chat-log [0 0 0])
                 (table.insert chat-log (.. (string.sub paragraph.text 8) "\n")))
               (when (not (or (= (string.sub paragraph.text 1 7) "oaguy1:")
                              (= (string.sub paragraph.text 1 3) "...")))
                 (table.insert chat-log [0 0 0])
                 (table.insert chat-log (.. paragraph.text "\n")))))

           ;; get next paragraphs
           (when (story:can_continue)
             (set paragraphs (story:continue)))

           ;; get choices
           (when (and (story:can_choose)
                      (= 0 (length paragraphs)))
             (let [choices (story:get_choices)
                   button-x 185
                   button-y 430
                   button-width 607
                   button-height 40
                   button-gap 10]
               (each [i choice (ipairs choices)]
                 (table.insert choice-buttons {:x button-x
                                               :y (+ button-y (* button-gap (- i 1)) (* button-height (- i 1)))
                                               :width button-width
                                               :height button-height
                                               :text choice.text
                                               :choice-index i}))))

           ;; show game over text
           (when (and (not (story:can_continue))
                      (not (story:can_choose))
                      (= 0 (length paragraphs)))
             (set game-over true))

           ;; update text area
           (text-area.setf text-area chat-log 597 "left")
           (when (> (text-area:getHeight) 350)
             (set text-area-y (- 38 (- (text-area:getHeight) 350)))))
           
 :draw (fn draw []
         ;; draw text
         (love.graphics.setColor 1 1 1) ;; white
         (love.graphics.rectangle "fill" 178 30 617 350)
         (love.graphics.setColor 0 0 0) ;; black
         (love.graphics.setLineWidth 1)
         (love.graphics.rectangle "line" 178 30 617 350)
         (love.graphics.setColor 1 1 1) ;; white
         (love.graphics.draw text-area 185 text-area-y)

         ;; draw window chrome
         (love.graphics.setColor .925 .914 .847) ;; win xp window color
         (love.graphics.rectangle "fill" 5 30 173 565)
         (love.graphics.rectangle "fill" 178 380 617 215)

         ;; draw window stylings
         (love.graphics.setColor .737 .725 .678) ;; win xp window accent color
         (love.graphics.rectangle "line" 178 420 617 160)

         ;; draw choice buttons
         (each [_ button (ipairs choice-buttons)]
           (love.graphics.setColor 1 1 1)
           (love.graphics.rectangle "fill" button.x button.y button.width button.height 5 5)
           (love.graphics.setColor (/ 159 255) (/ 189 255) (/ 232 255))
           (love.graphics.setLineWidth 5)
           (love.graphics.rectangle "line" button.x button.y button.width button.height 5 5)
           (love.graphics.setColor 0 0 0)
           (love.graphics.setLineWidth 1)
           (love.graphics.rectangle "line" button.x button.y button.width button.height 5 5)
           (love.graphics.setFont font)
           (love.graphics.printf button.text button.x (+ 10 button.y) button.width "center"))

         (when game-over
           (love.graphics.setFont font)
           (love.graphics.setColor 0 0 0)
           (love.graphics.printf "Game Over" 178 490 617 "center"))


         ;; profile pictures
         (love.graphics.setColor 1 1 1) ;; remove tint
         (love.graphics.draw peace-profile 18 45)
         (love.graphics.setColor .737 .725 .678) ;; win xp window accent color
         (love.graphics.rectangle "line" 18 45 145 145)
         (love.graphics.setColor 1 1 1) ;; remove tint
         (love.graphics.draw yinyang-profile 18 420)
         (love.graphics.setColor .737 .725 .678) ;; win xp window accent color
         (love.graphics.rectangle "line" 18 420 145 145)
         
         ;; draw window bar
         (love.graphics.setColor .004 .40 .984) ;; win xp blue
         (love.graphics.rectangle "fill" 0 0 800 30)
         (love.graphics.setLineWidth 10)
         (love.graphics.rectangle "line" 0 0 800 600)
         (love.graphics.setColor .902 .271 .188)
         (love.graphics.rectangle "fill" 767 3 25 25 5 5)
         (love.graphics.setColor 1 1 1)
         (love.graphics.setLineWidth 1)
         (love.graphics.setFont font)
         (love.graphics.rectangle "line" 767 3 25 25 5 5)
         (love.graphics.printf "oaguy1 - Instant Message" 5 5 400 "left")
         (love.graphics.printf "x" 775 5 25 "left"))
 
 :mousereleased (fn mousereleased [x y button set-mode]
                  (each [_ button (ipairs choice-buttons)]
                    (when (inside-button? x y button.x button.y button.width button.height)
                      (when (not (= (. chat-log (length chat-log)) (.. screen-name ": ")))
                        (story:choose button.choice-index)
                        (table.insert chat-log [0 0 1])
                        (table.insert chat-log (.. screen-name ": "))
                        (set choice-buttons []))))

                  (when (inside-button? x y 767 3 25 25)
                    (set-mode "mode.menu")))

 :keypressed (fn keypressed [key set-mode]) 

 :keyreleased (fn keyreleased [key set-mode])
}
