     AREA     tangent, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		MOV R6,#10 ; number of terms in the expansion
		;registers for even/odd functions + functionality 
		MOV R9,#1 ; starting from 1
		VLDR.F32 S1,=1.5707; starting value of x for tan(x)
		VMUL.F32 S2,S1,S1; y = x*x
		VMOV.F32 S3,S1; moving x to S3 for sine series : vara
		VMOV.F32 S4,#1; moving 1 to S4 for cosine series : varb
		VLDR.F32 S5,=-1 ; 
		VMOV.F32 S13,S1 ; initializing x to sum(sine)
		VMOV.F32 S8,#1 ; initializing 1 to sum(cosine)
		MOV R0,#1 ;
		MOV R7,#1 ;
		
FACT2	CMP R9,R6 ;
		BEQ LEVEL ;
		
		ADD R9,R9,#1 ; incrementing the value of R9 every time
		B FACT1
		;registers for factorial
FACT1	MOV R1,#1 ; initial value
		MOV R3,#1 ; initializing product to 1
		MOV R2,R9 ; moving a value to r2 whose factorial needs to be found
		MOV R10,#1 ; to increment r1(loop)
		
FACT    CMP R1,R2 ; this computes the factorial
		BEQ CMPR  ;
		
		MUL R3,R3,R2 ; Product = product*r2
		SUB R2,R2,R7 ; decrement the value
		B FACT ;
	
CMPR	AND R8,R9,#0x01 ; perform immidiate and of that number with 01
		CMP R8,#0x0 	; compare the value of r2 with 0
		MOV R1,#1 ;
		ITE EQ 			; check for equality		
		MOVEQ R4,R3	; it indicates the number is EVEN
		MOVNE R5,R3	; it indicates the number is ODD
		B SERIES ;
		
SERIES	CMP R4,R3 ;
		BEQ COSINE ; go the cosine level for sum calculation
		CMP R5,R3 ;
		BEQ SINE ; go the sine level for sum calculation
		
		
SINE    VMUL.F32 S3,S3,S2 ; vara = vara * y
		VMUL.F32 S3,S3,S5 ; vara = vara * -1
		VMOV.F32 S10,R5 ; moving regsiter to floating point register
		VCVT.F32.U32 S10,S10 ;
		VDIV.F32 S6,S3,S10 ; var1 = vara/fact(odd)
		VADD.F32 S13,S13,S6 ; sum1 = sum1 + var1
		ADD R0,R0,#1;
		B FACT2 ;
			
COSINE  VMUL.F32 S4,S4,S2 ; varB = varB * y
		VMUL.F32 S4,S4,S5 ; varB = varB * -1
		VMOV.F32 S9,R4 ; moving regsiter to floating point register
		VCVT.F32.U32 S9,S9 ;
		VDIV.F32 S7,S4,S9 ; var2 = varB/fact(even)
		VADD.F32 S8,S8,S7 ; sum2 = sum2 + var2
		ADD R0,R0,#1;
		B FACT2 ;
		
		
LEVEL	VDIV.F32 S11,S13,S8 ; tanx = sinx/cosx , S11 contains the final result

stop    B stop ; stop program
     ENDFUNC
     END 
		 
	