// -------------------------
// Exemplo0025 - Complemento de 2
// Nome: Thais Mairink 
// Matricula: 441710 
// ------------------------- 

// -------------------------
//  complemento de 2
// -------------------------

module  c1(output [2:0] s, input [2:0] e1);

not NOT1 (s[0], e1[0]);
not NOT2 (s[1], e1[1]);
not NOT3 (s[2], e1[2]);

endmodule

module c2(output [2:0] s, input [2:0] e1);

wire [2:0] p;

c1 A(p, e1);

assign s = p + 1;

endmodule

module test_c2;

reg [2:0] x;
wire [2:0] saida;

c2 B (saida, x);


// ------------------------- parte principal
	initial begin
		$display("Exemplo0025 - Thais Mairink - 441710");
		$display("Complemento de 2");
		
		#1 x = 3'b000; 
		
		$monitor ("%b  = %b  " ,x , saida);
		#1 x = 3'b000;
		#1 x = 3'b001;
		#1 x = 3'b001;
		#1 x = 3'b001;
		#1 x = 3'b000;
		#1 x = 3'b011;
		#1 x = 3'b000;
		#1 x = 3'b000;
	end
		
	endmodule // test_fullAdder






