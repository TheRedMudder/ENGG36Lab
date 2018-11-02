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
	lsra		;Accumilator shifted to right
	bcs	next	;branch if carry set
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
array	fcb	10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40
	fcb	42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72
	end