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



(LOOP1)
@KBD
D=M
@KEYPRESS
D;JNE

@SCREEN
D=A
@addr
M=D
@8191
D=A
@n
M=D

(LOOP3)
@addr
A=M
M=0

@n
M=M-1
@addr
M = M+1

@n
D=M
@LOOP3
D;JGT

@LOOP1
0;JMP
	 
(KEYPRESS)
@SCREEN
D=A
@addr
M=D
@8191
D=A
@n
M=D

(LOOP2)
@addr
A=M
M=-1

@n
M=M-1
@addr
M = M+1

@n
D=M
@LOOP2
D;JGT


@LOOP1
0;JMP


