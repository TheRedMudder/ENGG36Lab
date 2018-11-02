	org	$1000	; SP to mem address $1000
	fcb	$20	; 20<-$1000
	db	$5	; 5<-$1001
	dc.b	$10	; 10<-$1002
	org	$2000	; SP to $2000
	ldaa	#0	; Load 0s into A
	ldab	$1000	; Load $1000 ($20) into B
	addb	$1001	; Add $1001 ($5) to B-> $25
	addb	$1002	; Add $1002 ($10) to B->$35
	ldx	#3	; Load 3 into X
	idiv		; (D)/X->X:Quotient, D: Remainder
	stx	$1100	; Quotient->$1100
	std	$1102	; Remainder->$1102
	swi		;software interupt
	end		;end