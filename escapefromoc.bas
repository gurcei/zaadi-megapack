    1 trap 350
    3 bload "esccochar", p3000, b1
    4 dim bl(5):rem bitplane memory locations
    5 bl(0)=$44000:bl(1)=$52000:bl(2)=$42000:bl(3)=$50000:bl(4)=$40000
    7 goto 46000
   10 dim ra$(10,1),du%(10,8),ob$(6),od$(6),ol%(6) 
   11 for i=1 to 10 : for n=1 to 8 : read du%(i,n) : next : next 
   12 for i=1 to 10 : for n=0 to 1 : read ra$(i,n) : next : next
   13 for i=1 to 6 : read ob$(i) : next
   13 for i=1 to 6 : read od$(i) : next 
   20 p%=1:ps%=0:cs%=0:op%=7:wh=0
   21 bload "b1", p($54000) : bx%=0:by=0:bl%=0:bc%=0
   25 graphic clr : screen def 1,0,0,5: screen open 1
   30 palette 1,0,0,0,0
   31 palette 1,1,1,1,1
   32 palette 1,2,1,1,1
   33 palette 1,3,2,2,2
   34 palette 1,4,2,2,2
   35 palette 1,5,3,3,3
   36 palette 1,6,4,4,4
   37 palette 1,7,4,4,4
   38 palette 1,8,5,5,5
   39 palette 1,9,5,5,5
   40 palette 1,10,6,6,6
   41 palette 1,11,6,6,6
   42 palette 1,12,7,7,7
   43 palette 1,13,7,7,7
   44 palette 1,14,8,8,8
   45 palette 1,15,8,8,8
   46 palette 1,16,9,9,9
   47 palette 1,17,9,9,9
   48 palette 1,18,10,10,10
   49 palette 1,19,10,10,10
   50 palette 1,20,11,11,11
   51 palette 1,21,11,11,11
   52 palette 1,22,12,12,12
   53 palette 1,23,12,12,12
   54 palette 1,24,13,13,13
   55 palette 1,25,13,13,13
   56 palette 1,26,13,13,13
   57 palette 1,27,14,14,14
   58 palette 1,28,15,15,15
   59 rem zeichenfarben
   60 palette 1,29,15,0,0
   61 palette 1,30,0,15,0
   62 palette 1,31,0,0,15
  100 screen set 1,1 : scnclr 0 
  110 tx%=160:ty%=10:te$="commands:":gosub 800
  111 tx%=160:ty%=18:te$="take use":gosub 800
  112 tx%=160:ty%=26:te$="shake":gosub 800
  113 tx%=160:ty%=34:te$="examine":gosub 800
  114 tx%=160:ty%=42:te$="open":gosub 800
  115 tx%=160:ty%=50:te$="(i)nventory":gosub 800
  116 tx%=160:ty%=58:te$="n o s w u d":gosub 800 
  120 pen 0,31
  121 box 250,30,250,90,310,30,310,90
  130 line 250,50,310,50  
  140 line 250,70,310,70                
  150 line 270,30,270,90 
  160 line 290,30,290,90 
  170 pen 0,0 
  171 line 275,30,285,30
  172 line 275,50,285,50 : line 255,50,265,50 : line 295,50,305,50
  173 line 275,70,285,70 : line 255,70,265,70 : line 295,70,305,70
  174 line 270,35,270,45 : line 270,55,270,65 : line 270,75,270,85
  174 line 290,35,290,45 : line 290,55,290,65 : line 290,75,290,85
  180 pen 0,30: circle du%(p%,7),du%(p%,8),4,1
  181 pen 0,29: circle du%(op%,7),du%(op%,8),4,1
  340 pen 0,31: goto 5000     
  350 screen close 1    
  360 palette restore
  400 end
  800 pen 0,30 : bank 1 : rem print text
  801 for i=1 to len(te$): c$=mid$(te$,i,1)
  802 if asc(c$)=32 then tx%=tx%+8 : goto 900
  805 for m=0 to 6 
  810 bt%=peek(3000+asc(c$)*8+m)
  815 if (bt% and 64)=64 then line tx%,ty%,tx%,ty%
  816 tx%=tx%+1 
  817 if (bt% and 32)=32 then line tx%,ty%,tx%,ty%
  818 tx%=tx%+1
  819 if (bt% and 16)=16 then line tx%,ty%,tx%,ty%
  820 tx%=tx%+1
  821 if (bt% and 8)=8 then line tx%,ty%,tx%,ty%
  822 tx%=tx%+1
  823 if (bt% and 4)=4 then line tx%,ty%,tx%,ty%
  824 tx%=tx%+1
  825 if (bt% and 2)=2 then line tx%,ty%,tx%,ty%
  826 tx%=tx%+1
  827 if (bt% and 1)=1 then line tx%,ty%,tx%,ty%
  830 tx%=tx%-6 : ty%=ty%+1
  850 next
  860 gosub 7000 : pen 0,30
  860 tx%=tx%+8 : ty%=ty%-7
  900 next
  901 return
 1800 for n=180 to 197:pen 0,0: line 0,n, 320,n:gosub 7000:next
 1801 tx%=4:ty%=180:a$="":in$="":a=0
 1802 pen 0,29:line tx%,ty%+8,tx%+7,ty%+8: get a$ : gosub 7000 
 1803 pen 0,0:box tx%,ty%+8,tx%+8,ty%-8,1: if a$="" then 1802
 1804 a=asc(a$): if (a<32 or a>127) and a<>13 and not (a=20 and len(in$)>0) then 1802
 1805 if a$=chr$(13) then 1808:else if a$=chr$(20) then in$=left$(in$,len(in$)-1):te$=in$:tx%=tx%-8:goto 1802
 1806 in$=in$+a$ : te$=a$: gosub 800
 1807 if len(in$)<20 then 1802
 1808 if len(in$)=0 then goto 1802: else goto 5003
 1809 tx%=10:ty%=190:if in$="shake" then 11000
 1810 if ps%=0 then 10000
 1811 d=0:if in$="n" then d=1
 1815 if in$="o" then d=2
 1819 if in$="s" then d=3
 1820 if in$="w" then d=4 
 1823 if in$="u" then d=5
 1824 if in$="d" then d=6   
 1826 if d=0 then 1903
 1827 if du%(p%,d)=0 then te$="not possible":gosub 800:goto 5010
 1828 pen 0,0: circle du%(p%,7),du%(p%,8),4,1:p%=du%(p%,d):pen 0,30: circle du%(p%,7),du%(p%,8),4,1
 1829 bx%=0:by%=0:bl%=0:bc%=0
 1830 on p% goto 1831,1832,1833,1834,1835,1836,1837,1838,1839,1840
 1831 bload "b1", p($54000) : goto 5010
 1832 bload "b2", p($54000) : goto 5010
 1833 bload "b3", p($54000) : goto 5010
 1834 bload "b4", p($54000) : goto 5010
 1835 bload "b5", p($54000) : goto 5010
 1836 bload "b6", p($54000) : goto 5010
 1837 bload "b7", p($54000) : goto 5010
 1838 bload "b8", p($54000) : goto 5010
 1839 bload "b9", p($54000) : goto 5010
 1840 bload "b10", p($54000) : goto 5010
 1850 goto 5010
 1903 if left$(in$,4)="take" then 12000
 1904 if left$(in$,3)="use" then 13000
 1905 if in$="i" or in$="inventory" then 14000
 1906 if in$="open" then 15000
 1907 if left$(in$,7)="examine" then 16000
 1920 te$="i dont understand this command":gosub 800:goto 5002
 2999 goto 5010
 3000 for n=120 to 138:pen 0,0: line 0,n, 320,n:gosub 7000:next
 3005 tx%=0 : ty%=120 :rem print room
 3010 te$=ra$(p%,0):gosub 800
 3020 tx%=0 : ty%=130 
 3040 te$=ra$(p%,1):gosub 800
 3050 goto 5002
 5000 rem main loop
 5001 vv=fre(1):goto 3000 : rem print room
 5002 goto 1800 : rem read command
 5003 goto 1809 : rem interprete 
 5010 if in$="end" then 350
 5999 goto 8000
 6000 goto 5001
 6999 rem plotting routine graphic
 7000 if bl%=1 then return
 7005 for bp=0 to 4:rem iterate over bitplanes
 7010   for y=0 to 90 step 8
 7011     edma 0, $98, $54000+$98*(y/8)+bp*12*$98,bl(bp)+320*(y/8)
 7030   next y
 7040 next bp
 7050 bl%=1
 7200 return
 8000 rem capy moves
 8010 if wh=1 then wh=0 : goto 8020
 8010 if rnd(1)>0.3 then goto 8200
 8020 zu=int(rnd(1)*4)+1 
 8030 if du%(op%,zu)= 0 goto 8020
 8035 pen 0,0: circle du%(op%,7),du%(op%,8),4,1
 8040 op%=du%(op%,zu)
 8045 pen 0,29: circle du%(op%,7),du%(op%,8),4,1
 8050 if p%=1 then pen 0,30: circle du%(p%,7),du%(p%,8),4,1
 8200 if p%=op% then  te$="onion cake has chaught you":gosub 800:goto 40000
 8300 goto 6000
