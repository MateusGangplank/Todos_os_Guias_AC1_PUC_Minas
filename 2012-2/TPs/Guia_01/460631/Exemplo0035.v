// Projetar e simular LU
// Wadson Ferreira
// 460631

module NOT(output s,input a);
	not N1(s,a);
endmodule

module OR(output s, input a, input b);
	or O1(s,a,b);
endmodule

module NOR(output s, input a, input b);
	nor O1(s,a,b);
endmodule

module AND(output s, input a, input b);
	and A1(s,a,b);
endmodule

module NAND(output s, input a, input b);
	nand NA1(s,a,b);
endmodule

module XOR(output s, input a, input b);
	xor O1(s,a,b);
endmodule

module XNOR(output s, input a, input b);
	xnor O1(s,a,b);
endmodule
/*
000 - NOT
001 - OR
010 - NOR
011 - AND
100 - NAND
101 - XOR
110 - XNOR
*/
module LU(output s, input a, input b, input[2:0] select);
	wire not1,or1,nor1,and1,nand1,xor1,xnor1;
	reg resultado;
	NOT NOT1(not1,a);
	OR OR1(or1,a,b);
	NOR NOR1(nor1,a,b);
	AND AND1(and1,a,b);
	NAND NAND1(nand1,a,b);
	XOR XOR1(xor1,a,b);
	XNOR XNOR1(xnor1,a,b);
	//OBS: Como fazer esse if dentro de um 'begin end'?
	assign s = (select==0) ? not1 : (select==1) ? or1 : (select==2) ? nor1 : (select==3) ? and1 : (select==4) ? nand1: (select==5) ? xor1 : xnor1;
endmodule

module teste;
	wire saida;
	reg entradaA,entradaB;
	reg[2:0] select;
	LU L1(saida,entradaA,entradaB,select);
	initial begin
		$display("\nWadson Ferreira - 460631\n000=NOT 001=OR 010=NOR 011=AND 100=NAND 101=XOR 110=XNOR");
		#1 entradaA=1'b0; entradaB=1'b0; select=3'b000;
		   $monitor("%b (%3b) %b = %b",entradaA,select,entradaB,saida);
		#1 entradaA=1'b1; entradaB=1'b0; select=3'b001;
		#1 entradaA=1'b0; entradaB=1'b1; select=3'b010;
		#1 entradaA=1'b1; entradaB=1'b1; select=3'b011;
		#1 entradaA=1'b1; entradaB=1'b1; select=3'b100;
		#1 entradaA=1'b0; entradaB=1'b1; select=3'b101;
		#1 entradaA=1'b1; entradaB=1'b0; select=3'b110;
	end
endmodule

		
