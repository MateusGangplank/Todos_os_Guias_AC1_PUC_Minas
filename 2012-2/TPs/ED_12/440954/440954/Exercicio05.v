// -------------------------
// Exercicio05
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

//
// Simple CPU in Verilog HDL
// PUC-Minas - January 1, 2012
// Instituto de Ciencias Exatas e Informática
//
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
  // lda   0000001 aaaaa  AC <- MEM [aaaa]        ; load contents at address (aaaa) into AC
  // add   0000010 aaaaa  AC <- AC + MEM [aaaa]   ; add contents at address (aaaa) to AC
  // sto   0000011 aaaaa  MEM [aaaa] <- AC        ; store contents of AC into address (aaaa)
  // sub   0000100 aaaaa  AC <- AC - MEM [aaaa]   ; subtracts contents at address (aaaa) to AC
  //
  // jnz   0000101 aaaaa  PC <- (AC=0)? aaaa:PC+1 ; if (AC=0) then next instruction at (aaaa)
  // jnc   0000110 aaaaa  PC <- (CF<0)? aaaa:PC+1 ; if (CF<0) then next instruction at (aaaa)
  // jmp   0000111 aaaaa  PC <- aaaa              ; jump to instruction at address (aaaa)
  // cnp   0001000 aaaaa  AC <- ~AC + 1b'1        ; complemento de dois


// instruction mnemonics
parameter
   HLT   = 7'b0000000,
   LDA   = 7'b0000001,
   ADD   = 7'b0000010,
   STO   = 7'b0000011,
   SUB   = 7'b0000100,
   JNZ   = 7'b0000101,
   JNC   = 7'b0000110,
   JMP   = 7'b0000111,
   CNP   = 7'b0001000,
   NOP   = 7'b1111111;

// clock timing frequency
parameter clock = 1;

// registers and buffers
reg [8:0]  PC;            // [PC]  Program Counter
reg [15:0] IR;            // [IR]  Instruction Register

reg [15:0] AC;            // [AC]  ACcumulator

reg [8:0]  MA;            // [MA]  Memory Address
reg [15:0] MEM[0:31];     //  32   08-bit words of memory
reg [15:0] MD;            // [MD]  Memory Data

reg        CF;            //       Carry Flag
reg        ZF;            //       Zero  Flag

// memory mapping output
reg [15:0] M3,            // memory[3] output mirror
           M4,            // memory[4] output mirror
           M5;

reg [6:0] OP;            // instruction code

reg [15:0] OUTPUT;        // [OUT] output buffer (=AC)

// -------------------------------------------------------------------
//
// The two "initial" and the "always" constructs run concurrently
// Will stop the execution after 150 clock units (or less).
//

initial begin: stop_at
// simulation time
   #(150*clock) $finish;
end

//
// Initialize the PC register and memory MEM with test program
// (execute once)
//

initial begin: init
// memory area (32 x 16 bits)
    MEM[00] = 16'b0000111000001001;   // jmp  09 (main program start)
// data segment
    MEM[01] = 16'b0000000000000000;   // data constant  = 0
    MEM[02] = 16'b0000000000000001;   // data constant  = 1
	 MEM[03] = 16'b0000000010000000;   // data 1 = 0000000010000000 = (128)
	 MEM[04] = 16'b0000000000100000;   // data 2 = 0000000000100000 = (32)
	 MEM[05] = 16'b0000000000000000;   // data 3 = data1 / 2 * data2
	 MEM[06] = 16'b0000000000000010;   // data constant  = 2
	 MEM[07] = 16'b0000000000000000;   // 
	 MEM[08] = 16'b0000000000000000;   // 
	 
