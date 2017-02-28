//Soma e subtração com seleção
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

module somaSub(output[2:0] resultado, input[2:0] a, input[2:0] b, input chave);
	wire xor2,xor1,xor0;
	xor X2(xor2,chave,b[2]);
	xor X1(xor1,chave,b[1]);
	xor X0(xor0,chave,b[0]);
	wire co0,co1;
	S1 SA(resultado[0],co0,chave,a[0],xor0);
	S1 SB(resultado[1],co1,co0,a[1],xor1);
	S1 SC(resultado[2],c,co1,a[2],xor2);
endmodule

module teste;
	wire[2:0] saida;
	reg[2:0] entradaA, entradaB;
	reg chave;
	somaSub SS(saida,entradaA,entradaB,chave);
	initial begin
		$display("Chave(0)=Soma Chave(1)=Subtração");
		#1 entradaA=3'b000; entradaB=3'b000; chave=1'b0;
		#1 $monitor("A=%3b B=%3b C=%b S=%3b",entradaA,entradaB,chave,saida);
		#1 entradaA=3'b111; entradaB=3'b111; chave=1'b0;
		#1 entradaA=3'b011; entradaB=3'b001; chave=1'b0;
		#1 entradaA=3'b111; entradaB=3'b001; chave=1'b0;
		#1 entradaA=3'b111; entradaB=3'b111; chave=1'b1;
		#1 entradaA=3'b000; entradaB=3'b001; chave=1'b1;
		#1 entradaA=3'b011; entradaB=3'b001; chave=1'b1;
		#1 entradaA=3'b001; entradaB=3'b001; chave=1'b1;
	end
endmodule
