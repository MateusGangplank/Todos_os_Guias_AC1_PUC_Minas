//----------------------------------
// -- Fabio Fiuza Pereira
// -- 406087
//----------------------------------



// -- Simple CPU 
module cpu;
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

parameter clock = 1;


reg [4:0] PC;            
reg [7:0] IR;            

reg [7:0] AC;            

reg [4:0] MA;           
reg [7:0] MEM[0:31];     
reg [7:0] MD;            

reg       CF;            
reg       ZF;            


reg [7:0] M3,            
          M4,            
          M5;            

reg [2:0] OP;            

reg [7:0] OUTPUT;        



initial begin: stop_at

end


initial begin: init
    MEM[00] = 8'b11101000;   

    MEM[01] = 8'b00000000;   
    MEM[02] = 8'b00000001;   
    MEM[03] = 8'b00000011;   
    MEM[04] = 8'b00000010;   
    MEM[05] = 8'b00000100;   
    MEM[06] = 8'b00000000;   
    MEM[07] = 8'b00000000;   

    MEM[08] = 8'b00100111;   
    MEM[09] = 8'b01000011;   
    MEM[10] = 8'b01100111;   
    MEM[11] = 8'b00100111;   
    MEM[12] = 8'b01000100;   
    MEM[13] = 8'b01100111;   
    MEM[14] = 8'b00100111;   
    MEM[15] = 8'b10000101;   
	 
    MEM[16] = 8'b01100111;   
    MEM[17] = 8'b00000000;   
    MEM[18] = 8'b00000000;   
    MEM[19] = 8'b00000000;   
    MEM[20] = 8'b00000000;   
    MEM[21] = 8'b00000000;   
    MEM[22] = 8'b00000000;   
    MEM[23] = 8'b00000000;  

    MEM[24] = 8'b00000000;   
    MEM[25] = 8'b00000000;   
    MEM[26] = 8'b00000000;   
    MEM[27] = 8'b00000000;   
    MEM[28] = 8'b00000000;   
    MEM[29] = 8'b00000000;   
    MEM[30] = 8'b00000000;   
    MEM[31] = 8'b11111111;   


   $display ("\nMemory dump (before running): \n");
    MA=0; 
    while (MA<8)
     begin
      $display ("%4d \t%3h %3h %3h %3h",
                 MA*4, MEM[MA*4],MEM[MA*4+1],MEM[MA*4+2],MEM[MA*4+3]);
       MA=MA+1;
     end
     $display ( "\n" );


    PC = 0;                  
    CF = 0;                  
    ZF = 0;                  
    OP = 0;

   $display("CPU - Simple Computer Simulation - v1.0\n");
	

   $monitor(" time=%03d \tPC=%d \tIR=%h \tMA=%2d \tMD=%h \tAC=%2d  CF=%b  ZF=%b  M3=%2d  M4=%2d  M5=%2d",
             $time, PC, IR, MA, MD, AC, CF, ZF, M3, M4, M5);

end 


always begin: instruction_cycle

   
      #clock MA <= PC;                   
      #clock MD <= MEM[MA];              
      #clock IR <= MD;                   
             MA <= MD[4:0];              
      #clock PC <= PC + 1;               
                                         
             M3 <= MEM[03];              
             M4 <= MEM[04];             
             M5 <= MEM[07];              

   
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
               #clock; 
               end
      endcase
end 
endmodule
