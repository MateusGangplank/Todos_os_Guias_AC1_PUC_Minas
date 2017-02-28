//Comparar igualdade e diferença com chave
//Wadson Ferreira
//460631

//S=1 -> A=B, S=0 -> A!=B
module comparadorI(output s, input[2:0] a, input[2:0] b);
	wire xora,xorb,xorc;
	xor X1(xora,a[2],b[2]);
	xor X2(xorb,a[1],b[1]);
	xor X3(xorc,a[0],b[0]);
	nor N1(s,xora,xorb,xorc);
endmodule

//S=1 -> A!=B, S=0 -> A=B
module comparadorD(output s, input[2:0] a, input[2:0] b);
	wire xora,xorb,xorc;
	xor X1(xora,a[2],b[2]);
	xor X2(xorb,a[1],b[1]);
	xor X3(xorc,a[0],b[0]);
	or N1(s,xora,xorb,xorc);
endmodule

module comparar(output s, input[2:0] a, input[2:0] b, input chave);
	wire notChave,andI,andD;
	wire ci,cd;
	not N1(notChave,chave);
	comparadorI CI(ci,a,b);
	comparadorD CD(cd,a,b);
	and I(andI,notChave,ci);
	and D(andD,chave,cd);
	or  O(s,andI,andD);
endmodule

module teste;
	wire saida;
	reg[2:0] entradaA, entradaB;
	reg chave;
	comparar C(saida,entradaA,entradaB,chave);
	initial begin
		$display("Chave=0 (Igualdade) , Chave=1 (Diferença)");
		#1 entradaA=3'b000; entradaB=3'b000; chave=1'b0;
		$monitor("A=%3b B=%3b Chave=%b Saida=%b",entradaA,entradaB,chave,saida);
		#1 entradaA=3'b000; entradaB=3'b000; chave=1'b0;
		#1 entradaA=3'b001; entradaB=3'b000; chave=1'b0;
		#1 entradaA=3'b010; entradaB=3'b000; chave=1'b0;
		#1 entradaA=3'b011; entradaB=3'b011; chave=1'b0;
		#1 entradaA=3'b000; entradaB=3'b000; chave=1'b1;
		#1 entradaA=3'b000; entradaB=3'b110; chave=1'b1;
		#1 entradaA=3'b001; entradaB=3'b100; chave=1'b1;
		#1 entradaA=3'b110; entradaB=3'b110; chave=1'b1;
	end
endmodule
