//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio05 - Guia 11
//-------------------------------------
module cpu;
  // simple computer with 3-bit op codes in first 3 bits and
  // 5 bit address in last 5 bits of 8-bit instructions,
  // memory size is 32x8 bits
  //
  //               code address
  // Instruction = xxx  aaaaa
  //               |        |
  //               7        0
  //               |        |
  // Value       = S000  0000
  //             signal  mantissa
  //
  // Name  Code  Op   Meaning                 Comment
  //
  // halt  000 00000  PC <- 0000              ; stop operation
  //
  // lda   001 aaaaa  AC <- MEM [aaaa]        ; load contents at address (aaaa) into AC
  // add   010 aaaaa  AC <- AC + MEM [aaaa]   ; add contents at address (aaaa) to AC
  // sto   011 aaaaa  MEM [aaaa] <- AC        ; store contents of AC into address (aaaa)
  // sub   100 aaaaa  AC <- AC - MEM [aaaa]   ; subtracts contents at address (aaaa) to AC
  //
  // jnz   101 aaaaa  PC <- (AC=0)? aaaa:PC+1 ; if (AC=0) then next instruction at (aaaa)
  // jnc   110 aaaaa  PC <- (CF<0)? aaaa:PC+1 ; if (CF<0) then next instruction at (aaaa)
  // jmp   111 aaaaa  PC <- aaaa              ; jump to instruction at address (aaaa)


// instruction mnemonics
parameter
   HLT   = 4'b0000,
   LDA   = 4'b0001,
   ADD   = 4'b0010,
   STO   = 4'b0011,
   SUB   = 4'b0100,
   JNZ   = 4'b0101,
   JNC   = 4'b0110,
   JMP   = 4'b0111,
   NOP   = 4'b1000;

// clock timing frequency
parameter clock = 1;

// registers and buffers
reg [4:0] PC;            // [PC]  Program Counter
reg [7:0] IR;            // [IR]  Instruction Register

reg [7:0] AC;            // [AC]  ACcumulator

reg [4:0] MA;            // [MA]  Memory Address
reg [7:0] MEM[0:31];     // 32    words of 08-bit of memory
reg [7:0] MD;            // [MD]  Memory Data

reg       CF;            //       Carry Flag
reg       ZF;            //       Zero  Flag

// memory mapping output
reg [7:0] M2,
          M3,            // memory[3] output mirror
          M4,            // memory[4] output mirror
          M8;            // memory[5] output mirror

reg [2:0] OP;            // instruction code

reg [7:0] OUTPUT;        // [OUT] output buffer (=AC)

// -------------------------------------------------------------------
//
// The two "initial" and the "always" constructs run concurrently
// Will stop the execution after 150 clock units.
//

initial begin: stop_at
// simulation time
   #(500*clock) $finish;
end

//
// Initialize the PC register and memory MEM with test program
// (execute once)
//

initial begin: init
// memory area (32 x 8 bits)
    MEM[00] = 8'b11101001;   // jmp  08 (program start)
// data segment
      MEM[01] = 8'b00000001;	//constante 1(para uso posterior)
		MEM[02] = 8'b00001110;	//dado1(14)
		MEM[03] = 8'b00000011;	//dado2(3)
		MEM[04] = 8'b00000000;	//quociente	
		MEM[05] = 8'b00000000;
		MEM[06] = 8'b00000000;
		MEM[07] = 8'b00000000;	//constante 0
		MEM[08] = 8'b00000000;	//multiplicacao
// instruction segment       // main: dado03 = dado01 % dado02 
      MEM[09] = 8'b00101000;	//lda 08 // AC = MEM[08]
		MEM[10] = 8'b01000011;	//add 03	// AC = AC + MEM[03]
		MEM[11] = 8'b01101000;	//sto 08 // MEM[08] = AC
		MEM[12] = 8'b00100100;	//lda 04	// AC = MEM[04]
		MEM[13] = 8'b01000001;	//add 01	// AC = AC + MEM[01]
		MEM[14] = 8'b01100100;	//sto 04	// MEM[04] = AC
		MEM[15] = 8'b00100010;	//lda 02	// AC = MEM[02]
		MEM[16] = 8'b10001000;	//sub 08	// AC = AC - MEM[08]
		MEM[17] = 8'b11011001;	//jnc 25	// se n�o carry PC = 25
		MEM[18] = 8'b00100100;	//lda 04	// AC = MEM[04]
		MEM[19] = 8'b10000001;	//sub 01	// AC = AC - MEM[01]
		MEM[20] = 8'b01100100;	//sto 04	// MEM[04] = AC
		MEM[21] = 8'b00101000;	//lda 08	// AC = MEM[08]
		MEM[22] = 8'b10000011;	//sub 03	// AC = AC - MEM[03]
		MEM[23] = 8'b01101000;	//sto	08	// MEM[08] = AC
		MEM[24] = 8'b11111010;	//jmp 26
		MEM[25] = 8'b10101001;	//jnz 09 se n�o for zero
		MEM[26] = 8'b00100010;	//lda 02	// AC = MEM[02]
		MEM[27] = 8'b10001000;	//sub 08	// AC = AC - MEM[08]
		MEM[28] = 8'b01100100;	//sto 04	// MEM[04] = AC
		MEM[29] = 8'b00000000;	//hlt
		MEM[30] = 8'b00000000;
		MEM[31] = 8'b11111111; // jmp  31

