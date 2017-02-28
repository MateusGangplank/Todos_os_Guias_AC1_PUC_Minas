// Projetar e simular LU
// Wadson Ferreira
// 460631

module AND(output s, input a, input b);
	and A1(s,a,b);
endmodule

module OR(output s, input a, input b);
	or O1(s,a,b);
endmodule

module LU(output s, input a, input b, input select);
	wire and1;
	wire or1;
	AND A1(and1,a,b);
	OR O1(or1,a,b);
	assign s = (select==0) ? and1 : or1;
endmodule

module teste;
	wire saida;
	reg entradaA,entradaB;
	reg select;
	LU L1(saida,entradaA,entradaB,select);
	initial begin
		$display("\nWadson Ferreira - 460631\n0=AND 1=OR");
		#1 entradaA=1'b0; entradaB=1'b0; select=1'b0;
		   $monitor("%b (%b) %b = %b",entradaA,select,entradaB,saida);
		#1 entradaA=4'b0; entradaB=4'b1; select=1'b0;
		#1 entradaA=4'b1; entradaB=4'b0; select=1'b0;
		#1 entradaA=4'b1; entradaB=4'b1; select=1'b0;
		#1 entradaA=4'b0; entradaB=4'b0; select=1'b1;
		#1 entradaA=4'b0; entradaB=4'b1; select=1'b1;
		#1 entradaA=4'b1; entradaB=4'b0; select=1'b1;
		#1 entradaA=4'b1; entradaB=4'b1; select=1'b1;
	end
endmodule
		
