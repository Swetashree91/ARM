     AREA     exponent, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		VLDR.F32 S1,=50 ; i am calculating e^x
		MOV R1,#30;
		MOV R2,#1 ; initializing a count variable to 1 for further comparison with number of terms
		VMOV.F32 S2,#1 ; 'var' initialized to 1
		VMOV.F32 S3,#1 ; initializing 'i' to be 1
		VMOV.F32 S4,#1 ; 'sum' of series initialized to 1
		VMOV.F32 S5,#1 ; stores the value of 1 that has to be added to 'i' in every iteration
		MOV R3,#1 ; for 1 to be added to count each time
		
LOOP 	CMP R2,R1 ; compares number of terms to count, i.e if terms < count
		BGE stop  ; if count >= no of terms
		
		VDIV.F32 S6,S1,S3 ; val = x/i
		VMUL.F32 S2,S2,S6 ; var = var * val
		VADD.F32 S4,S4,S2 ; sum = sum + var
		VADD.F32 S3,S3,S5 ; i = i + 1
		ADD R2,R2,R3 ;  count++
		
		B LOOP ; branch to loop 
		
stop    B stop ; stop program
     ENDFUNC
     END 