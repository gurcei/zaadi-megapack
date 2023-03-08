    1 rem init variables
   10 p=4004: bx=40: by=23:xr=-1:yr=1:po=0
   99 rem deltete screen
  100 for x=2048 to 4047: poke x, 32 : next x
  101 rem draw top frame 
  110 for x=2048 to 2127: poke x, 160 : next x
  111 rem draw side frame{$73} 
  120 for x=2127 to 4047 step 80: poke x, 160: poke x+1, 160 : next x
  121 rem draw collectables
  130 for x=2130 to 2928 step 8: poke x, 90: po=po+1 : next x
  131 for x=2938 to 2994 : poke x, 90: po=po+1 : next x
  146 rem initial drawing of the player and ball
  147 gosub 1000:poke b,81
  148 gosub 2000
  149 rem wait for fire to start
  150 if joy(1)=128 then goto 300
  151 goto 150
  300 gosub 2000:gosub 2000 : rem draw and control player twice (double speed than ball)
  325 poke b,32  : rem delelte ball
  327 rem change poistion of ball. gosub 1000 calcualtes new position of ball
  328 rem first change x then y: trick to find out if a left right movement or an up down
  329 rem movement caused a collision ans to react adequate
  330 bx=bx+xr:gosub 1000
  335 if peek(b)=160 or peek(b)=90 then bx=bx-xr:xr=xr*(-1) : sound 1,767,10
  336 if peek(b)=90 then poke b,32: po=po-1 
  340 by=by+yr:gosub 1000
  345 if peek(b)=160 or peek(b)=90 then by=by-yr:yr=yr*(-1) : sound 1,767,10
  346 if peek(b)=90 then poke b,32: po=po-1
  347 if peek(b)=227 then by=by-yr:yr=yr*(-1): sound 1,830,10: if by>2 and by<78 then by=by+int(rnd(1)*2)-1 
  348 gosub 1000
  349 if by > 24 then goto 10000 : rem checks if ball has left the screen
  350 poke b,81
  360 if po=0 goto 2000 : rem checks if all collectables are collected
  500 goto 300 
  999 rem calcualting the balls screen position
 1000 b=2048 + by * 80 + bx:return
 1999 rem moving and printing the player
 2000 if joy(1)=3 and p<4042 then p=p+1
 2010 if joy(1)=7 and p>3973 then p=p-1
 2020 for x=p-4 to p+4: poke x, 227 : next x 
 2030 poke p-5,32: poke p+5,32
 2040 return
10000 print"game over"
10001 goto 30000
20000 print"you won!! gratulations"
30000 print"press fire to play again"
30001 if joy(1)=128 then goto 10
30002 goto 30001
