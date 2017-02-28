// Isabel Bicalho Amaro  451580
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
   #(140*clock) $finish;
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
    MEM[02] = 8'b00000000;   //
    MEM[03] = 8'b00000001;   // data constant  = 1
    MEM[04] = 8'b00000000;   //
    MEM[05] = 8'b00000101;   //
    MEM[06] = 8'b00000000;   // data 1 H = 0000 = (00)
    MEM[07] = 8'b00000011;   // data 1 L = 0011 = (03)
    MEM[08] = 8'b00000000;   // data 2 H = 0000 = (00)
    MEM[09] = 8'b00000010;   // data 2 L = 0010 = (02)
    MEM[10] = 8'b00000000;   // result H
    MEM[11] = 8'b00000000;   // result L
    MEM[12] = 8'b00000000;   //
    MEM[13] = 8'b00000000;   //
    MEM[14] = 8'b00000000;   // constant = 2
    MEM[15] = 8'b00000010;   //
    MEM[16] = 8'b00000000;   //
    MEM[17] = 8'b00000000;   //
    MEM[18] = 8'b00000000;   //
    MEM[19] = 8'b00000000;   //
	 
// instruction segment
    MEM[20] = 8'b01000000;   // load [14]
    MEM[21] = 8'b00001110;   //           
    MEM[22] = 8'b11100000;   // jumpz[42]
    MEM[23] = 8'b00101010;   //      
	 
	 // Denominador     
    MEM[24] = 8'b01000000;   // load [16]
    MEM[25] = 8'b00010000;   //            
    MEM[26] = 8'b01100000;   // add [08]
    MEM[27] = 8'b00001000;   //           
    MEM[28] = 8'b01010000;   // sto [16]
    MEM[29] = 8'b00010000;   // 
	 
	 // Numerador
    MEM[30] = 8'b01000000;   // load [10]
    MEM[31] = 8'b00001010;   //            
    MEM[32] = 8'b01100000;   // add [04]
    MEM[33] = 8'b00000100;   //     
    MEM[34] = 8'b01010000;   // sto [10]
    MEM[35] = 8'b00001010;   //      
	 
	 // Obtendo o resto
    MEM[36] = 8'b01110000;   // sub [16]
    MEM[37] = 8'b00010000;   //          
    MEM[38] = 8'b11010000;   // jumps [34]
    MEM[39] = 8'b00100010;   //
    MEM[40] = 8'b11110000;   // halt
    MEM[41] = 8'b00000000;   //
	 
	 // Multiplicacao do denominador
	 MEM[42] = 8'b01110000;   // sub [02]
	 MEM[43] = 8'b00000010;   //
	 MEM[44] = 8'b01010000;   // sto [14]
	 MEM[45] = 8'b00001110;   //
	 MEM[46] = 8'b01000000;   // load [16]
	 MEM[47] = 8'b00010000;   //
	 MEM[48] = 8'b01100000;   // add [06]
	 MEM[49] = 8'b00000110;   //
	 MEM[50] = 8'b01010000;   // sto [16]
	 MEM[51] = 8'b00010000;   //
	 MEM[52] = 8'b11000000;   // jump [20]
	 MEM[53] = 8'b00010100;   //

//  program first instruction address
    PC = 20;                 // [20] - start of machine language program

// display commands
   $display("ULTRA Simple Computer Simulation - v1.0\n");
