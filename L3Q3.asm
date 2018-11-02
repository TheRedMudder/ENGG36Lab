N	equ	32	;N=32
	org	$1000	;SP=$1000
arr	db	10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40
	db	42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72


	org	$1100	;SP=$1100
arr_2	rmb	32	;Reserve 32 bytes for arr_2

elemloc	rmb	1	;Reserve 1 byte for elemloc
newloc	rmb	1	;Reserve 1 byte for newloc
	org	$2000	;SP=$2000
	ldx	#arr	;load memory location of arr
	clr	elemloc	;set elemloc =0
	clr	newloc	;set newloc=0
	ldab	#N	;Load N(32) into B
loop	ldaa	0,x	;Load element of arr into A
	stab	elemloc	;Save B into elemloc(B is continously decreasing)
	ldab	#N	;Load N(32) into B
	subb	elemloc	;Subtract B-elemloc=32-elemloc
	stab	newloc	;Store B as newloc
	staa	arr_2+newloc;offset store to arr_2 + newloc
	inx		;Increment X
	ldab	elemloc	;Load Element Location
	dbne	b,loop	;Decrease b and branch if not 0
	
	swi		;Software Interrupt
	end