     AREA     even_odd, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		MOV R1,#0x167	; move a number to r1
		;MOV R1,#0x164	
		AND R2,R1,#0x01 ; perform immidiate and of that number with 01
		CMP R2,#0x0 	; compare the value of r2 with 0
		ITE EQ 			; check for equality		
		MOVEQ R3,#0x0	; if r2 = 0, move 0 to r3 and it indicates the number is EVEN
		MOVNE R3,#0x1	; if r2 = 1, move 1 to r3 and it indicates the number is ODD
stop    B stop ; stop program
     ENDFUNC
     END 