// instruction segment       // main:
	 MEM[09] = 16'b0000001000000100;   // lda  04 // A=mem[04]
	 MEM[10] = 16'b0000010000000100;   // add  04 // A=A+mem[04]
	 MEM[11] = 16'b0000010000000110;   // add  06 // A=A+mem[06]
	 MEM[12] = 16'b0000011000000100;   // sto  04 // mem[04]=A
	 MEM[13] = 16'b0000001000000011;   // lda  03 // A=mem[03]
	 MEM[14] = 16'b0000100000000100;   // sub  04 // A=A-mem[04]
	 MEM[15] = 16'b0000011000000011;   // sto  03 // mem[03]=A
	 MEM[16] = 16'b0000110000010111;   // jnc  09 arrumar
	 MEM[17] = 16'b0000011000000111;   // sto  07 // mem[07]=A
	 MEM[18] = 16'b0000001000000100;   // lda  04 // A=mem[04]
	 MEM[19] = 16'b0000010000000111;   // add  07 // A=A+mem[07]
	 MEM[20] = 16'b0000100000000010;   // sub  02 // A=A-1
	 MEM[21] = 16'b0000011000000111;   // sto  07 // mem[07]=A
	 MEM[22] = 16'b0000111000011010;   // jmp
	 MEM[23] = 16'b0000101000001101;   // jnz
	 MEM[24] = 16'b0000001000000011;   // lda  03 // A=mem[03]
	 MEM[25] = 16'b0000011000000111;   // sto  07 // mem[07]=A
	 MEM[26] = 16'b0000000000000000;   // hlt	 
	 
	 MEM[31] = 16'b1111111111111111;   // jmp 31

// memory dump
   $display ("\nMemory dump (before running): \n");
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
   $display("CPU - Simple Computer Simulation - v1.0\n");
// monitor following registers and memory location 
// and print then when any change occurs
   $monitor(" time=%03d \tPC=%d \tIR=%h \tMA=%2d \tMD=%h \tAC=%2d  CF=%b  ZF=%b  M3=%2d  M4=%2d  M5=%2d",
             $time, PC, IR, MA, MD, AC, CF, ZF, M3, M4, M5);

end // init

//
// main_process will loop until simulation time is over
//
always begin: instruction_cycle

   // instruction fetch
      #clock MA <= PC;                   // load instruction address
      #clock MD <= MEM[MA];              // memory select and
      #clock IR <= MD;                   // load instruction register
             MA <= MD[8:0];              // last bits are address
      #clock PC <= PC + 1;               // next instruction
                                         // memory mapped output buffers
             M3 <= MEM[03];              // output memory[13]
             M4 <= MEM[04];              // output memory[14]
             M5 <= MEM[07];              // output memory[15]

   // decode and execute instruction
      if ( OP != NOP )
       begin
         OP = IR[15:9];
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
              #clock MD[15:0] <= MEM[MA];
              #clock AC <= MD;
               if (AC  ==  0 ) begin ZF=1;               end
               else            begin ZF=0;               end
               OUTPUT = AC;
               $display (" PC=%d -> lda [%h] = %h (ZF=%b)\n", PC, MA, MD, ZF);
               end
        ADD:   begin
              #clock MD[15:0] <= MEM[MA];
              #clock
               if (AC+MD<=255) begin CF=0; AC=AC+MD;     end // add
               else            begin CF=1; AC=AC+MD-255; end // signal adjust
               if (AC  ==  0 ) begin ZF=1;               end
               else            begin ZF=0;               end
               OUTPUT = AC;
               $display (" PC=%d -> add [%h] = %h (CZ=%b%b)\n", PC, MA, MD, CF, ZF);
               end
        STO:   begin
              #clock MD <= AC;
              #clock MEM[MA] <= MD[15:0];
               $display (" PC=%d -> sto %h @ [%h]\n", PC, MD, MA);
               end
        SUB:   begin
              #clock MD[15:0] <= MEM[MA];
              #clock
               if (AC-MD<256) begin CF=0; AC=AC-MD;     end // subtract
               else           begin CF=1; AC=AC-MD+256; end // signal adjust
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
		  CNP:
		  			begin
					#clock AC <= ~AC + 1'b1;
					$display (" PC=%d -> cnp AC = %d\n", PC, AC);
					end
      endcase
end // main process
endmodule
