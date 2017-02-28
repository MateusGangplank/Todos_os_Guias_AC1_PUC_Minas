// ---------------------------
// Exercicio03.v
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// ---------------------------
//
// Ultra Simple Computer in Verilog HDL, by Dan Hyde; June 1, 1998
// Adapted by Instituto Ciencias Exatas e Informática - PUC-Minas - 2012/1
//
module ultra;
  // simple computer with 4-bit op codes in first 4 bits and
  // 10 bit address in last ten bits of 16-bit instructions,
  // memory size is 1024 words (x 08 bits)
  //
  //               code      address
  // Instruction = xxxx00aa aaaaaaaa
  //               |        |       |
  //               0        8      16
  //               |        |       |
  // Value       = S0000000 00000000
  //               signal   mantissa
  //
  // Name  Code  Op   Meaning                 Comment
  //
  // nop   0000 0000  ---                     ; no operation
  // out   0001 0000  OUT <- AC               ; copy AC contents to output buffer

  // inc   0010 0000  AC <- AC + 1            ; increment AC by one
  // dec   0011 0000  AC <- AC - 1            ; decrement AC by one

  // load  0100 aaaa  AC <- MEM [aaaa]        ; load contents at address (aaaa) into AC
  // store 0101 aaaa  MEM [aaaa] <- AC        ; store contents of AC into address (aaaa)
  // add   0110 aaaa  AC <- AC + MEM [aaaa]   ; add contents at address (aaaa) to AC
  // sub   0111 aaaa  AC <- AC - MEM [aaaa]   ; subtracts contents at address (aaaa) to AC

  // not   1000 0000  AC <- ~AC               ; AC complement
  // or    1001 aaaa  AC <- AC | MEM [aaaa]   ; AC or  contents at address (aaaa)
  // and   1010 aaaa  AC <- AC & MEM [aaaa]   ; AC and contents at address (aaaa)
  // xor   1011 aaaa  AC <- AC ^ MEM [aaaa]   ; AC xor contents at address (aaaa)

  // jump  1100 aaaa  PC <- aaaa              ; jump to instruction at address (aaaa)

  // jumpS 1101 aaaa  PC <- (AC<0)? aaaa:PC+1 ; if (AC<0) then next instruction at (aaaa)
  // jumpZ 1110 aaaa  PC <- (AC=0)? aaaa:PC+1 ; if (AC=0) then next instruction at (aaaa)
  // halt  1111 0000  PC <- 0000              ; stop operation

// instruction mnemonics
parameter
   NOP   = 4'b0000,
   OUT   = 4'b0001,
   INC   = 4'b0010,
   DEC   = 4'b0011,
   LOAD  = 4'b0100,
   STORE = 4'b0101,
   ADD   = 4'b0110,
   SUB   = 4'b0111,
   NOT   = 4'b1000,
   OR    = 4'b1001,
   AND   = 4'b1010,
   XOR   = 4'b1011,
   JUMP  = 4'b1100,
   JUMPS = 4'b1101,
   JUMPZ = 4'b1110,
   HALT  = 4'b1111;

// clock timing frequency
parameter clock = 1;

// registers and buffers
reg [15:0] IR;           // [IR]  Instruction Register
reg [9:0]  PC;           // [PC]  Program Counter

reg [15:0] AC;           // [AC]  ACcumulator

reg [9:0]  MA;           // [MA]  Memory Address
reg [7:0]  MEM[0:1023];  // 1024  08-bit words of memory
reg [15:0] MD;           // [MD]  Memory Data

// memory mapping output
reg [15:0] M3,           // memory[3] output mirror
           M4,           // memory[4] output mirror
           M5;           // memory[5] output mirror

reg [15:0] OUTPUT;       // [OUT] output buffer


reg [3:0]  OP;           // instruction code

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
// memory area (1K x 8 bits)
    MEM[00] = 8'b11000000;   // jump  0 (program halted)
    MEM[01] = 8'b00000000;   //
// data segment
    MEM[02] = 8'b00000000;   // dado01 H = 00000 = (00)
    MEM[03] = 8'b00011001;   // dado01 L = 11001 = (25)
    MEM[04] = 8'b00000000;   // dado02 H = 00000 = (00)
    MEM[05] = 8'b00001010;   // dado02 L = 01010 = (10)
    MEM[06] = 8'b00000000;   // dado03 H = 00000 = (00)
    MEM[07] = 8'b00000111;   // dado03 L = 00111 = (07)
    MEM[08] = 8'b00000000;   // result H
    MEM[09] = 8'b00000000;   // result L (08)
    MEM[10] = 8'b00000000;   //
    MEM[11] = 8'b00000000;   //
    MEM[12] = 8'b00000000;   //
    MEM[13] = 8'b00000000;   //
    MEM[14] = 8'b00000000;   //
    MEM[15] = 8'b00000000;   //
    MEM[16] = 8'b00000000;   //
    MEM[17] = 8'b00000000;   //
    MEM[18] = 8'b00000000;   //
    MEM[19] = 8'b00000000;   //