// memory dump
   $display ("\nMemory dump: \n");
    MA=0; 
    while (MA<8)
     begin
      $display ("%4d \t%3h %3h %3h %3h",
                 MA*4, MEM[MA*4],MEM[MA*4+1],MEM[MA*4+2],MEM[MA*4+3]);
       MA=MA+1;
     end
     $display ( "\n" );

//  program first instruction address
    PC = 0;                  // start of machine language program
    CF = 0;                  // Carry Flag = 0
    ZF = 0;                  // Zero  Flag = 0
    OP = 0;

// display commands
   $display("CPU - Simple Computer Simulation -Nome: Milton costa teles da silva-Matricula: 002751");
// monitor following registers and memory location and print when any change
   $monitor("time=%3d  \tPC=%d  \tIR=%2h  \tMA=%d  \tMD=%2h  \tAC=%d   CF=%d ZF=%d  M2=%d  M3=%d  M8=%d  result=%d",
             $time,PC,IR,MA,MD,AC,CF,ZF,M2,M3,M8,M4);

end // init

//
// main_process will loop until simulation time is over
//
always begin: instruction_cycle

   // instruction fetch
      #clock MA <= PC;                   // load instruction address
      #clock MD <= MEM[MA];              // memory select and
      #clock IR <= MD;                   // load instruction register
             MA <= MD[4:0];              // last bits are address
      #clock PC <= PC + 1;               // next instruction
                                         // memory mapped output buffers
               M2 <= MEM[02];
					M3 <= MEM[03];
					M4 <= MEM[04];
					M8 <= MEM[08];


   // decode and execute instruction
      if ( OP != NOP )
       begin
         OP = IR[7:5];
        $display (" PC=%d OP=%4b\n", PC, OP);
       end
      else
       $display  (" STOP");
      case ( OP )
        HLT:   begin
              #clock PC = 30;
               $display (" PC=%d -> hlt\n", PC+1);
               end
        LDA:   begin
              #clock MD[7:0] <= MEM[MA];
              #clock AC <= MD;
               if (AC  ==  0 ) begin ZF=1;               end
               else            begin ZF=0;               end
               OUTPUT = AC;
               $display (" PC=%d -> lda [%h] = %h (ZF=%b)\n", PC, MA, MD, ZF);
               end
        ADD:   begin
              #clock MD[7:0] <= MEM[MA];
              #clock
               if (AC+MD<=255) begin CF=0; AC=AC+MD;     end
               else            begin CF=1; AC=AC+MD-255; end
               if (AC  ==  0 ) begin ZF=1;               end
               else            begin ZF=0;               end
               OUTPUT = AC;
               $display (" PC=%d -> add [%h] = %h (CZ=%b%b)\n", PC, MA, MD, CF, ZF);
               end
        STO:   begin
              #clock MD <= AC;
              #clock MEM[MA] <= MD[7:0];
               $display (" PC=%d -> sto %h @ [%h]\n", PC, MD, MA);
               end
        SUB:   begin
              #clock MD[7:0] <= MEM[MA];
              #clock
               if (AC-MD<256) begin CF=0; AC=AC-MD;     end
               else           begin CF=1; AC=AC-MD+256; end
               if (AC  == 0 ) begin ZF=1;               end
               else           begin ZF=0;               end
               OUTPUT = AC;
               $display (" PC=%d -> sub [%h] = %h (CZ=%b%b)\n", PC, MA, MD, CF, ZF);
               end
        JNZ:   begin
              #clock
               $display (" PC=%d -> jnz (%h==0) %h (ZF=%b)\n", PC, AC, MA, ZF);
               if (ZF == 0)
                   PC <= MA;
               end
        JNC:   begin
              #clock
               $display (" PC=%d -> jnc (%h<0) %h (CF=%b)\n", PC, AC, MA, CF);
               if (CF == 0)
                   PC <= MA;
               end
        JMP:   begin
              #clock
               $display (" PC=%d -> jmp %d\n", PC, MA);
               PC <= MA;
               end
        NOP:   begin
               #clock; // do nothing
               end
      endcase
end // main process
endmodule