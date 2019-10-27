     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
		MOV R0,#0	; move 0 to r0
		MOV R1,#1	; move 1 to r1 as the first two numbers are 0 and 1
		MOV R3,#100	; range is till 100
		MOV R4,#0	; initialize sum = r4 to be 0 
		ADD R4,R0,R1; r4 = r0 + r1
LOOP1 	CMP R4,R3   ; compares sum and range
		BLE LOOP2   ; if sum < range, go to loop2
		B stop		; Else goto end  
LOOP2 	MOV R0,R1   ; move r1 to r0
		MOV R1,R4   ; move sum to r1 so that they become the previous 2 values
		ADD R4,R0,R1; r4 = r0 + r1
		B LOOP1     ; keep comparing sum and range till sum > range
stop    B stop 		; stop program
     ENDFUNC
     END 