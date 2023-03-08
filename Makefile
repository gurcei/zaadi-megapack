all:
	c1541 -attach mega_pack.d81 -read start -read megasnake -read megabreak -read escapefromoc 
	petcat -65 -o start.bas -- start
	petcat -65 -o megasnake.bas -- megasnake
	petcat -65 -o megabreak.bas -- megabreak
	petcat -65 -o escapefromoc.bas -- escapefromoc
	# c1541 -attach MA110.D81 -read gurce.asm,s