// instruction segment
    MEM[20] = 8'b01000000;   // load   4 = 01010         "|
    MEM[21] = 8'b00000100;   //           [0100]          |
    MEM[22] = 8'b01100000;   // add    6 = 00111          |
    MEM[23] = 8'b00000110;   //           [0110]          |
    MEM[24] = 8'b10000000;   // not    |  A=~A             >  complemento de 2 da soma
    MEM[25] = 8'b00000000;   //                           |
                             //                           |
    MEM[26] = 8'b00100000;   // inc    |  A=A+1           |
    MEM[27] = 8'b00000000;   //                          ,|
    MEM[28] = 8'b01100000;   // add    2 = 11001
    MEM[29] = 8'b00000010;   //           [0010]
    MEM[30] = 8'b01010000;   // store  8 = 01000
    MEM[31] = 8'b00001000;   //           [1000]

    MEM[32] = 8'b00010000;   // out      = 0001
    MEM[33] = 8'b00000000;   //
    MEM[34] = 8'b11110000;   // halt
    MEM[35] = 8'b00000000;   //
    MEM[36] = 8'b00000000;   //
    MEM[37] = 8'b00000000;   //
    MEM[38] = 8'b00000000;   //
    MEM[39] = 8'b00000000;   //
    MEM[40] = 8'b11110000;   // hlt      = 1111
    MEM[41] = 8'b00000000;   //

//  program first instruction address
    PC = 20;                 // [20] - start of machine language program

// display commands
   $display("ULTRA Simple Computer Simulation - v1.0\n");
// monitor following registers and memory location
// and print when any change occurs
   $monitor(" time=%03d \tPC=%d \tIR=%h \tMA=%2d \tMD=%h \tAC=%2d   M3=%2d  M4=%2d  M5=%2d",
             $time, PC, IR, MA, MD, AC, M3, M4, M5);

end // init

//
// main_process will loop until simulation time is over
//
always begin: instruction_cycle

   // instruction fetch
      #clock MA <= PC;                   // load instruction address
      #clock MD[15:8] <= MEM[MA];        // memory select and
             MD[7:0]  <= MEM[MA+1];      // read 02-byte instruction
      #clock IR <= MD;                   // load instruction register
             MA <= MD[9:0];              // last ten bits are address
      #clock PC <= PC + 2;               // next instruction
                                         // memory mapped output buffers
             M3[15:8] <= MEM[06];              // output memory[06]
             M3[7:0] <=  MEM[07];
             M4[15:8] <= MEM[08];              // output memory[08]
             M4[7:0] <=  MEM[09];
             M5[15:8] <= MEM[10];              // output memory[10]
             M5[7:0] <=  MEM[11];

   // decode and execute instruction
      OP = IR [15:12];
      $display (" PC=%d OP=%4b\n", PC, OP);
      case ( OP )
        NOP:   begin
              #clock $display (" PC=%d ->nop\n", PC);
               end
        OUT:   begin
              #clock OUTPUT <= AC;
               $display (" PC=%d -> out %d\n", PC, AC); // Necessario, visto que não houve tempo para OUTPUT mudar ainda...
               end
        INC:   begin
              #clock AC <= AC + 1;
               $display (" PC=%d -> inc %h\n", PC, AC);
               end
        DEC:   begin
              #clock AC <= AC - 1;
               $display (" PC=%d -> dec %h\n", PC, AC);
               end
        LOAD:  begin
              #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
              #clock AC <= MD;
               $display (" PC=%d -> load [%h] = %h\n", PC, MA, MD);
               end
        STORE: begin
              #clock MD <= AC;
              #clock MEM[MA] <= MD[15:8]; MEM[MA+1] <= MD[7:0];
               $display (" PC=%d -> store %h @ [%h]\n", PC, MD, MA);
               end
        ADD:   begin
              #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
              #clock AC <= AC + MD;
               $display (" PC=%d -> add [%h] = %h\n", PC, MA, MD);
               end
        SUB:   begin
              #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
              #clock AC <= AC - MD;
               $display (" PC=%d -> sub [%h] = %h\n", PC, MA, MD);
               end
        NOT:   begin
              #clock AC <= ~AC;
               $display (" PC=%d -> AC = %h\n", PC, AC);
               end
        OR:    begin
              #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
              #clock AC <= AC | MD;
               $display (" PC=%d -> AC | [%h] = %h\n", PC, MD, AC);
               end
        AND:   begin
              #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
              #clock AC <= AC & MD;
               $display (" PC=%d -> AC & [%h] = %h\n", PC, MD, AC);
               end
        XOR:   begin
              #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
              #clock AC <= AC ^ MD;
               $display (" PC=%d -> AC ^ [%h] = %h\n", PC, MD, AC);
               end
        JUMP:  begin
              #clock
               $display (" PC=%d -> jump %d\n", PC, MA);
               PC <= MA;
               end
        JUMPS: begin
              #clock
               $display (" PC=%d -> jumpS (%h<0) %h\n", PC, AC, MA);
               if (AC[15] == 1'b1)
                   PC <= MA;
               end
        JUMPZ: begin
              #clock
               $display (" PC=%d -> jumpZ (%h==0) %h\n", PC, AC, MA);
               if (AC == 16'b0000000000000000)
                   PC <= MA;
               end
        HALT:  begin
              #clock PC = 0;
               $display (" PC=%d -> halt\n", PC);
               end
      endcase

end // main process
endmodule
