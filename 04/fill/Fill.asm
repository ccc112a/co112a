// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//NUBLETZ NOTE : in this program, the black screen loop will change the screen start from the top of the screen
//				 while white screen loop will start from the bottom of the screen.

// Put your code here.
	@8192 //total repeat for changing the screen (n)
	D=A
	@0
	M=D //put n in RAM[0]
	@24576
	D=M
	@18
	D;JNE //if detect keyboard input, jump to line * 18
	@0 //else, start loop for white screen
	D=M //current n
	M=M-1 //next n value = current n - 1
	@0
	D;JEQ //if n equal to zero, break the loop
	@16383
	A=D+A // go to RAM[16383 + n]
	M=0 //set RAM[16383 + n] value into 0 (white screen)
	@8
	0;JMP //repeat the loop
	@0 //(line * 18) start loop for black screen
	D=M
	M=M-1
	@0
	D;JEQ
	@24576
	A=A-D // go to RAM[24576 - n]
	M=-1 //set RAM[24576 - n] value into -1 (black screen)
	@18
	0;JMP //repeat the loop