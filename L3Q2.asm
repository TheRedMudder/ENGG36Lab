N	equ	32	;N=32
	org	$1000	;SP=$1000
arr	db	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16;Define Array
	db	17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32
	org	$1100	;SP=$1100
sq_ave	rmb	2	;Reserve 2 bytes for sq_ave
sq_sum	rmb	2	;Reserve 1 byte for count
elemloc	rmb	1	;Reserve 1 byte for elemloc
	org	$2000	;SP=$2000
	ldx	#arr	;load memory location of arr
	clr	sq_sum	;set count =0
	ldab	#N	;Load N(32) into B
loop	ldaa	0,x	;Load element of arr into A
	stab	elemloc	;Save B into elemloc(B is continously decreasing)
	ldab	0,x	;Load element of arr into B
	mul		;Multiply A*B->A:B
	addd	sq_sum	;Add sq_sum	
	std	sq_sum	;Store D
	inx		;Increment X
	ldab	elemloc	;Load Element Location
	dbne	b,loop	;Decrease b and branch if not 0
	
	ldd	sq_sum	;Load sq_sum into D
	ldx	#N	;Load 32
	fdiv		;D/x->X(quotient),D(remainder)
	stx	sq_ave	;Store X->str_ave
	swi		;Software Interrupt
	end