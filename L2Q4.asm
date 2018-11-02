	org	$1100	; SP to mem address $1000
count	rmb	1	; reserve 1 mem bytes for count
arcnt	rmb	1	; reserve 1 mem bytes for arcnt
	
	org	$2100	; SP to mem address $2000
	ldaa	#20	;load #20 to A
	staa	arcnt	; Store A (20) to arcnt
	ldx	#array	; Load address of array
	ldaa	#0	; load 0 into A
	staa	count	; store A (0) into count
again	ldaa	0,x	; load the value of the memory location saved in X
	
	cmpa	#16
	bhi	next	;branch if carry set

	inc	count	; inc count
next	inx		;increment x
	dec	arcnt	;decrement arcnt
	bne	again	;branch if not equal
	swi		;software interupt
	org	$1000
array	fcb	3,8,19,34,87,45,67,43,90,6
	fcb	11,22,33,44,55,66,77,88,99,100
	end