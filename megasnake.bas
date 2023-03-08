    1 trap 500
    2 i=rnd(0)
   10 dim f%(159,99)
   20 dim s%(199,1)
   30 l%=15
   40 h%=-1
   50 t%=-1
   55 fd%=2
   60 de%=10
   70 tx=0:ty=0
   80 fx%=0:fy%=0
  210 graphic clr 
  220 screen def 1,0,0,4 
  230 screen open 1           
  240 palette 1,0,  0, 0, 0      
  250 palette 1,1, 15, 5, 5        
  255 palette 1,2,  0, 0,15       
  260 palette 1,3,  0,15, 0       
  270 screen set 1,1                 
  280 scnclr 0                                           
  300 pen 0,1 : box 0,0, 0,199, 319,0, 319,199
  301 goto 700
  309 fx%=100:fy%=45
  310 gosub 630
  320 px%=2  
  330 py%=2 
  340 d%=3
  350 j%=joy(1)
  351 if j%=128 then goto 500
  360 if j%=1 or j%=3 or j%=5 or j%=7 then d%=j%
  370 if d%=1 then py%=py%-1
  371 if d%=3 then px%=px%+1
  372 if d%=5 then py%=py%+1
  373 if d%=7 then px%=px%-1
  379 bx=2*px% : by=2*py%
  380 pen 0,2: box bx,by,bx,by+1,bx+1,by,bx+1,by+1 
  381 if f%(px%,py%)=2 then gosub 600
  382 if f%(px%,py%)=1 then goto 500 
  385 f%(px%,py%)=1
  389 h%=h%+1 : if h%=200 then h%=0
  390 s%(h%,0)=px% : s%(h%,1)=py%
  393 if de%>0 then de%=de%-1
  394 if de%=0 then begin
  395 t%=t%+1 : if t%=200 then t%=0
  396 tx=s%(t%,0)*2 :ty=s%(t%,1)*2
  397 pen 0,0 : box tx,ty,tx,ty+1,tx+1,ty,tx+1,ty+1
  398 f%(s%(t%,0),s%(t%,1))=0  
  399 bend
  400 goto 350        
  500 screen close 1                 
  510 palette restore                                    
  520 print "game over !! you hit something befor you have eaten 15 food"
  550 end
  600 de%=10
  605 fx% = int(rnd(1) * 146)+2 : fy% = int(rnd(1) * 95)+2
  610 if f%(fx%,fy%)=0 then goto 630
  620 goto 605
  630 f%(fx%,fy%)=2 : fx%=fx%*2 : fy%=fy%*2 
  630 sound 1,4000,40
  640 pen 0,3: box fx%,fy%,fx%,fy%+1,fx%+1,fy%,fx%+1,fy%+1
  645 fd%=fd%+1 : if(fd%=15) goto 900
  650 return
  700 for i=0 to 40
  720 fx% = int(rnd(1) * 145)+3 : fy% = int(rnd(1) * 94)+3
  730 f%(fx%,fy%)=1 : fx%=fx%*2 : fy%=fy%*2 
  740 pen 0,1: box fx%,fy%,fx%,fy%+1,fx%+1,fy%,fx%+1,fy%+1
  750 next
  760 goto 309
  900 print "you have succesfully finsihed the game"
