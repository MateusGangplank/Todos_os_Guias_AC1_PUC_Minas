//
// Simple CPU in Verilog HDL
// PUC-Minas - January 1, 2012
// Instituto de Ciencias Exatas e Informática
//
module cpu;
  // simple computer with 3-bit op codes in first 3 bits and
  // 5 bit address in last 5 bits of 8-bit instructions,
  // memory size is 64x8 bits
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
reg [7:0] M3,            // memory[3] output mirror
          M4,            // memory[4] output mirror
          M5;            // memory[5] output mirror

reg [2:0] OP;            // instruction code

reg [7:0] OUTPUT;        // [OUT] output buffer (=AC)

// -------------------------------------------------------------------
//
// The two "initial" and the "always" constructs run concurrently
// Will stop the execution after (more than) 150 clock units.
//

initial begin: stop_at
// simulation time
   #(174*clock) $finish;
end

//
// Initialize the PC register and memory MEM with test program
// (execute once)
//

initial begin: init
// memory area (32 x 8 bits)
    MEM[00] = 8'b11101001;   // jmp  09 (program start)
// data segment
    MEM[01] = 8'b00000000;   // data 3H   
    MEM[02] = 8'b00000001;   // data 3L   = 0010 = (02)
    MEM[03] = 8'b00000000;   // data 1H   
    MEM[04] = 8'b00000011;   // data 1L   = 0011 = (03)
    MEM[05] = 8'b00000000;   // data 2H   =
    MEM[06] = 8'b00000000;   // data 2L   = 0100 = (04) 
    MEM[07] = 8'b00000000;   // result H
// instruction segment       // main:
    MEM[08] = 8'b00000000;   // result L  
	 MEM[09] = 8'b00100100;   // lda  04 // A=3
    MEM[10] = 8'b01000110;   // add  06 // A=3+4
    MEM[11] = 8'b01101000;   // sto  08 // result L = A
    MEM[12] = 8'b00100011;   // lda  03 // A=3q
    MEM[13] = 8'b01000101;   // add  05 // A=3q+4q
    MEM[14] = 8'b01100111;   // sto  07 // result H = A
    MEM[15] = 8'b00101000;   // lda  08

    MEM[16] = 8'b01000010;   //
    MEM[17] = 8'b01100111;   //
    MEM[18] = 8'b00101000;   //
    MEM[19] = 8'b01000001;   //
    MEM[20] = 8'b01101000;   //
    MEM[21] = 8'b00000000;   // hlt
    MEM[22] = 8'b00000000;   //
    MEM[23] = 8'b00000000;   //

    MEM[24] = 8'b00000000;   //
    MEM[25] = 8'b00000000;   //
    MEM[26] = 8'b00000000;   //
    MEM[27] = 8'b00000000;   //
    MEM[28] = 8'b00000000;   //
    MEM[29] = 8'b00000000;   //
    MEM[30] = 8'b00000000;   //
    MEM[31] = 8'b11111111;   // jmp  31

    MEM[32] = 8'b00000000;   //
    MEM[33] = 8'b00000000;   //
    MEM[34] = 8'b00000000;   //
    MEM[35] = 8'b00000000;   //
    MEM[36] = 8'b00000000;   //
    MEM[37] = 8'b00000000;   //
    MEM[38] = 8'b00000000;   //
    MEM[39] = 8'b00000000;   //

    MEM[40] = 8'b00000000;   //
    MEM[41] = 8'b00000000;   //
    MEM[42] = 8'b00000000;   //
    MEM[43] = 8'b00000000;   //
    MEM[44] = 8'b00000000;   //
    MEM[45] = 8'b00000000;   //
    MEM[46] = 8'b00000000;   //
    MEM[47] = 8'b00000000;   //

    MEM[48] = 8'b00000000;   //
    MEM[49] = 8'b00000000;   //
    MEM[50] = 8'b00000000;   //
    MEM[51] = 8'b00000000;   //
    MEM[52] = 8'b00000000;   //
    MEM[53] = 8'b00000000;   //
    MEM[54] = 8'b00000000;   //
    MEM[55] = 8'b00000000;   //

    MEM[56] = 8'b00000000;   //
    MEM[57] = 8'b00000000;   //
    MEM[58] = 8'b00000000;   //
    MEM[59] = 8'b00000000;   //
    MEM[60] = 8'b00000000;   //
    MEM[61] = 8'b00000000;   //
    MEM[62] = 8'b00000000;   //
    MEM[63] = 8'b00000000;   //

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
   $display("CPU - Simple Computer Simulation - v1.0\n");
// monitor following registers and memory location and print when any change
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
             MA <= MD[4:0];              // last bits are address
      #clock PC <= PC + 1;               // next instruction
                                         // memory mapped output buffers
             M3 <= MEM[03];              // output memory[13]
             M4 <= MEM[04];              // output memory[14]
             M5 <= MEM[07];              // output memory[15]

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