10000 te$="you are not the hulk":gosub 800:goto 2999
11000 rem shake
11001 if p%>1 then 11020 
11002 if ps%>0 then 11010
11003 te$="the chair breaks. you are free.":gosub 800
11004 ra$(1,1)="a whistle lies here":ps%=1:goto 2999
11010 te$="the floor breaks and you fall to death.":gosub 800:goto 40000
11020 te$="here is nothing to shake.":gosub 800:goto 2999
12000 rem take
12001 if len(in$)<6 then 12080
12002 o$=right$(in$,len(in$)-5):b1=0:b2=0
12003 for i=1 to 6 : if o$=ob$(i) then b2=1 
12004 if o$=ob$(i) and ol%(i)=-1 then b1=1
12005 next
12006 if b1=1 then te$="you have it already.":gosub 800:goto 2999
12006 if b2=0 then te$="you cannot take "+o$+".":gosub 800:goto 2999
12010 if p%=1 and o$="whistle" then 12100
12011 if p%=6 and o$="screwdriver" then 12600
12012 if p%=10 and o$="key" then 12950
12013 if p%=7 and o$="printout" and ol%(5)=2 and ol%(6)=0 then 12500
12080 te$="you cannot take this here.":gosub 800:goto 2999
12100 te$="you take the whistle":ol%(1)=-1:gosub 800
12101 ra$(1,1)="nothing left to do":goto 2999
12500 te$="you take the printout":ol%(6)=-1:gosub 800
12501 ra$(7,1)="nothing left to do":goto 2999
12600 te$="you take the screwdriver.":ol%(2)=-1:gosub 800
12601 ra$(6,1)="absolutely all tools ...":goto 2999
12950 te$="you take the key":ol%(4)=-1:gosub 800
12951 ra$(10,1)="the smell gets worse with ever minute":goto 2999
13000 rem use
13001 if len(in$)<5 then 13050
13020 o$=right$(in$,len(in$)-4): b1=0
13023 for i=1 to 6 : if o$=ob$(i) and ol%(i)=-1 then b1=1 
13025 next
13030 if b1=0 then te$=o$+" is not in you inventory.":gosub 800:goto 2999
13040 if o$="key" and p%=9 then 13100
13041 if o$="screwdriver" and p%=8 then 13200
13042 if o$="printout" and p%=4 then 13300
13043 if o$="book" and p%=5 then 13400
13044 if o$="fuse" and p%=5 then 13500
13044 if o$="whistle" then 13600
13050 te$="you cannot use this here.":gosub 800:goto 2999
13100 te$="you open the cabinet and take the book.":ol%(5)=-1:ol%(4)=2:gosub 800
13101 ra$(9,1)="here is an empty cabinet." : goto 2999
13200 te$="you open the radio and take a fuse.":ol%(3)=-1:ol%(2)=2:gosub 800
13201 ra$(8,1)="it smells really bad, too":goto 2999
13300 te$="you open the door and escape":gosub 800:goto 45000
13400 if not ol%(3)=2 then te$="the computer does not work.":ol%(5)=-1:ol%(4)=2:gosub 800:goto 2999
13401 te$="with the book you can write a program.":ol%(5)=2
13402 ra$(5,1)="the screen stats: program printed"
13403 ra$(7,1)="there is a printout in the printer"
13403 gosub 800:goto 2999
13500 te$="you repair the computer with the fuse."
13501 ra$(5,1)="it is now working."
13502 ol%(3)=2:gosub 800:goto 2999
13600 te$="onion cake tries to locate the noise.":gosub 800:wh=1:goto 2999
14000 for n=120 to 138:pen 0,0: line 0,n, 320,n:gosub 7000:next
14010 tx%=0 : ty%=120 : co=0:rem print inventary
14020 for it=1 to 6 
14030 if ol%(it)=-1 then te$=ob$(it)+" ": co=co+1: gosub 800
14031 if co=3 then tx%=0 : ty%=130
14040 next
14100 goto 2999
14999 rem open
15000 if len(in$)<6 then 13050
15010 o$=right$(in$,len(in$)-5) 
15020 if p%=4 and o$="door" then 15202
15030 if p%=9 and o$="cabinet" then 15200
15040 if p%=8 and o$="radio" then 15300
15050 if p%=5 and o$="computer" then 15400
15060 if p%=7 and o$="printer" then 15400
15100 te$="you cannot open it.":gosub 800:goto 2999
15200 te$="its locked.":gosub 800:goto 2999
15202 te$="locked. only for prooven programmers":gosub 800:goto 2999
15300 te$="not with your bare hands.":gosub 800:goto 2999
15400 te$="you break it and get an electric stroke":gosub 800:goto 40000
16000 if len(in$)<9 then 12080
16002 o$=right$(in$,len(in$)-8):b1=0
16003 for i=1 to 6 
16004 if o$=ob$(i) and ol%(i)=-1 then b1=1:te$=od$(i):gosub 800
16005 next
16006 if b1=0 then te$=o$+" is not in your inventory.":gosub 800
16010 goto 2999
40000 screen close 1    
40001 palette restore
40010 print "{clr}game over - you died in the house of dirty old onion cake"
40020 end
45000 screen close 1    
45001 palette restore
45010 print "{clr}gratulations! you escaped from dirty only onion cake."
45011 print "for the future you plan to write more sw for the mega65"
45011 print "to avoid to be kidnapped by onion cake again."
45020 end
46000 print"{clr}dirty old onion cake has kidnapped you."
46001 print"you know that it is you own fault since "
46002 print"you have not written enough mega 65 software."
46003 print"however he has left you at the garret"
46004 print"after he faced some problems with his gun"
46005 print"and went to his workshop downstairs."
46006 print"now is your chance to escape ..."
46007 print" ":print"please hit enter"
46008 zu=rnd(0)
46010 get a$: a=asc(a$): if a<>13 then 46010
46020 print"loading....."
46020 goto 10
50001 data 0,0,0,0,0,2,280,60
50002 data 4,6,8,10,1,0,280,60
50003 data 0,4,10,0,0,0,260,40
50004 data 0,5,2,3,0,0,280,40
50005 data 0,0,6,4,0,0,300,40
50006 data 5,0,7,2,0,0,300,60
50007 data 6,0,0,8,0,0,300,80
50008 data 2,7,0,9,0,0,280,80
50009 data 10,8,0,0,0,0,260,80
50010 data 3,2,9,0,0,0,260,60
50110 data "garret","you are tied to a chair"
50120 data "stairwell","here is only an old stair case"
50130 data "bathroom","it smells really bad"
50140 data "entry","the door is locked by a scanner"
50150 data "office. here is a computer.","but its fuse is broken."
50160 data "workshop. most tools here are trash","but there is a screwdriver on the floor"
50170 data "junk room with ... junk and a printer","connected to a comuter somewhere else"
50180 data "kitchen. it really looks bad here.","there is an old radio."
50190 data "living room","a cabinet holds a computer book."
50200 data "sleeping room. it smells awfull.","there is a key under the bed."
53001 data "whistle"
53002 data "screwdriver"
53003 data "fuse"
53004 data "key"
53005 data "book"
53006 data "printout"
53011 data "able to make a hard to locate noise"
53012 data "good to open elektrical devices"
53013 data "multi puropse. for different devices."
53014 data "small and rusty"
53015 data "how to program the mega65"
53016 data "a mega 65 programm..."
