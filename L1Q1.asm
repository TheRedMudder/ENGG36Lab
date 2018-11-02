count	equ	10	; Set Count Label Address to 10

	org	$1000	; SP to mem address $1000
num	fdb	$6924	; form double byte with $69 in $1000 and $24 in $1001
n1	rmb	2	; reserves 2 mem byte for n1 $1002-$1003
n2	rmb	2	; reserves 2 mem byte for n2 $1004-$1005
	org	$2000	; stack pointer
	ldd	num	; load num into d, $69 to A and $24 into B
	std	n1	; stores D into n1, $1002-$1003 is $6924
	addd	#num	;Add the memory address of num, $6924+$1000->$7924
	addd	#count	; Add count value, $7924+10->E
	std	n2	;store d into n2, $79 to $1004, $2E->$1005
	swi		;software interupt
	end		;end