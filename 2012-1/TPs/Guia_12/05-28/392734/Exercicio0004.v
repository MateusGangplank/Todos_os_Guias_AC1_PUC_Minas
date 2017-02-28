//--------------------------------------------------
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
// Guia 12 - Exercicio 04
//--------------------------------------------------

module cpu;  
  
  //--dados mnem�nicos
  parameter
  	HLT = 7'b0000000,
	LDA = 7'b0000001,
	ADD = 7'b0000010,
	STO = 7'b0000011,
	SUB = 7'b0000100,
	JNZ = 7'b0000101,
	JNC = 7'b0000110,
	JMP = 7'b0000111,
	CNP = 7'b0001000,
	NOP = 7'b1111111;
	
  parameter clock = 1;
 
 	//--registradores e buffers 
	reg[8:0]PC;	//--contador de programa(Program Counter)
	reg[6:0]OP; //--c�digo da opera��o
	reg[15:0]AC; //--acumulador
	reg[15:0]IR; //--registrador de instru��o
	reg[8:0]MA; //--endere�o do dado
	reg[15:0]MD; //--dado da mem�ria
	reg[15:0] MEM[0:255]; //--mem�ra 256x16
	
	reg CF; //--carry flag
	reg ZF; //--zero flag
	
	//--local dos dados operados
	reg[15:0] M3,M4,M6,result;
	
	reg[15:0] OUTPUT; //--sa�da, buffer
	
	//---------------------------------------------------------
	
	initial begin: stop_at
		#(500*clock) $finish;
	end
	
	initial begin: init
		//----------------------------------------
		MEM[00] = 16'b0000111010000000; //--iniciar a m�quina e
		//--pular para a primeira parte do programa
		//----------------------------------------
		
		//-- mem�ria de dados
		MEM[01] = 16'b0000000000000001;	//--constante 1(para uso posterior)
		MEM[02] = 16'b0000000000000000;	//--constante 0(para uso posterior)
		MEM[03] = 16'b0000000000110011;	//--dado1(51)
		MEM[04] = 16'b0000000000000101;	//--dado2(5)
		MEM[05] = 16'b0000000000000000;
		MEM[06] = 16'b0000000000000010;	//--constante 2
		MEM[07] = 16'b0000000000000000;	//--quociente(dado3)
		MEM[08] = 16'b0000000000000000;	
		MEM[09] = 16'b0000000000000000;
		MEM[10] = 16'b0000000000000000;
		MEM[127] = 16'b0000000000000000;//--mult
		
		//--mem�ria de instru��es
		MEM[128] = 16'b0000001001111111;	//--lda 127	//-- AC = MEM[127](result)
		MEM[129] = 16'b0000010000000100;	//--add 04		//--AC = AC + MEM[04]
		MEM[130] = 16'b0000011001111111;	//--sto 127	//--MEM[127] = AC
		MEM[131] = 16'b0000001000000110;	//--lda 06		//--AC = MEM[06]
		MEM[132] = 16'b0000100000000001;	//--sub 01		//--AC = AC - 1
		MEM[133] = 16'b0000011000000110;	//--sto 6		//--MEM[06] = AC
		MEM[134] = 16'b0000101010000000;	//--jnz 128	//--
		MEM[135] = 16'b0000001001111111;	//--lda 127	//--AC = MEM[127]
		MEM[136] = 16'b0000011000000100;	//--sto 04		//--MEM[04] = AC
		MEM[137] = 16'b0000001000000010;	//--lda 02		//--AC = MEM[02]
		MEM[138] = 16'b0000011001111111;	//--sto 127	//--MEM[127] = AC
		MEM[139] = 16'b0000001001111111;	//--lda 127	//-- AC = MEM[127]
		MEM[140] = 16'b0000010000000100;	//--add 04		//-- AC = AC + MEM[04]
		MEM[141] = 16'b0000011001111111;	//--sto 127 	//-- MEM[127] = AC
		MEM[142] = 16'b0000001000000111;	//--lda 07		//-- AC = MEM[07]
		MEM[143] = 16'b0000010000000001;	//--add 01		//-- AC = AC + MEM[01]
		MEM[144] = 16'b0000011000000111;	//--sto 07		//-- MEM[07] = AC
		MEM[145] = 16'b0000001000000011;	//--lda 03		//-- AC = MEM[03]
		MEM[146] = 16'b0000100001111111;	//--sub 127	//-- AC = AC - MEM[127]
		MEM[147] = 16'b0000110010011000;	//--jnc 152	//-- se n�o carry PC = 152
		MEM[148] = 16'b0000001000000111;	//--lda 07		//-- AC = MEM[07]
		MEM[149] = 16'b0000100000000001;	//--sub 01		//-- AC = AC - MEM[01]
		MEM[150] = 16'b0000011000000111;	//--sto 07		//-- MEM[07] = AC
		MEM[151] = 16'b0000111010011001;	//--jmp 153
		MEM[152] = 16'b0000101010001011;	//--jnz 139 se n�o for zero
		MEM[153] = 16'b0000000000000000;	//--hlt
		MEM[255] = 16'b1111111111111111;	//--trap
		
		
		
		$display ("\nMemory dump: \n");
		 MA=0; 
		 while (MA<21)
		  begin
		   $display ("%4d \t%3h %3h %3h %3h %3h %3h %3h %3h %3h %3h %3h %3h",
		              MA*12, MEM[MA*12],MEM[MA*12+1],MEM[MA*12+2],MEM[MA*12+3],MEM[MA*12+4],MEM[MA*12+5],MEM[MA*12+6],MEM[MA*12+7],
						  MEM[MA*12+8],MEM[MA*12+9],MEM[MA*12+10],MEM[MA*12+11],MEM[MA*12+12],MEM[MA*12+13],MEM[MA*12+14],MEM[MA*12+15]);
		    MA=MA+1;
		  end
		  $display ( "\n" );
		  
		//--valores iniciais
		PC = 0;	//--inicio do programa
		OP = 0;	//--
		ZF = 0;	//--zero flag
		CF = 0;	//--carry flag
		
		$display("Exercicio 04 - Teste da CPU");
		$display("Jo�o Henrique - 392734\n");
		$monitor("time=%3d  \tPC=%d  \tIR=%2h  \tMA=%d  \tMD=%2h  \tAC=%d   CF=%d ZF=%d  M3=%d  M4=%d  M6=%d  result=%d",
					$time,PC,IR,MA,MD,AC,CF,ZF,M3,M4,M6,result);
	end
	
	always begin: instruction_cycle
		
		//--instruction fecth(busca da instru��o)
		#clock MA <= PC;
		#clock MD <= MEM[MA];
		#clock IR <= MD;
				 MA <= MD[8:0];
		#clock PC <= PC + 1;
					M3 <= MEM[03];
					M4 <= MEM[04];
					M6 <= MEM[06];
					result <= MEM[07];
		
		if(OP != NOP)
		begin
			OP = IR[15:9];
			$display("PC= %d   OP = %3b",PC,OP);
		end
		else
			begin
			$display("PARAR");
			$finish;
			end
		
		case(OP)
			HLT:
				begin
				#clock PC = 254;
				$display("PC = %d -> hlt\n",PC+1);
				end
			LDA:
				begin
				#clock MD[15:0] <= MEM[MA];
				#clock AC <= MD;
				if(AC == 0) ZF = 1;
				else ZF = 0;
				OUTPUT = AC;
				$display("PC = %d -> lda %h CZ=%d%d",PC,MA,CF,ZF);
				end
			ADD:
				begin
				#clock MD[15:0] <= MEM[MA];
				#clock
				if(AC+MD<=65535)
					begin
						CF = 0;
						AC = AC + MD;
					end
				else
					begin
						CF = 1;
						AC = AC + MD - 65535;
					end
				if(AC == 0)	ZF = 1;
				else ZF = 0;
				OUTPUT = AC;
				$display("PC = %d -> add[%h] = %h  CZ=%d%d",PC,MA,MD,CF,ZF);
				end
			STO:
				begin
					#clock MD <= AC;
					#clock MEM[MA] <= MD[7:0];
					$display("PC = %d -> sto %h @ [%h]",PC,MD,MA);
				end
			SUB:
				begin
					#clock MD[15:0] <= MEM[MA];
					#clock
					if(AC - MD < 65536)
						begin
							CF = 0;
							AC = AC - MD;
						end
					else
						begin
							CF = 1;
							AC = AC - MD + 65536;
						end
					if(AC == 0) ZF = 1;
					else ZF = 0;
					OUTPUT <= AC;
					$display("PC = %d -> sub[%h]= %h  CZ=%d%d",PC,MA,MD,CF,ZF);
				end
			
			JNZ:
				begin
					#clock $display("PC = %d -> jnz (%h==0) %h ZF = %b",PC,AC,MA,ZF);
					if(ZF == 0)
						PC <= MA;
					
				end
			
			JNC:
				begin
					#clock $display("PC = %d -> jnc (%h==0) %h CF = %b",PC,AC,MA,CF);
					if(CF == 0)
						PC <= MA;
					
				end
			
			JMP:
				begin
					#clock $display("PC = %d -> jmp [%h]",PC,MA);
					PC <= MA;
				end
				
			CNP:
				begin
					#clock 
						AC[0] = ~AC[0];
						AC[1] = ~AC[1];
						AC[2] = ~AC[2];
						AC[3] = ~AC[3];
						AC[4] = ~AC[4];
						AC[5] = ~AC[5];
						AC[6] = ~AC[6];
						AC[7] = ~AC[7];
						AC[8] = ~AC[8];
						AC[9] = ~AC[9];
						AC[10] = ~AC[10];
						AC[11] = ~AC[11];
						AC[12] = ~AC[12];
						AC[13] = ~AC[13];
						AC[14] = ~AC[14];
						AC[15] = ~AC[15];
					#clock
						if(AC+1'b1<=65535)
							begin
								CF = 0;
								AC = AC + 1'b1;
							end
						else
							begin
								CF = 1;
								AC = AC + 1'b1 - 65535;
							end
						if(AC == 0)	ZF = 1;
						else ZF = 0;
						OUTPUT <= AC;
					#clock $display("PC = %d -> cnp AC = %h",PC,AC);
				end
							
		endcase
	end
	
	
endmodule