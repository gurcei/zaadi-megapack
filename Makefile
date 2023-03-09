all:
	c1541 -attach mega_pack.d81 -read start -read megasnake -read megabreak -read escapefromoc
	petcat -65 -o start.bas -- start
	petcat -65 -o megasnake.bas -- megasnake
	petcat -65 -o megabreak.bas -- megabreak
	petcat -65 -o escapefromoc.bas -- escapefromoc
	# c1541 -attach MA110.D81 -read gurce.asm,s

graphic:
	python conv.py orig/b1.prg new/b1.prg
	python conv.py orig/b2.prg new/b2.prg
	python conv.py orig/b3.prg new/b3.prg
	python conv.py orig/b4.prg new/b4.prg
	python conv.py orig/b5.prg new/b5.prg
	python conv.py orig/b6.prg new/b6.prg
	python conv.py orig/b7.prg new/b7.prg
	python conv.py orig/b8.prg new/b8.prg
	python conv.py orig/b9.prg new/b9.prg
	python conv.py orig/b10.prg new/b10.prg
