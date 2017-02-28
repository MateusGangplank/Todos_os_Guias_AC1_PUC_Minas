module cpu;
	
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
  
  //dados mnemônicos
  parameter
  	HLT = 4'b0000,
	LDA = 4'b0001,
	ADD = 4'b0010,
	STO = 4'b0011,
	SUB = 4'b0100,
	JNZ = 4'b0101,
	JNC = 4'b0110,
	JMP = 4'b0111,
	NOP = 4'b1000;
	
  parameter clock = 1;
 
 	//registradores e buffers 
	reg[4:0]PC;	//contador de programa(Program Counter)
	reg[2:0]OP; //código da operação
	reg[7:0]AC; //acumulador
	reg[7:0]IR; //registrador de instrução
	reg[4:0]MA; //endereço do dado
	reg[7:0]MD; //dado da memória
	reg[7:0] MEM[0:31]; //memóra 32x8
	
	reg CF; //carry flag
	reg ZF; //zero flag
	
	//local dos dados operados
	reg[7:0] M3,M4,M5,M14;
	
	reg[7:0] OUTPUT; //saída, buffer
	
	//-------------------------------------------------------
	
	initial begin: stop_at
		#(1000*clock) $finish;
	end
	
	initial begin: init
		//--------------------------------------
		MEM[00] = 8'b11101111; //ligar a maquina
									//e iniciar o PC
		//--------------------------------------
		
		// memória de dados
		MEM[01] = 8'b00000001; //constante 1(para uso posterior)
		MEM[02] = 8'b00000000; //constante 0(para uso posterior)
		MEM[03] = 8'b00001111; //dado1(10)
		MEM[04] = 8'b00000100; //dado2(4)
		MEM[05] = 8'b00001001; //dado3
		MEM[06] = 8'b00000000;
		MEM[07] = 8'b00000000;
		MEM[08] = 8'b00000000;
		MEM[09] = 8'b00000000;
		MEM[10] = 8'b00000000;//auxiliar
		MEM[11] = 8'b00000000;
		MEM[12] = 8'b00000000;
		MEM[13] = 8'b00000000;
		MEM[14] = 8'b00000000;//dado4 (resultado)
		
		//memória de instruções
		MEM[15] = 8'b00101110;	//lda 13 // A= MEM[14]
		MEM[16] = 8'b01000100;	//add 04 // A = A + MEM[04]
		MEM[17] = 8'b01101110;	//sto 14 //MEM[14] = A
		MEM[18] = 8'b00100011;	//lda 03 // A = MEM[03]
		MEM[19] = 8'b10000001;	//sub 01 // A = A - MEM[01]
		MEM[20] = 8'b01100011;  //sto 03 // MEM[03] = A
		MEM[21] = 8'b10101111;	//jnz 15 //(if A != 0) volta pra PC = 15
		MEM[22] = 8'b00101110;	//lda 14 // A = MEM[14]
		MEM[23] = 8'b01000101;	//add 05 // A = A + MEM[05]
		MEM[24] = 8'b01101110;	//sto 14 // MEM[14] = A
		MEM[25] = 8'b00011111;  //hlt 31
		MEM[26] = 8'b00000000;
		MEM[27] = 8'b00000000;
		MEM[28] = 8'b00000000;
		MEM[29] = 8'b00000000;
		MEM[30] = 8'b00000000;
		MEM[31] = 8'b11111111; //trap
		
		//memory dump
		$display ("\nMemory dump: \n");
		 MA=0; 
		 while (MA<8)
		  begin
		   $display ("%4d \t%3h %3h %3h %3h",
		              MA*4, MEM[MA*4],MEM[MA*4+1],MEM[MA*4+2],MEM[MA*4+3]);
		    MA=MA+1;
		  end
		  $display ( "\n" );
		  
		//valores iniciais
		PC = 0;	//inicio do programa
		OP = 0;	//
		ZF = 0;	//zero flag
		CF = 0;	//carry flag
		
		$display("Exercicio0113 - CPU - Teste de Simulador para memória de 32x8");
		$display("Rafael Guimaraes de Sousa - 451607");
		$monitor("time=%3d  \tPC=%d  \tIR=%2h  \tMA=%d  \tMD=%2h  \tAC=%d   CF=%d ZF=%d  M3=%d  M4=%d  M5=%d  M14=%d",
					$time,PC,IR,MA,MD,AC,CF,ZF,M3,M4,M5,M14);
	end
	
	always begin: instruction_cycle
		
		//instruction fecth(busca da instrução)
		#clock MA <= PC;
		#clock MD <= MEM[MA];
		#clock IR <= MD;
				 MA <= MD[4:0];
		#clock PC <= PC + 1;
					M3 <= MEM[03];
					M4 <= MEM[04];
					M5 <= MEM[05];
					M14 <= MEM[14];
		
		if(OP != NOP)
		begin
			OP = IR[7:5];
			$display("PC= %d   OP = %3b",PC,OP);
		end
		else
			$display("PARAR");
		
		case(OP)
			HLT:
				begin
				#clock PC = 30;
				$display("PC = %d -> hlt\n",PC+1);
				end
			LDA:
				begin
				#clock MD[7:0] <= MEM[MA];
				#clock AC <= MD;
				if(AC == 0) ZF = 1;
				else ZF = 0;
				OUTPUT = AC;
				$display("PC = %d -> lda %h CZ=%d%d",PC,MA,CF,ZF);
				end
			ADD:
				begin
				#clock MD[7:0] <= MEM[MA];
				#clock
				if(AC+MD<=255)
					begin
						CF = 0;
						AC = AC + MD;
					end
				else
					begin
						CF = 1;
						AC = AC + MD - 255;
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
					#clock MD[7:0] <= MEM[MA];
					#clock
					if(AC - MD < 256)
						begin
							CF = 0;
							AC = AC - MD;
						end
					else
						begin
							CF = 1;
							AC = AC - MD + 256;
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
		endcase
	end
	
	
endmodule //cpu