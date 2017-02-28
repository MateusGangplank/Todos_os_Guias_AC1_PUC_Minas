// ---------------
// Exemplo0081 - Arquitetura de Computador
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// pulse: 23/10/2012
// ----------------

//
// Simple CPU in Verilog HDL
// PUC-Minas - January 1, 2012
// Instituto de Ciencias Exatas e Inform�tica
//
module cpu_4;
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
  // lda   001 aaaaa  AC <- MEM [aaaa]        ; Carrega conte�do no endere�o (aaaa) do AC
  // add   010 aaaaa  AC <- AC + MEM [aaaa]   ; Adiciona conte�do do endere�o (aaaa) com o AC
  // sto   011 aaaaa  MEM [aaaa] <- AC        ; Guarda o conte�do do AC no endere�o (aaaa)
  // sub   100 aaaaa  AC <- AC - MEM [aaaa]   ; Subtrai AC pelo conte�do em (aaaa)
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
   #(320*clock) $finish;
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
    MEM[03] = 8'b00001001;   // data 1   = 1000 = (09)
    MEM[04] = 8'b00000010;   // data 2   = 0011 = (02)
    MEM[05] = 8'b00000000;   // temp1  - Recebe o quociente
    MEM[06] = 8'b00000000;   // temp2  - Recebe o resultado parcial
    MEM[07] = 8'b00000000;   // result
// instruction segment       // main:
   // Prepara a divis�o
    MEM[08] = 8'b00100110;   // lda Carrega MEM[06] (AC <= MEM[06])
    MEM[09] = 8'b01000011;   // add Soma MEM[06] + MEM[03] (AC <= AC + MEM[03])
    MEM[10] = 8'b01100110;   // sto Guarda o resultado em MEM[06] (MEM[06] <= AC)
    MEM[11] = 8'b11110000;   // jmp Pula na primeira execu��o para a instru��o em MEM[16]
    MEM[12] = 8'b01100110;   // sto Guarda o resultado em MEM[06] (MEM[06] <= AC)
    MEM[13] = 8'b00100101;   // lda Carrega MEM[05] (AC <= MEM[05])
    MEM[14] = 8'b01000010;   // add Soma MEM[05] + 1 (AC <= AC + 1)
    MEM[15] = 8'b01100101;   // sto Guarda o resultado em MEM[05] (MEM[05] <= AC)
   // Come�a a divis�o
    MEM[16] = 8'b00100110;   // lda Carrega MEM[06] (AC <= MEM[06])
    MEM[17] = 8'b10000100;   // sub Subtrai MEM[06] - MEM[04] (AC <= AC - MEM[04])
    MEM[18] = 8'b11001100;   // jnc repeat (if CF!=0)
    MEM[19] = 8'b00100111;   // lda Carrega MEM[07] (AC <= MEM[07])
    MEM[20] = 8'b01000101;   // add Soma MEM[07] + MEM[05] (AC <= AC + MEM[05])
    MEM[21] = 8'b01100111;   // sto Guarda o resultado em MEM[07] (MEM[07] <= AC)
    MEM[22] = 8'b00000000;   // hlt Interrompe a execu��o
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
   $display ("\nArmazenamento em mem�ria(Depois da execu��o): \n");
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
   $display("Exemplo0081 - Josemar Alves Caetano - 448662.");
   $display("CPU - Calculador de express�es aritm�ticas - v1.3\n");
   $display("\tdado04 = dado01 / dado02\n");
// monitor following registers and memory location 
// and print then when any change occurs
   $monitor(" time=%03d \tPC=%d \tIR=%h \tMA=%2d \tMD=%h \tAC=%2d  CF=%b  ZF=%b  M3=%2d  M4=%2d M5=%2d",
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

endmodule //cpu_4
