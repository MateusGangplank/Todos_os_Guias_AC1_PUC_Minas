//Verificar Carry e Overflow
//Wadson Ferreira
//460631 

module S1(output s, output co, input ci,input a, input b);
	wire xora,anda,andb;
	xor X1(xora,a,b);
	and A1(anda,a,b);
	xor X2(s,xora,ci);
	and A2(andb,xora,ci);
	or  O1(co,anda,andb);
endmodule

module SomaSub(output[2:0] s, output co, output over, input ci, input[2:0] a, input[2:0] b);
	wire co0,co1;
	wire xora, xorb, xorc;
	xor X1(xora,ci,b[0]);
	xor X2(xorb,ci,b[1]);
	xor X3(xorc,ci,b[2]);
	S1 SA(s[0],co0,ci,a[0],xora);
	S1 SB(s[1],co1,co0,a[1],xorb);
	S1 SC(s[2],co,co1,a[2],xorc);
	//verificaçao do over
	wire anda, andb, nota, notb, notc;
	not N1(nota, ci);
	not N2(notb, a[2]);
	not N3(notc, b[2]);
	and A1(anda,nota,notb,notc,s[2]);
	and A2(andb,notb,ci,b[2],s[2]);
	or  O1(over,anda,andb);
endmodule

module teste;
	wire[2:0] saida;
	wire over,carry;
	reg[2:0] entradaA, entradaB;
	reg operacao;
	SomaSub S1(saida,carry,over,operacao,entradaA,entradaB);
	initial begin
		$display("0=Soma 1=Subtracao");
		#1 entradaA=3'b000; entradaB=3'b000; operacao=1'b0;
		#1 $monitor("A=%3b B=%3b Operacao=%b Saida=%3b Carry=%b Over=%b",entradaA,entradaB,operacao,saida,carry,over);
		#1 entradaA=3'b000; entradaB=3'b010; operacao=1'b0;
		#1 entradaA=3'b011; entradaB=3'b001; operacao=1'b0;
		#1 entradaA=3'b111; entradaB=3'b001; operacao=1'b0;
		#1 entradaA=3'b111; entradaB=3'b111; operacao=1'b0;
		#1 entradaA=3'b000; entradaB=3'b001; operacao=1'b1;
		#1 entradaA=3'b001; entradaB=3'b011; operacao=1'b0;
		#1 entradaA=3'b111; entradaB=3'b111; operacao=1'b1;
		#1 entradaA=3'b011; entradaB=3'b001; operacao=1'b1;
		#1 entradaA=3'b010; entradaB=3'b010; operacao=1'b1;
	end
endmodule
