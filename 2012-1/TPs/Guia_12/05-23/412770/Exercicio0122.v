//-------------------------------------------
//Nome: Rayan Darwin
//Matrícula: 412770
//-------------------------------------------

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
  // halt  0000000 00000  PC <- 0000              ; stop operation
  //
  // lda   0000001 aaaaa  AC <- MEM [aaaa]        ; load contents at address (aaaa) into AC
  // add   0000010 aaaaa  AC <- AC + MEM [aaaa]   ; add contents at address (aaaa) to AC
  // sto   0000011 aaaaa  MEM [aaaa] <- AC        ; store contents of AC into address (aaaa)
  // sub   0000100 aaaaa  AC <- AC - MEM [aaaa]   ; subtracts contents at address (aaaa) to AC
  //
  // jnz   0000101 aaaaa  PC <- (AC=0)? aaaa:PC+1 ; if (AC=0) then next instruction at (aaaa)
  // jnc   0000110 aaaaa  PC <- (CF<0)? aaaa:PC+1 ; if (CF<0) then next instruction at (aaaa)
  // jmp   0000111 aaaaa  PC <- aaaa              ; jump to instruction at address (aaaa)
  // cnp	  0001000 00000  AC <- ~AC + 1'b1		  ; calculates complement of AC
  
  
  //dados mnemônicos
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
 
 	//registradores e buffers 
	reg[8:0]PC;	//contador de programa(Program Counter)
	reg[6:0]OP; //código da operação
	reg[15:0]AC; //acumulador
	reg[15:0]IR; //registrador de instrução
	reg[8:0]MA; //endereço do dado
	reg[15:0]MD; //dado da memória
	reg[15:0] MEM[0:255]; //memóra 256x16
	
	reg CF; //carry flag
	reg ZF; //zero flag
	
	//local dos dados operados
	reg[15:0] M3,M4,M5,result;
	
	reg[15:0] OUTPUT; //saída, buffer
	
	//-------------------------------------------------------
	
	initial begin: stop_at
		#(500*clock) $finish;
	end
	
	initial begin: init
		//--------------------------------------
		MEM[00] = 16'b0000111010000000; //iniciar a máquina e
		//pular para a primeira parte do programa
		//--------------------------------------
		
		// memória de dados
		MEM[01] = 16'b0000000000000001;	//constante 1(para uso posterior)
		MEM[02] = 16'b0000000000000000;	//constante 0(para uso posterior)
		MEM[03] = 16'b0000000000001111;	//dado1(15)
		MEM[04] = 16'b0000000000010000;	//dado2(16)
		MEM[05] = 16'b0000000000010101;	//dado3(21)
		MEM[06] = 16'b0000000000000000;
		MEM[07] = 16'b0000000000000000;
		MEM[08] = 16'b0000000000000000;	
		MEM[09] = 16'b0000000000000000;
		MEM[10] = 16'b0000000000000000;
		MEM[127] = 16'b0000000000000000;//resultado
		
		//memória de instruções
		MEM[128] = 16'b0000001001111111;	//lda 127	// AC = MEM[127](result)
		MEM[129] = 16'b0000010000000011;	//add 03		//AC = AC + MEM[03]
		MEM[130] = 16'b0000011001111111;	//sto 127	//MEM[127] = AC
		MEM[131] = 16'b0000100000000100;	//sub 04		//AC = AC - MEM[04]
		MEM[132] = 16'b0000011001111111;	//sto 127	//MEM[127] = AC
		MEM[133] = 16'b0000010000000101;	//add 05		//AC = AC + MEM[05]
		MEM[134] = 16'b0000011001111111;	//sto 127	//MEM[127] = AC
		MEM[135] = 16'b0000000000000000;	//hlt			//parar a execução
		MEM[254] = 16'b0000000000000000;
		MEM[255] = 16'b0000111111111111;	//trap (loop infinito)
		
		
		
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
		  
		//valores iniciais
		PC = 0;	//inicio do programa
		OP = 0;	//
		ZF = 0;	//zero flag
		CF = 0;	//carry flag
		
		$display("Exercicio02 - CPU - Teste de Simulador para memória de 256x16");
		$display("Samuel Eusébio da SIlva - 435055");
		$monitor("time=%3d  \tPC=%d  \tIR=%2h  \tMA=%d  \tMD=%2h  \tAC=%d   CF=%d ZF=%d  M3=%d  M4=%d  M5=%d  result=%d",
					$time,PC,IR,MA,MD,AC,CF,ZF,M3,M4,M5,result);
	end
	
	always begin: instruction_cycle
		
		//instruction fecth(busca da instrução)
		#clock MA <= PC;
		#clock MD <= MEM[MA];
		#clock IR <= MD;
				 MA <= MD[8:0];
		#clock PC <= PC + 1;
					M3 <= MEM[03];
					M4 <= MEM[04];
					M5 <= MEM[05];
					result <= MEM[127];
		
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
					#clock AC <= ~AC + 1'b1;
					#clock $display("PC = %d -> cnp AC = ",PC,AC);
				end
							
		endcase
	end
	
	
endmodule