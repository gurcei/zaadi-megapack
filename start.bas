    2 goto 1000
   10 data 85,64,64,64,64,73,32,85,73,85,73,85,64,67,114,64,73,32,85,64,73,32,32,85,67,67
   20 data 67,114,64,64,64,64,64,64,64,64,73,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96
   30 data 96,96,96,96,96,85,64,64,64,64,73,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96
   40 data 96,66,66,96,32,32,32,66,32,66,74,75,66,107,64,32,66,32,73,32,66,64,115,32,32
   50 data 66,67,73,32,74,64,73,32,96,96,96,96,32,66,2,1,19,9,3,45,13,5,7,1,45,7,1,13,5
   60 data 45,16,1,3,11,66,50,48,49,56,66,32,2,25,32,26,1,1,4,9,9,45,7,1,13,5,19,66,75,32
   70 data 32,32,32,74,64,75,32,32,74,113,64,32,74,64,113,64,75,32,74,64,64,113,64,75,32
   80 data 74,64,75,32,96,96,96,32,32,74,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64
   90 data 64,64,64,64,113,64,64,64,64,74,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,75 
 1000 print chr$(147)+chr$(17)+chr$(17)+chr$(17)+chr$(17)+chr$(5)"welcome to the mega 65 basic game pack"
 1020 print "enjoy this games, read the games, and later create your own games."
 1022 print ""
 1030 print chr$(28)+"this disk contains 3 games:"
 1040 print chr$(153)+"mega snake: classical snake game. full basic without any poke."
 1050 print "            eat 15 green tokens without hitting any thing else."
 1060 print ""
 1070 print chr$(154)+"mega break: classical break out game. basic with poke, peek and sound."
 1080 print "            remove all items by hitting them with the ball, to win! be aweare"
 1090 print "            of the random offset when then ball returns from the player. this"
 1100 print "            is neccessary, since otherwise each game would be the same."
 1110 print ""
 1120 print chr$(150)+"escape from onionc cake: this is a text adventure. the story will be told"
 1130 print "            at the beginning of the game. the graphig loads slowly, but you can"
 1140 print "            proceede the game also if the graphics has not loaded completely."
 1150 print "            in this game you should avoid to be in the same room as onion cake."
 1160 print "            this is especially annoying if he is blocking a room you want to "
 1170 print "            enter. may be, you find a way to make him move in this case."
 1180 print ""
 1190 print chr$(158)+"now choose a game or (q)uiet and load the game directly: "
 1200 print "(a) meag snake, (b) meag break, (c) escape from onionc cake (press a,b,c or q)"
 2000 for x=2048 to 2287: read t: poke x,t : next x
 3000 get a$: if a$="" then 3000
 3010 a=asc(a$): if (a<32 or a>127) then 3000
 3020 if a$="q" then print chr$(147)+"see you":end
 3030 if a$="a" then print chr$(147)+"loading mega snake":load"megasnake",8
 3040 if a$="b" then print chr$(147)+"loading mega break":load"megabreak",8
 3050 if a$="c" then print chr$(147)+"loading escape from onionc cake":load"escapefromoc",8
