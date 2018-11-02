N	equ	20	;Set N=20
	org	$1000	; SP ->$1000
arr	db	10,12,29,20,30,31,33,34,36,37,40,3,89,$AB,$CD,$A3; define array
	db	$67,7,$44,$63
count	rmb	1	;reserve memory byte for count
	org	$2000	;SP->$2000
	ldx	#arr	;load memory address of arr into x
	clr	count	;clear count
	ldab	#N	;load N(20) into B
loop	brclr	0,X,$98,yes;Branch if array element has 0s in the one location of mask, 10011000
	bra	next	;branch next
yes	inc	count	;increment count
next	inx		;increment x
	dbne	b,loop	;continue to loop till loop counter=N
	swi		;software interrupt
	end