//
// Ultra Simple Computer in Verilog HDL, by Dan Hyde; June 1, 1998
// Adapted by Instituto de Informática - PUC-Minas - 2006/2
//
module ultra;
  // simple computer with 4-bit op codes in first 4 bits and
  // 10 bit address in last ten bits of 16-bit instructions,
  // memory size is 1024 words (16 bits)
  //
  //               code      address
  // Instruction = xxxx00aa aaaaaaaa
  //               |        |       |
  //               0        8      16
  //               |        |       |
  // Value       = S0000000 00000000
  //               signal   mantissa
  //
  // Code Name Op   Meaning                    Comment
  //
  // 0000 nop       ---                      ; no operation
  // 0001 out       OUT <- AC                ; copy AC contents to output buffer

  // 0010 inc       AC <- AC + 1             ; increment AC by one
  // 0011 dec       AC <- AC - 1             ; decrement AC by one

  // 0100 load  xx  AC <- MEM [xx]           ; load contents at address (xx) into AC
  // 0101 store xx  MEM [xx] <- AC           ; store contents of AC into address (xx)
  // 0110 add   xx  AC <- AC + MEM [xx]      ; add contents at address (xx) to AC
  // 0111 sub   xx  AC <- AC - MEM [xx]      ; subtracts contents at address (xx) to AC

  // 1000 not       AC <- ~AC                ; AC complement
  // 1001 or    xx  AC <- AC | MEM [xx]      ; AC or  contents at address (xx)
  // 1010 and   xx  AC <- AC & MEM [xx]      ; AC and contents at address (xx)
  // 1011 xor   xx  AC <- AC ^ MEM [xx]      ; AC xor contents at address (xx)

  // 1100 jump  xx  PC <- xx                 ; jump to instruction at address (xx)

  // 1101 jumpS xx  PC <- (AC<0)? xx : PC+1  ; if (AC<0) then next instruction at (xx)
  // 1110 jumpZ xx  PC <- (AC=0)? xx : PC+1  ; if (AC=0) then next instruction at (xx)
  // 1111 halt      PC <- 0000               ; stop operation

// clock timing frequency
parameter clock = 1;

// registers and buffers
reg [15:0] AC,           // [AC]  ACcumulator
           IR,           // [IR]  Instruction Register
           MD;           // [MD]  Memory Data
reg [9:0]  PC,           // [PC]  Program Counter
           MA;           // [MA]  Memory Address
reg [7:0]  MEM[0:1023];  // 1024  words of 08-bit of memory
reg [15:0] OUT;          // [OUT] output buffer

// memory mapping output
reg [15:0] M3,           // memory[3] output mirror
           M4,           // memory[4] output mirror
           M5;           // memory[5] output mirror

// -------------------------------------------------------------------
//
// The two "initial" and the "always" constructs run concurrently
// Will stop the execution after 150 clock units.
//

initial
begin: clock_control
// simulation time
   #(150*clock) $stop;
end // clock_control

//
// Initialize PC register and memory MEM with test program
// (execute once)
//

initial
begin: memory_contents
// memory area (1K x 8 bits)
    MEM[00] = 8'b11000000;   // jump  0 (program halted)
    MEM[01] = 8'b00000000;   //
// data segment
    MEM[02] = 8'b00000000;   //
    MEM[03] = 8'b00000001;   // data constant  = 1
    MEM[04] = 8'b00000000;   //
    MEM[05] = 8'b00000000;   //
    MEM[06] = 8'b00000000;   //
    MEM[07] = 8'b00000011;   // data 1   = 0011 = (03)
    MEM[08] = 8'b00000000;   //
    MEM[09] = 8'b00000010;   // data 2   = 0010 = (02)
    MEM[10] = 8'b00000000;   //
    MEM[11] = 8'b00000000;   // result
    MEM[12] = 8'b00000000;   //
    MEM[13] = 8'b00000000;   //
    MEM[14] = 8'b00000000;   //
    MEM[15] = 8'b00000000;   //
    MEM[16] = 8'b00000000;   //
    MEM[17] = 8'b00000000;   //
    MEM[18] = 8'b00000000;   //
    MEM[19] = 8'b00000000;   //
// instruction segment
    MEM[20] = 8'b01000000;   // load  10 = 0100
    MEM[21] = 8'b00001010;   //           [1010]
    MEM[22] = 8'b01100000;   // add    6 = 0110
    MEM[23] = 8'b00000110;   //           [0110]
    MEM[24] = 8'b01010000;   // store 10 = 0101
    MEM[25] = 8'b00001010;   //            1010

    MEM[26] = 8'b01000000;   // load   8 = 0100
    MEM[27] = 8'b00001000;   //           [1000]
    MEM[28] = 8'b00110000;   // dec      = 0011
    MEM[29] = 8'b00000000;   //
    MEM[30] = 8'b01010000;   // store  8 = 0101
    MEM[31] = 8'b00001000;   //            1000

    MEM[32] = 8'b11100000;   // jumpZ 36 = 1110
    MEM[33] = 8'b00100100;   //           100100
    MEM[34] = 8'b11000000;   // jump  20 = 1100
    MEM[35] = 8'b00010100;   //           010100
    MEM[36] = 8'b01000000;   // load  10 = 0100
    MEM[37] = 8'b00001010;   //           [1010]
    MEM[38] = 8'b00000000;   // out      = 0001
    MEM[39] = 8'b00010000;   //
    MEM[40] = 8'b11110000;   // hlt      = 1111
    MEM[41] = 8'b00000000;   //

