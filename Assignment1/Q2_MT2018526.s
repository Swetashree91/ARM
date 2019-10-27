     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		MOV R1,#20  ; move 20 to r1
		MOV R2,#5   ; move 5 to r2
		MOV R3,#15  ; move 15 to r3
		CMP R1,R2   ; compare r1 & r2
		IT HI		; if then larger than
		MOVHI R2,R1 ; move r1 to r2 if r1>r2
		CMP R2,R3   ; compare r2 & r3
		IT HI		; compare r2 & r3
		MOVHI R3,R2 ; move r2 to r3 if r2>r3
		MOV R4,R3   ; move largest number to r4
stop    B stop ; stop program
     ENDFUNC
     END 