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
	reg[3:0]OP; //código da operação
	reg[7:0]AC; //acumulador
	reg[7:0]IR; //registrador de instrução
	reg[4:0]MA; //endereço do dado
	reg[7:0]MD; //dado da memória
	reg[7:0] MEM[0:63]; //memóra 32x8
	
	reg CF; //carry flag
	reg ZF; //zero flag
	
	//local dos dados operados
	reg[7:0] M2,M3,M4,M8;
	
	reg[7:0] OUTPUT; //saída, buffer
	
	//-------------------------------------------------------
	
	initial begin: stop_at
		#(500*clock) $finish;
	end
	
	initial begin: init
		//--------------------------------------
		MEM[00] = 8'b11101001; //ligar a maquina
									//e iniciar o PC
		//--------------------------------------
		
		// memória de dados
		MEM[01] = 8'b00000001;	//constante 1(para uso posterior)
		MEM[02] = 8'b00001111;	//dado1(15)
		MEM[03] = 8'b00000111;	//dado2(7)
		MEM[04] = 8'b00000000;	//quociente	
		MEM[05] = 8'b00000000;
		MEM[06] = 8'b00000000;
		MEM[07] = 8'b00000000;	//constante 0
		MEM[08] = 8'b00000000;	//multiplicacao
		
		//memória de instruções
		MEM[09] = 8'b00101000;	//lda 08 // AC = MEM[08]
		MEM[10] = 8'b01000011;	//add 03	// AC = AC + MEM[03]
		MEM[11] = 8'b01101000;	//sto 08 // MEM[08] = AC
		MEM[12] = 8'b00100100;	//lda 04	// AC = MEM[04]
		MEM[13] = 8'b01000001;	//add 01	// AC = AC + MEM[01]
		MEM[14] = 8'b01100100;	//sto 04	// MEM[04] = AC
		MEM[15] = 8'b00100010;	//lda 02	// AC = MEM[02]
		MEM[16] = 8'b10001000;	//sub 08	// AC = AC - MEM[08]
		MEM[17] = 8'b11011001;	//jnc 25	// se não carry PC = 25
		MEM[18] = 8'b00100100;	//lda 04	// AC = MEM[04]
		MEM[19] = 8'b10000001;	//sub 01	// AC = AC - MEM[01]
		MEM[20] = 8'b01100100;	//sto 04	// MEM[04] = AC
		MEM[21] = 8'b00101000;	//lda 08	// AC = MEM[08]
		MEM[22] = 8'b10000011;	//sub 03	// AC = AC - MEM[03]
		MEM[23] = 8'b01101000;	//sto	08	// MEM[08] = AC
		MEM[24] = 8'b11111010;	//jmp 26
		MEM[25] = 8'b10101001;	//jnz 09 se não for zero
		MEM[26] = 8'b00100010;	//lda 02	// AC = MEM[02]
		MEM[27] = 8'b10001000;	//sub 08	// AC = AC - MEM[08]
		MEM[28] = 8'b01100100;	//sto 04	// MEM[04] = AC
		MEM[29] = 8'b00000000;	//hlt
		MEM[30] = 8'b00000000;
		MEM[31] = 8'b11111111;	//trap
		
		
		
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
		
		$display("Exercicio0114 - CPU - Teste de Simulador para memória de 32x8");
		$display("Rafael Guimaraes de Sousa - 451607");
		$monitor("time=%3d  \tPC=%d  \tIR=%2h  \tMA=%d  \tMD=%2h  \tAC=%d   CF=%d ZF=%d  M2=%d  M3=%d  M8=%d  result=%d",
					$time,PC,IR,MA,MD,AC,CF,ZF,M2,M3,M8,M4);
	end
	
	always begin: instruction_cycle
		
		//instruction fecth(busca da instrução)
		#clock MA <= PC;
		#clock MD <= MEM[MA];
		#clock IR <= MD;
				 MA <= MD[4:0];
		#clock PC <= PC + 1;
					M2 <= MEM[02];
					M3 <= MEM[03];
					M4 <= MEM[04];
					M8 <= MEM[08];
		
		if(OP != NOP)
		begin
			OP = IR[7:5];
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