// program first instruction address
    PC = 20;                 // [20] - start of machine language program

// display commands
    $display("ULTRA Simple Computer Simulation - v1.0\n");

// monitor following registers and memory locations,
// and printing when any change occurs
    $monitor(" time=%03d \tPC=%d \tIR=%h \tMA=%2d \tMD=%h \tAC=%2d  M3=%2d  M4=%2d  M5=%2d",
              $time, PC, IR, MA, MD, AC, M3, M4, M5);

end // memory_contents

// -------------------------------------------------------------------
//
// main_process will loop until simulation time is over
//
always begin: main_process

   // instruction fetch
      #clock MA <= PC;                   // load instruction address
      #clock MD[15:8] <= MEM[MA];        // memory select and
             MD[7:0]  <= MEM[MA+1];      // read 02-byte instruction
      #clock IR <= MD;                   // load instruction register
             MA <= MD[9:0];              // last ten bits are address
      #clock PC <= PC + 2;               // next instruction
             OUT<= AC;                   // output buffer = AC

                                         // memory mapped output buffers
             M3 <= MEM[06];              // output memory[06]
             M4 <= MEM[08];              // output memory[08]
             M5 <= MEM[10];              // output memory[10]

   // decode and execute instruction
      if(IR[15:12] == 4'b0000) begin          // nop
          #clock $display (" PC=%d ->nop\n", PC);
      end
      else
      if(IR[15:12] == 4'b0001) begin          // out
          #clock OUT <= AC;
           $display (" PC=%d -> out %d\n", PC, OUT);
      end
      else
      if(IR[15:12] == 4'b0010) begin          // inc
          #clock AC <= AC + 1;
           $display (" PC=%d -> inc %h\n", PC, AC);
      end
      if(IR[15:12] == 4'b0011) begin          // dec
          #clock AC <= AC - 1;
           $display (" PC=%d -> dec %h\n", PC, AC);
      end
      else
      if(IR[15:12] == 4'b0100) begin          // load
          #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
          #clock AC <= MD;
           $display (" PC=%d -> load [%h] = %h\n", PC, MA, MD);
      end
      else
      if(IR[15:12] == 4'b0101) begin          // store
          #clock MD <= AC;
          #clock MEM[MA] <= MD[15:8]; MEM[MA+1] <= MD[7:0];
           $display (" PC=%d -> store %h @ [%h]\n", PC, MD, MA);
      end
      else
      if(IR[15:12] == 4'b0110) begin          // add
          #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
          #clock AC <= AC + MD;
           $display (" PC=%d -> add [%h] = %h\n", PC, MA, MD);
      end
      else
      if(IR[15:12] == 4'b0111) begin          // sub
          #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
          #clock AC <= AC - MD;
           $display (" PC=%d -> sub [%h] = %h\n", PC, MA, MD);
      end
      else
      if(IR[15:12] == 4'b1000) begin          // not
          #clock AC <= ~AC;
           $display (" PC=%d -> AC = %h\n", PC, AC);
      end
      else
      if(IR[15:12] == 4'b1001) begin          // or
          #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
          #clock AC <= AC | MD;
           $display (" PC=%d -> AC | [%h] = %h\n", PC, MD, AC);
      end
      else
      if(IR[15:12] == 4'b1010) begin          // and
          #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
          #clock AC <= AC & MD;
           $display (" PC=%d -> AC & [%h] = %h\n", PC, MD, AC);
      end
      else
      if(IR[15:12] == 4'b1011) begin          // xor
          #clock MD[15:8] <= MEM[MA]; MD[7:0] <= MEM[MA+1];
          #clock AC <= AC ^ MD;
           $display (" PC=%d -> AC ^ [%h] = %h\n", PC, MD, AC);
      end
      else
      if(IR[15:12] == 4'b1100) begin          // jump
          #clock
           $display (" PC=%d -> jump %d\n", PC, MA);
           PC <= MA;
      end
      else
      if(IR[15:12] == 4'b1101) begin          // jumpS
          #clock
          $display (" PC=%d -> jumpS (%h<0) %h\n", PC, AC, MA);
          if (AC[0] == 1'b1)
             PC <= MA;
      end
      else
      if(IR[15:12] == 4'b1110) begin          // jumpZ
          #clock
          $display (" PC=%d -> jumpZ (%h==0) %h\n", PC, AC, MA);
           if (AC == 16'b0000000000000000)
             PC <= MA;
      end
      else
      if(IR[15:12] == 4'b1111) begin          // halt
          #clock PC = 0;
           $display (" PC=%d -> halt\n", PC);
      end

end // main process

// -------------------------------------------------------------------

endmodule // ultra
