//Subtrator de 3bits (Sem verificação de overflow)
//Usando somador e portas xor
//Wadson Ferreira
//460631

module S1(output soma,output co,input ci, input a, input b);
	wire xora,anda,andb;
	xor X1(xora,ci,a);
	xor X2(soma,xora,b);
	and  A1(anda,xora,b);
	and  A2(andb,ci,a);
	or   O1(co,anda,andb);
endmodule

module S3(output[2:0] subtracao, output co, input ci, input[2:0] a, input[2:0] b);
	wire co0, co1;
	wire notb2,notb1,notb0;
	not N1(notb2,b[2]);
	not N2(notb1,b[1]);
	not N3(notb0,b[0]);
	S1 SA(subtracao[0],co0,1'b1,a[0],notb0);
	S1 SB(subtracao[1],co1,co0,a[1],notb1);
	S1 SC(subtracao[2],co,co1,a[2],notb2);
endmodule

module teste;
	wire[2:0] subtracao;
	wire co;
	reg[2:0] entradaA, entradaB;
	reg ci;
	S3 SA(subtracao,co,ci,entradaA,entradaB);
	initial begin
	$display("Subtrator");
	#1 entradaA=3'b000; entradaB=3'b000;
	#1 $monitor("A=%3b B=%3b RESULTADO=%3b",entradaA,entradaB,subtracao);
	#1 entradaA=3'b100; entradaB=3'b010;
	#1 entradaA=3'b111; entradaB=3'b000;
	#1 entradaA=3'b111; entradaB=3'b111; 
	#1 entradaA=3'b000; entradaB=3'b001; 
	#1 entradaA=3'b000; entradaB=3'b111; 
	#1 entradaA=3'b111; entradaB=3'b111; 
	#1 entradaA=3'b011; entradaB=3'b011; 
	#1 entradaA=3'b001; entradaB=3'b001; 
	#1 entradaA=3'b100; entradaB=3'b100; 
	end
endmodule
