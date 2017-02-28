//
// -- Simple CPU in Verilog HDL
// -- Matricula 380783
// -- Lucas Siqueira Chagas
//

module cpu;
  //  simple computer with 3-bit op codes in first 3 bits and
  //  5 bit address in last 5 bits of 8-bit instructions,
  //  memory size is 32x8 bits
  //
  //               code empty	address
  // Instruction = xxxx  aaaa aaaaaaaa
  //               |        | |	     |		
  //               15       8 7      0
  //               |        | |      |
  // Value       = S0000  000 00000000
  //             signal     mantissa
  //
  // Name  Code  Op   Meaning                 Comment
  //
  // halt  000 00000  PC <- 0000              ; stop operation
  //
  // lda   0001 aaaaa  AC <- MEM [aaaa]        ; load contents at address (aaaa) into AC
  // add   0010 aaaaa  AC <- AC + MEM [aaaa]   ; add contents at address (aaaa) to AC
  // sto   0011 aaaaa  MEM [aaaa] <- AC        ; store contents of AC into address (aaaa)
  // sub   0100 aaaaa  AC <- AC - MEM [aaaa]   ; subtracts contents at address (aaaa) to AC
  //
  // jnz   0101 aaaaa  PC <- (AC=0)? aaaa:PC+1 ; if (AC=0) then next instruction at (aaaa)
  // jnc   0110 aaaaa  PC <- (CF<0)? aaaa:PC+1 ; if (CF<0) then next instruction at (aaaa)
  // jmp   0111 aaaaa  PC <- aaaa              ; jump to instruction at address (aaaa)
  // nop   1000 aaaaa  PC <- aaaa              ; nao fazer nada
  // cm1   1001 aaaaa  PC <- aaaa              ; compelmento de 2

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
   NOP   = 4'b1000,
	CM1   = 4'b1001;

// clock timing frequency
parameter clock = 1;

// registers and buffers
reg [7:0] PC;             // [PC]  Program Counter //-- se der pau mudar valor para 7:0
reg [15:0] IR;            // [IR]  Instruction Register

reg [15:0] AC;            // [AC]  ACcumulator

reg [7:0] MA;             // [MA]  Memory Address

reg [7:0] MEM[0:255];     // 32    words of 08-bit of memory

reg [7:0] MD;             // [MD]  Memory Data

reg       CF;             //       Carry Flag

reg       ZF;             //       Zero  Flag

// memory mapping output 
reg [15:0] M02,            
           M04,            
           M06,            
			  M08,		
			  M10,
			  M12,
			  M14,
			  M16,
			  M18;	
reg [3:0] OP;            // instruction code

reg [15:0] OUTPUT;        // [OUT] output buffer (=AC)

// -------------------------------------------------------------------
//
// The two "initial" and the "always" constructs run concurrently
// Will stop the execution after 150 clock units.
//

initial begin: stop_at
// simulation time
   #(900*clock) $finish;
end

//
// Initialize the PC register and memory MEM with test program
// (execute once)
//

initial begin: init
// memory area (32 x 8 bits)
    MEM[00] = 8'b01110000;   // -- jmp  20 (program start)
    MEM[01] = 8'b00010100;   

