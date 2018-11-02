	org	$1000	; SP to mem address $1000
M	dc.b	$12,13,$56; 3 bytes for multiplicand,$1000-$1001-$1002
N	dc.b	$65,$43,21; 3 bytes for multiplier,  $1003-$1004-$1005
	org	$1100
P	dc.b	6	; 6 bytes for product,$1006-$1007-$1008-$1009-$100A-$100B
	
	org	$2000	; SP to mem address $2000
	ldd	M+1	; place Ml in D
	ldy	N+1	; place N1 in D
	emul		; compute Ml*Nl Y:D
	sty	P+2	; save upper 16 bits of partial product MlNl
	std	P+4	; save lower 16 bits of partial product MlNl


	ldaa	M	; place Mh in A
	ldab	N	; place Nh in B
	mul		; A*B->A:B
	std	P	; Store A->P, B->P+1

	ldaa	#0	; Load 0s into A
	ldab	M	; Load Mh in B
	ldy	N+1	; Load Nl in Y
	emul		; compute Mh*Nl Y:D
	addd	P+2	; add lower half of MhNl and uper half of MlNl
	std	P+2	; Save sum to P+2-P+3
	tfr	Y,D	; move upper half of MhNl to A:B 
	adcb	P+1	; "add with carry" upper half of MhNl and
	stab	P+1	; lower half of MlNh
	adca	P
	staa	P
	
	
	ldaa	#0	; Load 0s into A
	ldab	N	; Load Nh in B
	ldy	M+1	; Load Ml in Y
	emul		; compute Mh*Nl Y:D
	addd	P+2	; add lower half of MlNh with rest
	std	P+2	; Save sum to P+2-P+3
	tfr	Y,D	; move upper half of MlNh to A:B 
	adcb	P+1	; "add with carry" upper half of MlNh
	stab	P+1	; l
	adca	P
	staa	P
	swi
	end
	