// monitor following registers and memory location
// and print when any change occurs
   $monitor(" time=%03d \tPC=%d \tIR=%h \tMA=%2d \tMD=%h \tAC=%2d  M3=%2d  M4=%2d  M5=%2d",
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
             M3 <= MEM[06];              // output memory[06]
             M4 <= MEM[08];              // output memory[08]
             M5 <= MEM[10];              // output memory[10]

   // decode and execute instruction
      OP = IR [15:12];
      $display (" PC=%d OP=%4b\n", PC, OP);
      case ( OP )
        NOP:   begin
              #clock $display (" PC=%d ->nop\n", PC);
               end
        OUT:   begin
              #clock OUTPUT <= AC;
               $display (" PC=%d -> out %d\n", PC, OUTPUT);
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
               if (AC[15] != 1'b1)
                   PC <= MA;
               end
        JUMPZ: begin
              #clock
               $display (" PC=%d -> jumpZ (%h==0) %h\n", PC, AC, MA);
               if (AC != 16'b0000000000000000)
                   PC <= MA;
               end
        HALT:  begin
              #clock PC = 0;
               $display (" PC=%d -> halt\n", PC);
               end
      endcase

end // main process
endmodule


/*
     ULTRA Simple Computer Simulation - v1.0
    
     time=000 	PC=  20 	IR=xxxx 	MA= x 	MD=xxxx 	AC= x  M3= x  M4= x  M5= x
     time=001 	PC=  20 	IR=xxxx 	MA=20 	MD=xxxx 	AC= x  M3= x  M4= x  M5= x
     time=002 	PC=  20 	IR=xxxx 	MA=20 	MD=400e 	AC= x  M3= x  M4= x  M5= x
     time=003 	PC=  20 	IR=400e 	MA=14 	MD=400e 	AC= x  M3= x  M4= x  M5= x
     PC=  20 OP=0100
    
     time=004 	PC=  22 	IR=400e 	MA=14 	MD=400e 	AC= x  M3= 0  M4= 0  M5= 0
     time=005 	PC=  22 	IR=400e 	MA=14 	MD=0002 	AC= x  M3= 0  M4= 0  M5= 0
     PC=  22 -> load [00e] = 0002
    
     time=006 	PC=  22 	IR=400e 	MA=14 	MD=0002 	AC= 2  M3= 0  M4= 0  M5= 0
     time=007 	PC=  22 	IR=400e 	MA=22 	MD=0002 	AC= 2  M3= 0  M4= 0  M5= 0
     time=008 	PC=  22 	IR=400e 	MA=22 	MD=e02a 	AC= 2  M3= 0  M4= 0  M5= 0
     time=009 	PC=  22 	IR=e02a 	MA=42 	MD=e02a 	AC= 2  M3= 0  M4= 0  M5= 0
     PC=  22 OP=1110
    
     time=010 	PC=  24 	IR=e02a 	MA=42 	MD=e02a 	AC= 2  M3= 0  M4= 0  M5= 0
     PC=  24 -> jumpZ (0002==0) 02a
    
     time=011 	PC=  42 	IR=e02a 	MA=42 	MD=e02a 	AC= 2  M3= 0  M4= 0  M5= 0
     time=013 	PC=  42 	IR=e02a 	MA=42 	MD=7002 	AC= 2  M3= 0  M4= 0  M5= 0
     time=014 	PC=  42 	IR=7002 	MA= 2 	MD=7002 	AC= 2  M3= 0  M4= 0  M5= 0
     PC=  42 OP=0111
    
     time=015 	PC=  44 	IR=7002 	MA= 2 	MD=7002 	AC= 2  M3= 0  M4= 0  M5= 0
     time=016 	PC=  44 	IR=7002 	MA= 2 	MD=0001 	AC= 2  M3= 0  M4= 0  M5= 0
     PC=  44 -> sub [002] = 0001
    
     time=017 	PC=  44 	IR=7002 	MA= 2 	MD=0001 	AC= 1  M3= 0  M4= 0  M5= 0
     time=018 	PC=  44 	IR=7002 	MA=44 	MD=0001 	AC= 1  M3= 0  M4= 0  M5= 0
     time=019 	PC=  44 	IR=7002 	MA=44 	MD=500e 	AC= 1  M3= 0  M4= 0  M5= 0
     time=020 	PC=  44 	IR=500e 	MA=14 	MD=500e 	AC= 1  M3= 0  M4= 0  M5= 0
     PC=  44 OP=0101
    
     time=021 	PC=  46 	IR=500e 	MA=14 	MD=500e 	AC= 1  M3= 0  M4= 0  M5= 0
     time=022 	PC=  46 	IR=500e 	MA=14 	MD=0001 	AC= 1  M3= 0  M4= 0  M5= 0
     PC=  46 -> store 0001 @ [00e]
    
     time=024 	PC=  46 	IR=500e 	MA=46 	MD=0001 	AC= 1  M3= 0  M4= 0  M5= 0
     time=025 	PC=  46 	IR=500e 	MA=46 	MD=4010 	AC= 1  M3= 0  M4= 0  M5= 0
     time=026 	PC=  46 	IR=4010 	MA=16 	MD=4010 	AC= 1  M3= 0  M4= 0  M5= 0
     PC=  46 OP=0100
    
     time=027 	PC=  48 	IR=4010 	MA=16 	MD=4010 	AC= 1  M3= 0  M4= 0  M5= 0
     time=028 	PC=  48 	IR=4010 	MA=16 	MD=0000 	AC= 1  M3= 0  M4= 0  M5= 0
     PC=  48 -> load [010] = 0000
    
     time=029 	PC=  48 	IR=4010 	MA=16 	MD=0000 	AC= 0  M3= 0  M4= 0  M5= 0
     time=030 	PC=  48 	IR=4010 	MA=48 	MD=0000 	AC= 0  M3= 0  M4= 0  M5= 0
     time=031 	PC=  48 	IR=4010 	MA=48 	MD=6006 	AC= 0  M3= 0  M4= 0  M5= 0
     time=032 	PC=  48 	IR=6006 	MA= 6 	MD=6006 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  48 OP=0110
    
     time=033 	PC=  50 	IR=6006 	MA= 6 	MD=6006 	AC= 0  M3= 0  M4= 0  M5= 0
     time=034 	PC=  50 	IR=6006 	MA= 6 	MD=0003 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  50 -> add [006] = 0003
    
     time=035 	PC=  50 	IR=6006 	MA= 6 	MD=0003 	AC= 3  M3= 0  M4= 0  M5= 0
     time=036 	PC=  50 	IR=6006 	MA=50 	MD=0003 	AC= 3  M3= 0  M4= 0  M5= 0
     time=037 	PC=  50 	IR=6006 	MA=50 	MD=5010 	AC= 3  M3= 0  M4= 0  M5= 0
     time=038 	PC=  50 	IR=5010 	MA=16 	MD=5010 	AC= 3  M3= 0  M4= 0  M5= 0
     PC=  50 OP=0101
    
     time=039 	PC=  52 	IR=5010 	MA=16 	MD=5010 	AC= 3  M3= 0  M4= 0  M5= 0
     time=040 	PC=  52 	IR=5010 	MA=16 	MD=0003 	AC= 3  M3= 0  M4= 0  M5= 0
     PC=  52 -> store 0003 @ [010]
    
     time=042 	PC=  52 	IR=5010 	MA=52 	MD=0003 	AC= 3  M3= 0  M4= 0  M5= 0
     time=043 	PC=  52 	IR=5010 	MA=52 	MD=c014 	AC= 3  M3= 0  M4= 0  M5= 0
     time=044 	PC=  52 	IR=c014 	MA=20 	MD=c014 	AC= 3  M3= 0  M4= 0  M5= 0
     PC=  52 OP=1100
    
     time=045 	PC=  54 	IR=c014 	MA=20 	MD=c014 	AC= 3  M3= 0  M4= 0  M5= 0
     PC=  54 -> jump   20
    
     time=046 	PC=  20 	IR=c014 	MA=20 	MD=c014 	AC= 3  M3= 0  M4= 0  M5= 0
     time=048 	PC=  20 	IR=c014 	MA=20 	MD=400e 	AC= 3  M3= 0  M4= 0  M5= 0
     time=049 	PC=  20 	IR=400e 	MA=14 	MD=400e 	AC= 3  M3= 0  M4= 0  M5= 0
     PC=  20 OP=0100
    
     time=050 	PC=  22 	IR=400e 	MA=14 	MD=400e 	AC= 3  M3= 0  M4= 0  M5= 0
     time=051 	PC=  22 	IR=400e 	MA=14 	MD=0001 	AC= 3  M3= 0  M4= 0  M5= 0
     PC=  22 -> load [00e] = 0001
    
     time=052 	PC=  22 	IR=400e 	MA=14 	MD=0001 	AC= 1  M3= 0  M4= 0  M5= 0
     time=053 	PC=  22 	IR=400e 	MA=22 	MD=0001 	AC= 1  M3= 0  M4= 0  M5= 0
     time=054 	PC=  22 	IR=400e 	MA=22 	MD=e02a 	AC= 1  M3= 0  M4= 0  M5= 0
     time=055 	PC=  22 	IR=e02a 	MA=42 	MD=e02a 	AC= 1  M3= 0  M4= 0  M5= 0
     PC=  22 OP=1110
    
     time=056 	PC=  24 	IR=e02a 	MA=42 	MD=e02a 	AC= 1  M3= 0  M4= 0  M5= 0
     PC=  24 -> jumpZ (0001==0) 02a
    
     time=057 	PC=  42 	IR=e02a 	MA=42 	MD=e02a 	AC= 1  M3= 0  M4= 0  M5= 0
     time=059 	PC=  42 	IR=e02a 	MA=42 	MD=7002 	AC= 1  M3= 0  M4= 0  M5= 0
     time=060 	PC=  42 	IR=7002 	MA= 2 	MD=7002 	AC= 1  M3= 0  M4= 0  M5= 0
     PC=  42 OP=0111
    
     time=061 	PC=  44 	IR=7002 	MA= 2 	MD=7002 	AC= 1  M3= 0  M4= 0  M5= 0
     time=062 	PC=  44 	IR=7002 	MA= 2 	MD=0001 	AC= 1  M3= 0  M4= 0  M5= 0
     PC=  44 -> sub [002] = 0001
    
     time=063 	PC=  44 	IR=7002 	MA= 2 	MD=0001 	AC= 0  M3= 0  M4= 0  M5= 0
     time=064 	PC=  44 	IR=7002 	MA=44 	MD=0001 	AC= 0  M3= 0  M4= 0  M5= 0
     time=065 	PC=  44 	IR=7002 	MA=44 	MD=500e 	AC= 0  M3= 0  M4= 0  M5= 0
     time=066 	PC=  44 	IR=500e 	MA=14 	MD=500e 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  44 OP=0101
    
     time=067 	PC=  46 	IR=500e 	MA=14 	MD=500e 	AC= 0  M3= 0  M4= 0  M5= 0
     time=068 	PC=  46 	IR=500e 	MA=14 	MD=0000 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  46 -> store 0000 @ [00e]
    
     time=070 	PC=  46 	IR=500e 	MA=46 	MD=0000 	AC= 0  M3= 0  M4= 0  M5= 0
     time=071 	PC=  46 	IR=500e 	MA=46 	MD=4010 	AC= 0  M3= 0  M4= 0  M5= 0
     time=072 	PC=  46 	IR=4010 	MA=16 	MD=4010 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  46 OP=0100
    
     time=073 	PC=  48 	IR=4010 	MA=16 	MD=4010 	AC= 0  M3= 0  M4= 0  M5= 0
     time=074 	PC=  48 	IR=4010 	MA=16 	MD=0003 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  48 -> load [010] = 0003
    
     time=075 	PC=  48 	IR=4010 	MA=16 	MD=0003 	AC= 3  M3= 0  M4= 0  M5= 0
     time=076 	PC=  48 	IR=4010 	MA=48 	MD=0003 	AC= 3  M3= 0  M4= 0  M5= 0
     time=077 	PC=  48 	IR=4010 	MA=48 	MD=6006 	AC= 3  M3= 0  M4= 0  M5= 0
     time=078 	PC=  48 	IR=6006 	MA= 6 	MD=6006 	AC= 3  M3= 0  M4= 0  M5= 0
     PC=  48 OP=0110
    
     time=079 	PC=  50 	IR=6006 	MA= 6 	MD=6006 	AC= 3  M3= 0  M4= 0  M5= 0
     time=080 	PC=  50 	IR=6006 	MA= 6 	MD=0003 	AC= 3  M3= 0  M4= 0  M5= 0
     PC=  50 -> add [006] = 0003
    
     time=081 	PC=  50 	IR=6006 	MA= 6 	MD=0003 	AC= 6  M3= 0  M4= 0  M5= 0
     time=082 	PC=  50 	IR=6006 	MA=50 	MD=0003 	AC= 6  M3= 0  M4= 0  M5= 0
     time=083 	PC=  50 	IR=6006 	MA=50 	MD=5010 	AC= 6  M3= 0  M4= 0  M5= 0
     time=084 	PC=  50 	IR=5010 	MA=16 	MD=5010 	AC= 6  M3= 0  M4= 0  M5= 0
     PC=  50 OP=0101
    
     time=085 	PC=  52 	IR=5010 	MA=16 	MD=5010 	AC= 6  M3= 0  M4= 0  M5= 0
     time=086 	PC=  52 	IR=5010 	MA=16 	MD=0006 	AC= 6  M3= 0  M4= 0  M5= 0
     PC=  52 -> store 0006 @ [010]
    
     time=088 	PC=  52 	IR=5010 	MA=52 	MD=0006 	AC= 6  M3= 0  M4= 0  M5= 0
     time=089 	PC=  52 	IR=5010 	MA=52 	MD=c014 	AC= 6  M3= 0  M4= 0  M5= 0
     time=090 	PC=  52 	IR=c014 	MA=20 	MD=c014 	AC= 6  M3= 0  M4= 0  M5= 0
     PC=  52 OP=1100
    
     time=091 	PC=  54 	IR=c014 	MA=20 	MD=c014 	AC= 6  M3= 0  M4= 0  M5= 0
     PC=  54 -> jump   20
    
     time=092 	PC=  20 	IR=c014 	MA=20 	MD=c014 	AC= 6  M3= 0  M4= 0  M5= 0
     time=094 	PC=  20 	IR=c014 	MA=20 	MD=400e 	AC= 6  M3= 0  M4= 0  M5= 0
     time=095 	PC=  20 	IR=400e 	MA=14 	MD=400e 	AC= 6  M3= 0  M4= 0  M5= 0
     PC=  20 OP=0100
    
     time=096 	PC=  22 	IR=400e 	MA=14 	MD=400e 	AC= 6  M3= 0  M4= 0  M5= 0
     time=097 	PC=  22 	IR=400e 	MA=14 	MD=0000 	AC= 6  M3= 0  M4= 0  M5= 0
     PC=  22 -> load [00e] = 0000
    
     time=098 	PC=  22 	IR=400e 	MA=14 	MD=0000 	AC= 0  M3= 0  M4= 0  M5= 0
     time=099 	PC=  22 	IR=400e 	MA=22 	MD=0000 	AC= 0  M3= 0  M4= 0  M5= 0
     time=100 	PC=  22 	IR=400e 	MA=22 	MD=e02a 	AC= 0  M3= 0  M4= 0  M5= 0
     time=101 	PC=  22 	IR=e02a 	MA=42 	MD=e02a 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  22 OP=1110
    
     time=102 	PC=  24 	IR=e02a 	MA=42 	MD=e02a 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  24 -> jumpZ (0000==0) 02a
    
     time=104 	PC=  24 	IR=e02a 	MA=24 	MD=e02a 	AC= 0  M3= 0  M4= 0  M5= 0
     time=105 	PC=  24 	IR=e02a 	MA=24 	MD=4010 	AC= 0  M3= 0  M4= 0  M5= 0
     time=106 	PC=  24 	IR=4010 	MA=16 	MD=4010 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  24 OP=0100
    
     time=107 	PC=  26 	IR=4010 	MA=16 	MD=4010 	AC= 0  M3= 0  M4= 0  M5= 0
     time=108 	PC=  26 	IR=4010 	MA=16 	MD=0006 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  26 -> load [010] = 0006
    
     time=109 	PC=  26 	IR=4010 	MA=16 	MD=0006 	AC= 6  M3= 0  M4= 0  M5= 0
     time=110 	PC=  26 	IR=4010 	MA=26 	MD=0006 	AC= 6  M3= 0  M4= 0  M5= 0
     time=111 	PC=  26 	IR=4010 	MA=26 	MD=6008 	AC= 6  M3= 0  M4= 0  M5= 0
     time=112 	PC=  26 	IR=6008 	MA= 8 	MD=6008 	AC= 6  M3= 0  M4= 0  M5= 0
     PC=  26 OP=0110
    
     time=113 	PC=  28 	IR=6008 	MA= 8 	MD=6008 	AC= 6  M3= 0  M4= 0  M5= 0
     time=114 	PC=  28 	IR=6008 	MA= 8 	MD=0002 	AC= 6  M3= 0  M4= 0  M5= 0
     PC=  28 -> add [008] = 0002
    
     time=115 	PC=  28 	IR=6008 	MA= 8 	MD=0002 	AC= 8  M3= 0  M4= 0  M5= 0
     time=116 	PC=  28 	IR=6008 	MA=28 	MD=0002 	AC= 8  M3= 0  M4= 0  M5= 0
     time=117 	PC=  28 	IR=6008 	MA=28 	MD=5010 	AC= 8  M3= 0  M4= 0  M5= 0
     time=118 	PC=  28 	IR=5010 	MA=16 	MD=5010 	AC= 8  M3= 0  M4= 0  M5= 0
     PC=  28 OP=0101
    
     time=119 	PC=  30 	IR=5010 	MA=16 	MD=5010 	AC= 8  M3= 0  M4= 0  M5= 0
     time=120 	PC=  30 	IR=5010 	MA=16 	MD=0008 	AC= 8  M3= 0  M4= 0  M5= 0
     PC=  30 -> store 0008 @ [010]
    
     time=122 	PC=  30 	IR=5010 	MA=30 	MD=0008 	AC= 8  M3= 0  M4= 0  M5= 0
     time=123 	PC=  30 	IR=5010 	MA=30 	MD=400a 	AC= 8  M3= 0  M4= 0  M5= 0
     time=124 	PC=  30 	IR=400a 	MA=10 	MD=400a 	AC= 8  M3= 0  M4= 0  M5= 0
     PC=  30 OP=0100
    
     time=125 	PC=  32 	IR=400a 	MA=10 	MD=400a 	AC= 8  M3= 0  M4= 0  M5= 0
     time=126 	PC=  32 	IR=400a 	MA=10 	MD=0000 	AC= 8  M3= 0  M4= 0  M5= 0
     PC=  32 -> load [00a] = 0000
    
     time=127 	PC=  32 	IR=400a 	MA=10 	MD=0000 	AC= 0  M3= 0  M4= 0  M5= 0
     time=128 	PC=  32 	IR=400a 	MA=32 	MD=0000 	AC= 0  M3= 0  M4= 0  M5= 0
     time=129 	PC=  32 	IR=400a 	MA=32 	MD=6004 	AC= 0  M3= 0  M4= 0  M5= 0
     time=130 	PC=  32 	IR=6004 	MA= 4 	MD=6004 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  32 OP=0110
    
     time=131 	PC=  34 	IR=6004 	MA= 4 	MD=6004 	AC= 0  M3= 0  M4= 0  M5= 0
     time=132 	PC=  34 	IR=6004 	MA= 4 	MD=0005 	AC= 0  M3= 0  M4= 0  M5= 0
     PC=  34 -> add [004] = 0005
    
     time=133 	PC=  34 	IR=6004 	MA= 4 	MD=0005 	AC= 5  M3= 0  M4= 0  M5= 0
     time=134 	PC=  34 	IR=6004 	MA=34 	MD=0005 	AC= 5  M3= 0  M4= 0  M5= 0
     time=135 	PC=  34 	IR=6004 	MA=34 	MD=500a 	AC= 5  M3= 0  M4= 0  M5= 0
     time=136 	PC=  34 	IR=500a 	MA=10 	MD=500a 	AC= 5  M3= 0  M4= 0  M5= 0
     PC=  34 OP=0101
    
     time=137 	PC=  36 	IR=500a 	MA=10 	MD=500a 	AC= 5  M3= 0  M4= 0  M5= 0
     time=138 	PC=  36 	IR=500a 	MA=10 	MD=0005 	AC= 5  M3= 0  M4= 0  M5= 0
     PC=  36 -> store 0005 @ [00a]
    
     time=140 	PC=  36 	IR=500a 	MA=36 	MD=0005 	AC= 5  M3= 0  M4= 0  M5= 0
	  
*/