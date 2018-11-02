N	equ	10
	org	$1000
count	rmb	1
	
	org	$2000
	ldx	#array	
	clr	count
	ldab	#N
loop	ldaa	0,x
loop_2	lsra
	bcc	loop_2
	cmpa	#0
	beq	yes
	bra	next
yes	inc	count
next	inx
	dbne	b,loop
	swi
array	db	1,2,3,4,5,6,7,8,9,10
	end