// -- area para dados 		// -- dado1/(2*dado2) 
	 MEM[02] = 8'b00000000; // -- M02  constnante 2  
	 MEM[03] = 8'b00000001;    
   
	 MEM[04] = 8'b00000000; // -- M04  dado2 = 4
	 MEM[05] = 8'b00000100;   
    
	 MEM[06] = 8'b00000000; // -- M06  constante 1       
    MEM[07] = 8'b00000001;    

	 MEM[08] = 8'b00000000; // -- M08 dado1 = 253
	 MEM[09] = 8'b01000001;   
    
	 MEM[10] = 8'b00000000; // -- M10 outra constante 1 
	 MEM[11] = 8'b00000001;   
    
	 MEM[12] = 8'b00000000; // -- M12   
	 MEM[13] = 8'b00000000;   
    
	 MEM[14] = 8'b00000000; // -- M14 
	 MEM[15] = 8'b00000000;   
    
	 MEM[16] = 8'b00000000; // -- M16
	 MEM[17] = 8'b00000000;   
    
	 MEM[18] = 8'b00000000; // -- M18  Result
	 MEM[19] = 8'b00000000;    	 
 
 // -- area programavel    // main 
	 MEM[20] = 8'b00010000;   
	 MEM[21] = 8'b00000100; // lda 04 // A=MEM[04]  
  
    MEM[22] = 8'b00100000;    
	 MEM[23] = 8'b00000100; // add 04 // A=A+MEM[04] 
  
    MEM[24] = 8'b00110000;   	
	 MEM[25] = 8'b00000100; // sto 04 // MEM[04]=A
  
    MEM[26] = 8'b00010000;   
	 MEM[27] = 8'b00000010; // lda 02 // A=MEM[02] 
  
    MEM[28] = 8'b01000000;   
	 MEM[29] = 8'b00000110; // sub 02 // A=A-1
  
    MEM[30] = 8'b00110000;      
	 MEM[31] = 8'b00000010; // sto 06 // MEM[02]=A
  
    MEM[32] = 8'b01010000;        
	 MEM[33] = 8'b00010100; // jnz 20 
  
    MEM[34] = 8'b00010000;       
	 MEM[35] = 8'b00010010; // lda 18 // A=MEM[18]    
  
    MEM[36] = 8'b00100000;       
	 MEM[37] = 8'b00001010; // add 10 // A=A+1   
  
    MEM[38] = 8'b00110000;       
	 MEM[39] = 8'b00010010; // sto 18 // result=A  
  
    MEM[40] = 8'b00010000;       
	 MEM[41] = 8'b00001000; // lda 08 // A=MEM[08] 
  
    MEM[42] = 8'b01000000;       
	 MEM[43] = 8'b00000100; // sub 04 // A=A-MEM[04]
  
    MEM[44] = 8'b00110000;    	     
	 MEM[45] = 8'b00001000; // sto 08 // MEM[08]=A
  
    MEM[46] = 8'b01100000;       
	 MEM[47] = 8'b00010010; // jnc  
  
    MEM[48] = 8'b00010000;       
	 MEM[49] = 8'b00010010; // lda 18 // A=result  	
  
    MEM[50] = 8'b01000000;      
	 MEM[51] = 8'b00001010; // sub 10 // A=A-1
  
    MEM[52] = 8'b00110000;       
	 MEM[53] = 8'b00010010; // sto 18 // result = A  
  
    MEM[54] = 8'b10000000;       
	 MEM[55] = 8'b00000000; // STOP
  
    MEM[56] = 8'b00000000;  
    MEM[57] = 8'b00000000; //
	
	 MEM[58] = 8'b00000000;  
    MEM[59] = 8'b00000000;	//
// -- memoria vai ate 255
// memory dump
   $display ("\nMemory dump: \n");
    MA=0; 
	 $display("Parte Alta:");
    while (MA<16)
     begin
      $display ("%4d \t%3h %3h %3h %3h",
                 MA*4, MEM[MA*4],MEM[MA*4+1],MEM[MA*4+2],MEM[MA*4+3]);
       MA=MA+2;
     end
     $display ( "\n" );

    MA=1; 
	 $display("Parte Baixa:");
    while (MA<15)
     begin
      $display ("%4d \t%3h %3h %3h %3h",
                 MA*4, MEM[MA*4],MEM[MA*4+1],MEM[MA*4+2],MEM[MA*4+3]);
       MA=MA+2;
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
   $monitor(" time=%03d \tPC=%d \tIR=%h \tMA=%2d \tMD=%h \tAC=%2d  CF=%b  ZF=%b  M02=%2d  M04=%2d  M06=%2d	M08=%2d M010=%2d  M12=%2d  M14=%2d	M16=%2d	Resultado=%d",
             $time, PC, IR, MA, MD, AC, CF, ZF, M02, M04, M06, M08, M10, M12, M14, M16, M18);

end // init

