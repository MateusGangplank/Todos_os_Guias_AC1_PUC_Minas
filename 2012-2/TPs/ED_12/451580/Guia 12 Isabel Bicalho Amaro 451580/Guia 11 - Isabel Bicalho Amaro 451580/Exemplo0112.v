// Isabel Bicalho Amaro 451580
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
reg [7:0] MEM[0:31];     //  32   08-bit words of memory
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
// Will stop the execution after 150 clock units (or less).
//

initial begin: stop_at
// simulation time
   #(40*clock) $finish;
end

//
// Initialize the PC register and memory MEM with test program
// (execute once)
//

initial begin: init
// memory area (32 x 8 bits)
    MEM[00] = 8'b11101000;   // jmp  08 (main program start)
// data segment
    MEM[01] = 8'b00000000;   // data constant  = 0
    MEM[02] = 8'b00000001;   // data constant  = 1
    MEM[03] = 8'b00000011;   // data 1   = 0011 = (03)
    MEM[04] = 8'b00000010;   // data 2   = 0010 = (02)
    MEM[05] = 8'b00000001;   // data 3   = 0001 = (01)
    MEM[06] = 8'b00000000;   //
    MEM[07] = 8'b00000000;   // result
// instruction segment       // main:
    MEM[08] = 8'b00100011;   // lda  03 // A=result
    MEM[09] = 8'b01000100;   // add  04 // A=A+mem[04]
    MEM[10] = 8'b10000101;   // add  05 // A=A-mem[05]
    MEM[11] = 8'b01100111;   // sto  07 // mem[07]=A
    MEM[12] = 8'b00000000;   // hlt 
    MEM[13] = 8'b00000000;   // 
    MEM[14] = 8'b00000000;   // 
    MEM[15] = 8'b00000000;   // 

    MEM[16] = 8'b00000000;   //
    MEM[17] = 8'b00000000;   //
    MEM[18] = 8'b00000000;   //
    MEM[19] = 8'b00000000;   //
    MEM[20] = 8'b00000000;   //
    MEM[21] = 8'b00000000;   //
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
               if (AC+MD<=255) begin CF=0; AC=AC+MD;     end // add
               else            begin CF=1; AC=AC+MD-255; end // signal adjust
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
      endcase
end // main process
endmodule

/*
    Memory dump (before running): 
    
       0 	 e8  00  01  03
       4 	 02  01  00  00
       8 	 23  44  85  67
      12 	 00  00  00  00
      16 	 00  00  00  00
      20 	 00  00  00  00
      24 	 00  00  00  00
      28 	 00  00  00  ff
    
    
    CPU - Simple Computer Simulation - v1.0
    
     time=000 	PC= 0 	IR=xx 	MA= 8 	MD=xx 	AC= x  CF=0  ZF=0  M3= x  M4= x  M5= x
     time=001 	PC= 0 	IR=xx 	MA= 0 	MD=xx 	AC= x  CF=0  ZF=0  M3= x  M4= x  M5= x
     time=002 	PC= 0 	IR=xx 	MA= 0 	MD=e8 	AC= x  CF=0  ZF=0  M3= x  M4= x  M5= x
     time=003 	PC= 0 	IR=e8 	MA= 8 	MD=e8 	AC= x  CF=0  ZF=0  M3= x  M4= x  M5= x
     PC= 0 OP= 111
    
     time=004 	PC= 1 	IR=e8 	MA= 8 	MD=e8 	AC= x  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC= 1 -> jmp  8
    
     time=005 	PC= 8 	IR=e8 	MA= 8 	MD=e8 	AC= x  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=007 	PC= 8 	IR=e8 	MA= 8 	MD=23 	AC= x  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=008 	PC= 8 	IR=23 	MA= 3 	MD=23 	AC= x  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC= 8 OP= 001
    
     time=009 	PC= 9 	IR=23 	MA= 3 	MD=23 	AC= x  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=010 	PC= 9 	IR=23 	MA= 3 	MD=03 	AC= x  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC= 9 -> lda [03] = 03 (ZF=0)
    
     time=011 	PC= 9 	IR=23 	MA= 3 	MD=03 	AC= 3  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=012 	PC= 9 	IR=23 	MA= 9 	MD=03 	AC= 3  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=013 	PC= 9 	IR=23 	MA= 9 	MD=44 	AC= 3  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=014 	PC= 9 	IR=44 	MA= 4 	MD=44 	AC= 3  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC= 9 OP= 010
    
     time=015 	PC=10 	IR=44 	MA= 4 	MD=44 	AC= 3  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=016 	PC=10 	IR=44 	MA= 4 	MD=02 	AC= 3  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC=10 -> add [04] = 02 (CZ=00)
    
     time=017 	PC=10 	IR=44 	MA= 4 	MD=02 	AC= 5  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=018 	PC=10 	IR=44 	MA=10 	MD=02 	AC= 5  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=019 	PC=10 	IR=44 	MA=10 	MD=85 	AC= 5  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=020 	PC=10 	IR=85 	MA= 5 	MD=85 	AC= 5  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC=10 OP= 100
    
     time=021 	PC=11 	IR=85 	MA= 5 	MD=85 	AC= 5  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=022 	PC=11 	IR=85 	MA= 5 	MD=01 	AC= 5  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC=11 -> sub [05] = 01 (CZ=00)
    
     time=023 	PC=11 	IR=85 	MA= 5 	MD=01 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=024 	PC=11 	IR=85 	MA=11 	MD=01 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=025 	PC=11 	IR=85 	MA=11 	MD=67 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=026 	PC=11 	IR=67 	MA= 7 	MD=67 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC=11 OP= 011
    
     time=027 	PC=12 	IR=67 	MA= 7 	MD=67 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=028 	PC=12 	IR=67 	MA= 7 	MD=04 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC=12 -> sto 04 @ [07]
    
     time=030 	PC=12 	IR=67 	MA=12 	MD=04 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=031 	PC=12 	IR=67 	MA=12 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     time=032 	PC=12 	IR=00 	MA= 0 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 0
     PC=12 OP= 000
    
     time=033 	PC=13 	IR=00 	MA= 0 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 4
     PC=        31 -> hlt
    
     time=034 	PC=30 	IR=00 	MA= 0 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 4
     time=035 	PC=30 	IR=00 	MA=30 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 4
     time=037 	PC=30 	IR=00 	MA= 0 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 4
     PC=30 OP= 000
    
     time=038 	PC=31 	IR=00 	MA= 0 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 4
     PC=        31 -> hlt
    
     time=039 	PC=30 	IR=00 	MA= 0 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 4
     time=040 	PC=30 	IR=00 	MA=30 	MD=00 	AC= 4  CF=0  ZF=0  M3= 3  M4= 2  M5= 4
*/