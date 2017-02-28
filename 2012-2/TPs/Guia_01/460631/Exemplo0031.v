// Projetar e simular LU
// Wadson Ferreira
// 460631

module AND(output[3:0] s, input[3:0] a, input[3:0] b);
	and A1(s[0],a[0],b[0]);
	and A2(s[1],a[1],b[1]);
	and A3(s[2],a[2],b[2]);
	and A4(s[3],a[3],b[3]);
endmodule

module OR(output[3:0] s, input[3:0] a, input[3:0] b);
	or O1(s[0],a[0],b[0]);
	or O2(s[1],a[1],b[1]);
	or O3(s[2],a[2],b[2]);
	or O4(s[3],a[3],b[3]);
endmodule

module LU(output[7:0] s, input[3:0] a, input[3:0] b);
	wire[3:0] and1;
	wire[3:0] or1;
	wire[7:0] s;
	AND A1(and1,a,b);
	OR O1(or1,a,b);
	assign s = {and1,or1};
endmodule

module teste;
	wire[7:0] saida;
	reg[3:0] entradaA,entradaB;
	LU L1(saida,entradaA,entradaB);
	initial begin
		$display("\nWadson Ferreira - 460631");
		#1 entradaA=4'b0000; entradaB=4'b0000;
		   $monitor("%4b - %4b = %4b_%4b",entradaA,entradaB,saida[7:4],saida[3:0]);
		#1 entradaA=4'b0110; entradaB=4'b0011;
		#1 entradaA=4'b1111; entradaB=4'b0011;
		#1 entradaA=4'b1000; entradaB=4'b0001;
		#1 entradaA=4'b1010; entradaB=4'b0101;
	end
endmodule
		
