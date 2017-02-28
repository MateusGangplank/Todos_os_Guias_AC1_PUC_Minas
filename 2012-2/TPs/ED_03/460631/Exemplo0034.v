// Projetar e simular LU
// Wadson Ferreira
// 460631

module OR(output s, input a, input b);
	or O1(s,a,b);
endmodule

module NOR(output s, input a, input b);
	nor O1(s,a,b);
endmodule

module XOR(output s, input a, input b);
	xor O1(s,a,b);
endmodule

module XNOR(output s, input a, input b);
	xnor O1(s,a,b);
endmodule

module LU(output s, input a, input b, input[1:0] select);
	wire or1,nor1,xor1,xnor1;
	reg resultado;
	OR OR1(or1,a,b);
	NOR NOR1(nor1,a,b);
	XOR XOR1(xor1,a,b);
	XNOR XNOR1(xnor1,a,b);
	assign s = (select==0) ? or1 : (select==1) ? nor1 : (select==2) ? xor1 : xnor1;
endmodule

module teste;
	wire saida;
	reg entradaA,entradaB;
	reg[1:0] select;
	LU L1(saida,entradaA,entradaB,select);
	initial begin
		$display("\nWadson Ferreira - 460631\n00=OR 01=NOR 10=XOR 11=XNOR");
		#1 entradaA=1'b0; entradaB=1'b0; select=2'b00;
		   $monitor("%b (%2b) %b = %b",entradaA,select,entradaB,saida);
		#1 entradaA=1'b1; entradaB=1'b0; select=2'b01;
		#1 entradaA=1'b0; entradaB=1'b1; select=2'b10;
		#1 entradaA=1'b1; entradaB=1'b1; select=2'b11;
		#1 entradaA=1'b1; entradaB=1'b1; select=2'b10;
		#1 entradaA=1'b0; entradaB=1'b1; select=2'b11;
		#1 entradaA=1'b1; entradaB=1'b0; select=2'b00;
	end
endmodule

		
