# ARM PROJECT

Our project is based on synthesizing the verilog code of **Cortex M0 Processor** and implementing the Hex Code generated from **Keil Simulator** on **Artrix 7 Basys 3 FPGA Board**.


## Objectives:
- Interfacing AHB-LITE system bus with the Processor
- Writing an assembly code and generation of hex code file for the memory module of AHB-LITE using Keil simulator.
- Using the hex code as input, displaying the output in terms of
	> VIO (Virtual Input/Output) 
	> ILA (Integrated Logic Analyzer)
	> LEDs on the FPGA
- Writing an assembly code for  a timer that should count from 0000 to FFFF and displaying the timer values on 7-segment display on FPGA.
- Writing a code of factorial in Keil and show the output on the FPGA using LEDs.

## Block Diagram of the Hardware Module
![Block Diagram of the Hardware Module](https://photos.google.com/photo/AF1QipPgt_1fLr3q2ni1zUDSmXyhvKoo0OGqFMb2hlKj)
## Schematics
![LED](https://photos.google.com/photo/AF1QipPXjjqZPLh9H0xXkARQjfeSOZ6Q56MjpDlXP5OV)
![VIO and ILA](https://photos.google.com/photo/AF1QipPXjjqZPLh9H0xXkARQjfeSOZ6Q56MjpDlXP5OV)
![7_Segement_Display](https://photos.google.com/photo/AF1QipMQRMBCmxTGSEOyJwec5xsh-nAnpdPibK5pt6Jh)
## Description & Problems Faced:
- We tried displaying 2 values on hardware by giving some delay in the assembly code which had a loop that ran a counter. But, all the three means to display the output showed only the first value. 
- We also wrote an assembly code of factorial and tried implementing the generated hex code on FPGA using LEDs but it didn't work.
- The functionality of timer is missing in the 7 segment assembly code which resulted in a random value on the 7 segment display of FPGA when RESET is removed.

## Results:

![VIO output at RESET](https://photos.google.com/photo/AF1QipNtqZOYN0qpkmn3ajwIFiWHZKYVrc8y9g1VJy0D)
![VIO output at RESET disabled](https://photos.google.com/photo/AF1QipPCX1yCTg6s0UhmxNg7m8CT0ltba7X2HN0CwstH)
![ILA output](https://photos.google.com/photo/AF1QipNVgh6fIa4TDjIQQc5wpbH6cqn9LEZCb7iFZbFV)
![LED output on FPGA](https://photos.google.com/photo/AF1QipODIloBkgQUOgmVlnuo9AUOv9jm51HClPsxEu7H)
![7 Segment display](https://photos.google.com/photo/AF1QipNayXwuO0IJZl6W35hMaQ1CsFaucYJHtPxw1XLJ)
![7_Segment_Display when RESET](https://photos.google.com/photo/AF1QipMOK22c1qwyZl9xGFgCEirwwOE99fhMRjb1UaY5)

## Conclusion:
We understood the basics behind AHB-LITE system bus and successfully interfaced it with the core of the processor. We also synthesized the verilog codes and generated bitstream to get it running on the FPGA. The problem that we found was, the decoder in the memory of AHB_LITE could not decipher the LOOPs in assembly. That's why the results we obtained were static in nature. We also couldn't incorporate the concept of delay.
