     AREA     gcd, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		MOV R1, #56      ; 56 is moved to r1
        MOV R2, #34       ; 34 is moved to r2
Loop    CMP R1, R2		 ; compare r1 and r2 and execute loop till r1 != r2
        SUBGT R1, R1, R2 ; r1 = r1 - r2 if r1>r2
        SUBLT R2, R2, R1 ; r2 = r2 - r1 if r1<r2
        BNE Loop		 ; branch if not equal, to loop
		
stop    B stop ; stop program
     ENDFUNC
     END 