//
// main_process will loop until simulation time is over
//
always begin: instruction_cycle
   // instruction fetch
      #clock MA <= PC;                       
		
		
		#clock MD <= MEM[MA];              
		#clock IR[15:8] <= MD;                   
      		 MA <= MD;              
      		 MD <= MEM[MA+1];       
		#clock IR[7:0] <= MD;                 	        
		       MA <= MD;              
      
		#clock PC <= PC + 2;               
		
		/*$display("MA       : %8b", MA);
		$display("MEM[MA]  : %8b", MEM[MA]);
		$display("MEM[MA+1]: %8b", MEM[MA+1]);
		$display("IR[15:8] : %8b", IR[15:8]);
		$display("IR[7:0]  : %8b", IR[7:0]);*/
  		                                      
      M02[15:8]  <= MEM[02];
		M02[7:0]   <= MEM[03];
       
      M04[15:8]  <= MEM[04];
		M04[7:0]   <= MEM[05];
		
		M06[15:8]  <= MEM[06];
		M06[7:0]   <= MEM[07];
		
		M08[15:8]  <= MEM[08];
		M08[7:0]   <= MEM[09];
       
      M10[15:8]  <= MEM[10];
		M10[7:0]   <= MEM[11];
		
		M12[15:8]  <= MEM[12];
		M12[7:0]   <= MEM[13];

      M14[15:8]  <= MEM[14];
		M14[7:0]   <= MEM[15];
       
      M16[15:8]  <= MEM[16];
		M16[7:0]   <= MEM[17];
		
		M18[15:8]  <= MEM[18];
		M18[7:0]   <= MEM[19];
  
   // decode and execute instruction //-- todos as operacoes devem ser adequadas com o novo valor de IR
      if ( OP != NOP )
       begin
         OP = IR[15:12];
        $display (" PC=%d OP=%4b\n", PC, OP);
       end
      else
       $display  (" STOP");
      case ( OP )
        HLT:   begin
              #clock PC = 30;
               $display (" PC=%d -> hlt\n", PC);
               end
        LDA:   begin
              #clock MD[7:0]    <= MEM[MA];
              #clock AC[15:8]   <= MD;
				  #clock MD[7:0]    <= MEM[MA+1];
				  #clock AC[7:0]    <= MD;
               if (AC  ==  0 ) begin ZF=1;               end
               else            begin ZF=0;               end
               OUTPUT = AC;
               $display (" PC=%d -> lda [%h] = %h (ZF=%b)\n", PC, MA, MD, ZF);
               end
        ADD:   begin
              #clock MD[7:0] <= MEM[MA+1];
              #clock
               if (AC[7:0]+MD<=255) 
						begin 
						CF=0; 
						AC[7:0]=AC[7:0]+MD;     
						end
               else            		
						begin 
						CF=1; 
						AC[15:8]=AC[15:8]+1;
						AC[7:0]=AC[7:0]+MD-256;
						end
				  #clock MD[7:0] <= MEM[MA];
              #clock
				  	if (AC[15:8]+MD > 0) 
						begin 
						AC[15:8]=AC[15:8]+MD;     
						end
               OUTPUT = AC;
               $display (" PC=%d -> add [%h] = %h (CZ=%b%b)\n", PC, MA+1, MD, CF, ZF);
               end
        STO:   begin
              #clock MD <= AC[15:8];
              #clock MEM[MA] <= MD[7:0];
				  #clock MD <= AC[7:0];
				  #clock MEM[MA+1] <= MD[7:0];
               $display (" PC=%d -> sto %h @ [%h] @ [%h]\n", PC, MD, MA, MA+1);
               end
        SUB:   begin
              #clock MD[7:0] <= MEM[MA+1]; // -- recebe a parte baixa
              #clock
               if (AC[7:0]-MD < 256) 
						begin 
						CF=0; 
						AC[7:0]=AC[7:0]-MD;     
						end
               else            		
						begin 
						CF=1; 
						AC[15:8]=AC[15:8]-1; 
						AC[7:0]=AC[7:0]-MD+256;  
						end			
				  #clock MD[7:0] <= MEM[MA];
              #clock
				  	if (AC[15:8]-MD > 0) 
						begin 
						AC[15:8]=AC[15:8]-MD;     
						end
               OUTPUT = AC;
               $display (" PC=%d -> sub [%h] = %h (CZ=%b%b)\n", PC, MA, MD, CF, ZF);
               end
        JNZ:   begin
              #clock
               $display (" PC=%d -> jnz (%h==0) %h (ZF=%b)\n", PC, AC, MA, ZF);
               if (ZF != 0)
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
		  CM1:   begin
              #clock MD[7:0] <= MEM[MA+1];
              #clock AC[7:0] = ~MD;
				  #clock MD[7:0] <= MEM[MA];
              #clock AC[15:8] = ~MD;
				  	OUTPUT = AC;
				  	$display (" PC=%d -> cm1 [%h] = %8b (CZ=%b%b)\n", PC, MA, MD, CF, ZF);
		  			end
      endcase
end // main process
endmodule