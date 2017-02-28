//
// Flávio Andrade Amaral Motta - 392001
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
  // halt  0000 00000  PC <- 0000              ; stop operation
  //
  // lda   0001 aaaaa  AC <- MEM [aaaa]        ; load contents at address (aaaa) into AC
  // add   0010 aaaaa  AC <- AC + MEM [aaaa]   ; add contents at address (aaaa) to AC
  // sto   0011 aaaaa  MEM [aaaa] <- AC        ; store contents of AC into address (aaaa)
  // sub   0100 aaaaa  AC <- AC - MEM [aaaa]   ; subtracts contents at address (aaaa) to AC
  //
  // jnz   0101 aaaaa  PC <- (AC=0)? aaaa:PC+1 ; if (AC=0) then next instruction at (aaaa)
  // jnc   0110 aaaaa  PC <- (CF<0)? aaaa:PC+1 ; if (CF<0) then next instruction at (aaaa)
  // jmp   0111 aaaaa  PC <- aaaa              ; jump to instruction at address (aaaa)


// instruction mnemonics
parameter
   HLT   = 5'b00000,
   LDA   = 5'b00001,
   ADD   = 5'b00010,
   STO   = 5'b00011,
   SUB   = 5'b00100,
   JNZ   = 5'b00101,
   JNC   = 5'b00110,
   JMP   = 5'b00111,
   NOP   = 5'b01000;

// clock timing frequency
parameter clock = 1;

// registers and buffers
reg [9:0] PC;            // [PC]  Program Counter
reg [15:0] IR;            // [IR]  Instruction Register

reg [15:0] AC;            // [AC]  ACcumulator

reg [9:0] MA;            // [MA]  Memory Address
reg [15:0] MEM[0:31];     // 32    words of 016-bit of memory
reg [15:0] MD;            // [MD]  Memory Data

reg       CF;            //       Carry Flag
reg       ZF;            //       Zero  Flag

// memory mapping output
reg [15:0] M3,            // memory[3] output mirror
          M4,            // memory[4] output mirror
          M5;            // memory[5] output mirror

reg [5:0] OP;            // instruction code

reg [15:0] OUTPUT;        // [OUT] output buffer (=AC)

// -------------------------------------------------------------------
//
// The two "initial" and the "always" constructs run concurrently
// Will stop the execution after 150 clock units.
//

initial begin: stop_at
// simulation time
   #(134*clock) $finish;
end

//
// Initialize the PC register and memory MEM with test program
// (execute once)
//

initial begin: init
// memory area (32 x 16 bits)
    MEM[00] = 16'b0111000000001000;   // jmp  08 (program start)
// data segment
    MEM[01] = 16'b0000000000000000;   // data constant  = 0
    MEM[02] = 16'b0000000000000001;   // data constant  = 1
    MEM[03] = 16'b0000000000000011;   // data 1   = 0011 = (03)
    MEM[04] = 16'b0000000000000010;   // data 2   = 0010 = (02)
    MEM[05] = 16'b0000000000000001;   // data 3   = 0001 = (01)
    MEM[06] = 16'b0000000000000000;   //
    MEM[07] = 16'b0000000000000000;   // result
// instruction segment       // main: data4 = data1 + data2 + data3
    MEM[08] = 16'b0001000000000111;   // lda  07 // load result
    MEM[09] = 16'b0010000000000011;   // add  03 // A=A+mem[03]
    MEM[10] = 16'b0011000000000111;   // sto  07 // result=A
    MEM[11] = 16'b0001000000000111;   // lda  07 // A=result
    MEM[12] = 16'b0010000000000100;   // add  04 // A=A+mem[04]
    MEM[13] = 16'b0011000000000111;   // sto  07 // result=A
    MEM[14] = 16'b0001000000000111;   // lda  07 // A=result
    MEM[15] = 16'b0010000000000101;   // add  05 // A=A+mem[05]

    MEM[16] = 16'b0011000000000111;   // sto  07 //
    MEM[17] = 16'b0000000000000000;   // hlt
    MEM[18] = 16'b0000000000000000;   //
    MEM[19] = 16'b0000000000000000;   //
    MEM[20] = 16'b0000000000000000;   //
    MEM[21] = 16'b0000000000000000;   //
    MEM[22] = 16'b0000000000000000;   //
    MEM[23] = 16'b0000000000000000;   //

    MEM[24] = 16'b0000000000000000;   //
    MEM[25] = 16'b0000000000000000;   //
    MEM[26] = 16'b0000000000000000;   //
    MEM[27] = 16'b0000000000000000;   //
    MEM[28] = 16'b0000000000000000;   //
    MEM[29] = 16'b0000000000000000;   //
    MEM[30] = 16'b0000000000000000;   //
    MEM[31] = 16'b1111111111111111;   // jmp  31

// memory dump
   $display ("\nMemory dump: \n");
    MA=0;
    while (MA<16)
     begin
      $display ("%4d \t%3h %3h %3h %3h",
                 MA*9, MEM[MA*9],MEM[MA*9+3],MEM[MA*9+5],MEM[MA*9+5]);
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
             MA <= MD[9:0];              // last bits are address
      #clock PC <= PC + 1;               // next instruction
                                         // memory mapped output buffers
             M3 <= MEM[03];              // output memory[13]
             M4 <= MEM[04];              // output memory[14]
             M5 <= MEM[07];              // output memory[15]

   // decode and execute instruction
      if ( OP != NOP )
       begin
         OP = IR[15:11];
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
              #clock MD[15:0] <= MEM[MA];
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
