oaguy1: hi!
oaguy1: long time no see? do you even remember me?
+ yeah!
    -> remember
+ not really...
    -> not_remember

=== remember ===
oaguy1: that's awesome! it's been too long.
oaguy1: how have things been?
+ great!
    -> great
+ okay, i guess
    -> not_great

=== not_remember ===
oaguy1: really? i was only your best friend before school!
oaguy1: i know we don't see eachother all the time, but still...
oaguy1: want me to jog your memory?
+ sure!
    -> jog_memory
+ i remember you now! how have you been?
    -> ask_how_been

== jog_memory
oaguy1: we were next door neighbors and our moms were friends. we went over to each others houses so many times. i remember when you came over for new years and our mothers turned the clocks forward so we thought it was midnight and instead it was actually like 8pm.
oaguy1: last time i saw you was at my birthday party. you came over and we all went to the gamestore and bought pokemon cards. you'd never played before, so I showed you how to play.
+ i remember now! how have you been?
    -> ask_how_been

== ask_how_been
oaguy1: i'm pretty good! missing you, though. how are you doing?
+ great!
    -> great
+ okay, i guess
    -> not_great

=== not_great ===
oaguy1: just alright? want to talk about it
+ not really
-> what_music
+ maybe later
-> what_music

== great ===
oaguy1: YAY! That's awesome!
-> what_music

=== what_music ===
oaguy1: what music have you been listening to?
+ linkin park
    -> linkin_park
+ eninem
    -> eninem
+ i'm not really into music
    -> not_into_music
    
=== linkin_park ===
oaguy1: fuck yes! Chester and Mike forever! what's your favorite song?
+ numb
    -> numb
+ in the end
    -> in_the_end
    
=== numb ===
oaguy1: Meteora was such a good album. i really liked Somewhere I Belong. i have it on repeat on my ipod all the time.
oaguy1: i can't wait for the next album.
-> video_games

=== in_the_end ===
oaguy1: such a good song. the remix on Reanimation was so good.
oaguy1: their new album is amazing, you should listen to it!
-> video_games

=== eninem ===
oaguy1: i really liked Lose Yourself! mom's spagetti, haha.
-> video_games

== not_into_music ===
oaguy1: that's a bummer. i really like music.
-> video_games

=== video_games ===
oaguy1: how about video games, whatcha playing?
+ nothing new, still don't have a ps2
    -> no_ps2
+ mainlly playing pc games
    -> pc_games
+ not really playing anything right now
    -> not_playing
    
=== no_ps2 ===
oagyu1: ah man, that sucks. my mom told me i need better grades before i can get a ps2
oaguy1: still playing ps1 games?
+ yeah! playing tony hawk 2
    -> thps2
+ nah, i'm not really playing anything
    -> not_playing

== thps2 ===
oaguy1: tony hawk is the best! i love the cheat code that lets you play as spiderman
oaguy1: i could never all the tricks, but it was fun the run around and mash random buttons
oaguy1: playing anything else?
+ not really
    -> not_playing
+ yeah, some pc games, too
    -> pc_games

=== pc_games ===
oaguy1: so cool! i only have a shit laptop from my mom, so no games for me
oaguy1: whatcha playing?
+ call of duty
    -> cod
+ the sims
    -> sims

=== cod ===
oaguy1: my fucking mom won't let me play that
oaguy1: i wish i had your parents
-> opening_up

=== sims ===
oaguy1: i wanna play that so badly!
oaguy1: next time i'm over i'm playing that!
-> opening_up

=== not_playing ===
oaguy1: that's cool, i guess. wish we could play together
-> opening_up

=== opening_up ===
...
oaguy1: school sucks so hard right now. i can't seem to get decent grades no matter what i do and my mom is being a bitch about it
oaguy1: i just fucking hate it
...
oaguy1: still getting straight a's?
+ yeah, for the most part
    -> straight_a
+ not really, i have a girlfriend now
    -> girlfriend
    
=== straight_a ===
oaguy1: fuck you
oaguy1: good thing you're cute
+ say what?
    -> bad_response
+ ahhhh, really?
    -> good_respponse

=== girlfriend ===
oaguy1: really? that's awesome! what's she like?
+ hot
    -> hot_girlfiend
+ sweet
    -> girlfriend_awesome
+ the cutest fucking thing ever
    -> girlfriend_awesome

=== hot_girlfiend ===
oaguy1: whoa, nice!
+ yeah, we've totally kissed and everything
    -> kissed
+ yeah, she's awesome
    -> girlfriend_awesome

=== kissed ===
oaguy1: i kissed someone, too, at summer camp
oaguy1: it was awesome, he was so sweet
+ say what? you kissed a guy?
    -> bad_response
+ awwww!
    -> good_respponse

=== girlfriend_awesome ===
oaguy1: yeah, that's so awesome. i wish i had someone.

oaguy1: too bad you're taken
+ say what?
    -> bad_response
+ really? you and me?
    -> good_respponse

=== bad_response ===
oaguy1: yeah, i'm fucking gay.
oaguy1: whatcha going to do? call me a faggot?
+ faggot
    -> faggot
+ i really don't want to talk anymore
    -> stop_talking
+ no, i'm just surprised is all
    -> surprised

=== faggot ===
oaguy1: FUCK YOU
you have been blocked by oaguy1
-> END

=== surprised ===
oaguy1: i get it, we've been friends for a long time
...
oaguy1: to be fair, i didn't know until i kissed a boy at summer camp
...
oaguy1: it was a dare, but it felt awesome
...
...
oaguy1: are you going to say something?
+ i'm happy for you!
    -> happy_for_you
+ i don't want to talk anymore
    -> bad_response

=== stop_talking
oaguy1: okay
-> END

=== good_respponse ===
oaguy1: i've wanted to tell you for a long time, but i'm gay
...
oaguy1: is that okay with you?
+ yes! i'm happy for you
    -> happy_for_you
+ no, not really
    -> not_okay
    
=== not_okay ===
oaguy1: okay, whatever. i'll talk to you later
-> END

=== happy_for_you ===
oaguy1: thanks!
...
oaguy1: i really like you.
...
oaguy1: would you want to go out sometime?
+ yes!
    -> go_out
+ no, i don't swing that way
    -> not_gay
    
=== go_out ===
oaguy1: AHHH YESSS!
oaguy1: i've thought you are cute for so long. i can't wait to see you again!
-> END

=== not_gay ===
oaguy1: i get it. we can still be best friends, even if we don't date
oaguy1: right?
-> END