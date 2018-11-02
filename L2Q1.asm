;Adds even values
	org	$1000	; SP to mem address $1000
sum	rmb	1	; reserve 1 mem bytes for sum
arcnt	rmb	1	; reserve 1 mem bytes for arcnt
	
	org	$2100	; SP to mem address $2000
	ldaa	#20	;load #20 to A
	staa	arcnt	; Store A (20) to arcnt
	ldx	#array	; Load address of array
	ldaa	#0	; load 0 into A
	staa	sum	; store A (0) into sum
again	ldaa	0,x	; load the value of the memory location saved in X
	lsra		;Accumilator shifted to right
	bcs	next	;branch if carry set
	ldaa	sum	; load sum into A
	adda	0,x	; add value of the mem location saved in X
	staa	sum	; Store sum
next	inx		;increment x
	dec	arcnt	;decrement arcnt
	bne	again	;branch if not equal
	swi		;software interupt
	org	$1100
array	fcb	1,3,5,7,2,4,6,8,9,11,13,14,15,17,19,16,18,29
	end