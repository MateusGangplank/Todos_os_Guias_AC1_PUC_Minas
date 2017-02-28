// ---------------
// Exemplo0083 - Arquitetura de Computador
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// pulse: 23/10/2012
// ----------------

//
// Simple CPU in Verilog HDL
// PUC-Minas - January 1, 2012
// Instituto de Ciencias Exatas e Inform�tica
//
module cpu_6;
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
   #(301*clock) $finish;
end

//
// Initialize the PC register and memory MEM with test program
// (execute once)
//

initial begin: init
// memory area (32 x 8 bits)
    MEM[00] = 8'b11101000;   // jmp  08 (main program start)
// data segment
    MEM[01] = 8'b00000010;   // data constant = 2
    MEM[02] = 8'b00000011;   // data constant  = 3
    MEM[03] = 8'b00000111;   // data 1   = 0111 = (07)
    MEM[04] = 8'b00000100;   // data 2   = 0100 = (04)
    MEM[05] = 8'b00000001;   // data constant = 1
    MEM[06] = 8'b00000000;   // temp1
    MEM[07] = 8'b00000000;   // result
// instruction segment       // main:
   //Come�a a 1� multiplica��o
    MEM[08] = 8'b00100110;   // lda Carrega MEM[06] (AC <= MEM[06])
    MEM[09] = 8'b01000011;   // add Soma MEM[06] + MEM[03] (AC <= AC + MEM[03])
    MEM[10] = 8'b01100110;   // sto Guarda o resultado em MEM[06] (MEM[06] <= AC)
    MEM[11] = 8'b00100001;   // lda Carrega MEM[01] (AC <= MEM[01])
    MEM[12] = 8'b10000101;   // sub Subtrai 1 de MEM[01] (AC <= AC -1)
    MEM[13] = 8'b01100001;   // sto Guarda o resultado em MEM[01] (MEM[01] <= AC)
    MEM[14] = 8'b10101000;   // jnz repeat (if A!=0)
    MEM[15] = 8'b00100111;   // lda Carrega MEM[07] (AC <= MEM[07])
    MEM[16] = 8'b01000110;   // add Soma MEM[07] + MEM[06] (AC <= AC + MEM[06])
    MEM[17] = 8'b01100111;   // sto Guarda o resultado em MEM[07] (MEM[07] <= AC)
    MEM[18] = 8'b00100110;   // lda Carrega MEM[06] (AC <= MEM[06])
    MEM[19] = 8'b10000110;   // sub Limpa MEM[06] AC <= 0
    MEM[20] = 8'b01100110;   // sto Guarda o resultado em MEM[06] (MEM[06] <= AC)
   // Come�a a 2� multiplica��o
    MEM[21] = 8'b00100110;   // lda Carrega MEM[06] (AC <= MEM[06])
    MEM[22] = 8'b01000100;   // add Soma MEM[06] + MEM[04] (AC <= AC + MEM[04])
    MEM[23] = 8'b01100110;   // sto Guarda o resultado em MEM[06] (MEM[06] <= AC)
    MEM[24] = 8'b00100010;   // lda Carrega MEM[02] (AC <= MEM[02])
    MEM[25] = 8'b10000101;   // sub Subtrai 1 de MEM[02] (AC <= AC -1)
    MEM[26] = 8'b01100010;   // sto Guarda o resultado em MEM[02] (MEM[02] <= AC)
    MEM[27] = 8'b10110101;   // jnz repeat (if A!=0)
   // Come�a a subtra��o
    MEM[28] = 8'b00100111;   // lda Carrega MEM[07] (AC <= MEM[07])
    MEM[29] = 8'b10000110;   // sub Subtrai MEM[07] - MEM[06] (AC <= AC - MEM[06])
    MEM[30] = 8'b01100111;   // sto Guarda o resultado em MEM[07] (MEM[07] <= AC)
    MEM[31] = 8'b00000000;   // hlt Interrompe a execu��o

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
   $display("Exemplo0083 - Josemar Alves Caetano - 448662.");
   $display("CPU - Calculador de express�es aritm�ticas - v1.5\n");
   $display("\tdado03 = ((2 * dado01) - (3 * dado02))\n");
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

endmodule //cpu_6