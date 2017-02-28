//Comparador de igualdade
//Wadson Ferreira
//460631

//S=1 -> A=B, S=0 -> A!=B
module comparador(output s, input[2:0] a, input[2:0] b);
	wire xora,xorb,xorc;
	xor X1(xora,a[2],b[2]);
	xor X2(xorb,a[1],b[1]);
	xor X3(xorc,a[0],b[0]);
	nor N1(s,xora,xorb,xorc);
endmodule

module teste;
	wire saida;
	reg[2:0] entradaA, entradaB;
	comparador C1(saida,entradaA,entradaB);
	initial begin
		$display("S=1 -> A=B , S=0 -> A!=B");
		#1 entradaA=3'b000; entradaB=3'b000;
		#1 $monitor("A=%3b B=%3b Saida=%b",entradaA,entradaB,saida);
		#1 entradaA=3'b000; entradaB=3'b000;
		#1 entradaA=3'b111; entradaB=3'b111;
		#1 entradaA=3'b011; entradaB=3'b110;
		#1 entradaA=3'b110; entradaB=3'b111;
		#1 entradaA=3'b001; entradaB=3'b100;
		#1 entradaA=3'b111; entradaB=3'b010;
	end
endmodule
