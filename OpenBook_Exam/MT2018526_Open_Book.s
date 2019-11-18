 AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__main  FUNCTION	

		VLDR.F S0,= 0 ; theta in radian
		VLDR.F S1,= 20.0 ; radius = 20 and center coordinates = (20,20)		
		VLDR.F S15,= 0.1 ; increment each time by 0.1 radian
		VLDR.F S16,= 6.3 ; 2*pi = 360 degrees for comparison
MAINLP
		LDR R3,= 15 ; N 
		VMOV.F S4,S0  ; 
		VLDR.F S5,= 1
		LDR R6,= 0 ;
		VLDR.F S6,= 1
		VLDR.F S7,= 1
		VLDR.F S10,= 1 ; for comparison
		VMOV.F S3,R3 ; 
		VCVT.F32.U32 S3,S3
		
		LDR R4,= 0 ; 
		LDR R10,= 0 ; 
		LDR R5,= 0 ; 
		LDR R0,= 1 ;
		VLDR.F S9,= 0 ; final result
		
NEXT
		LDR R12,= 0 ; for cosine
		CMP R10,R3
		BNE COSINE
		VMOV.F S11,S9 ; final cosine result
		LDR R12,= 1 ;  for sine 
		LDR R4,= 0 ;
		LDR R10,= 0 ; 
		BEQ SINE
		
		
SINENEXT
		
		CMP R10,R3 ;
		BNE SINE
		VMOV.F S12,S9 ; final sine result
		VMUL.F S13,S12,S1 ; rsin(theta) = y 
		VMUL.F S14,S11,S1 ; rcos(theta) = x 
		VADD.F S17,S13,S1 ; Y FOR VGA SCREEN by adding center cordinate
		VADD.F S18,S14,S1 ; X FOR VGA SCREEN by adding center cordinate

		VCVT.U32.F32 S17,S17
		VMOV R0,S17 ; 
		
		VCVT.U32.F32 S18,S18
		VMOV R1,S18 ;
		BL printMsg2p
		
		; theta is incrementated here
		VADD.F S0,S15
		VCMP.F S0,S16
		VMRS APSR_nzcv,FPSCR ; moving floating point flags to normal flags
		BLT MAINLP
		B stop
		
COSINE
		B EvenOdd ; to check whether n is even/odd
		
; sine(x) calculation
SINE
		AND R7,R4,#1
		ADD R4,R4,R4 
		ADD R4,#1
		CMP R4,#1
		LDR R5,= 0 ; 
		LDR R6,= 0 ;
		VLDR.F S5,= 1
		BEQ FIRSTITRSINE
		BNE POW1

LOOP 
		VDIV.F S8,S0,S5
		CMP R7,R0
		ITE LT
		VADDLT.F S9,S9,S8
		VSUBGE.F S9,S9,S8 ; s9 stores cosine
		ADD R10,#1
		MOV R4,R10
		VLDR.F S5,= 1
		VMOV.F S0,S4
		LDR R6,= 0 ;
		VLDR.F S6,= 1
		LDR R5,= 0 ; 
		CMP R12,#1
		BEQ SINENEXT
		BNE NEXT 
		
; to find x^2n OR x^(2n+1)
COSPOW 
		ADD R4,R4,R4
		CMP R4,#0
		BEQ FIRSTITR
		BNE POW1
POW1		

		SUB R11,R4,#1
		VMUL.F S0,S0,S4 ; S0 HAVE POWER VALUE
		ADD R5,#1
		CMP R5,R11
		BNE POW1
		BEQ FACT
		
FIRSTITR
		VMOV.F S0,S10
		VMOV.F S5,S10
		B LOOP
		
FIRSTITRSINE

		VMOV.F S0,S4
		VMOV.F S5,S4
		VMOV.F S9,S4
		ADD R10,#1
		MOV R4,R10
		B SINENEXT

FACT     ;finds factorial
		CMP R4,#0
		BEQ FIRSTITR
		VMUL.F S5,S5,S6 ; fact result
		ADD R6,#1
		VMOV.F S6,R6
		VCVT.F32.U32 S6,S6
		VADD.F S6,S6,S10
		CMP R6,R4
		BNE FACT
		BEQ LOOP
		
EvenOdd
		AND R7,R4,#01
		B COSPOW

VGA
			
stop    B stop ; stop program
        ENDFUNC
        END 		
		