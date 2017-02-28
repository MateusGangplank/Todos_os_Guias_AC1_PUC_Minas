// Exemplo0005 - XOR
// Nome: Vitor Angelo Lima
// Matricula: 451621

module xorgate (output [0:3]s, input [0:3]p, input [0:3]q);
	assign s = p ^ q;
endmodule

module testxorgate;
	reg [0:3] a, b;
	wire [0:3] s;
	xorgate XNOR1 (s, a, b);

	initial begin:start
		a=4'b0011;
		b=4'b0101;
	end

	initial begin:main
		$display("Exemplo 0005 - Vitor Angelo Lima - 451621");
		$display("Test XOR gate");
		$display("\na ^ b = s\n");
		$monitor("%b ^ %b = %b", a, b, s);
		#1 a=0; b=0;
		#1 a=4'b0010; b=4'b0001;
		#1 a=4'd1;	b=3;
		#1 a=4'o5;	b=2;
		#1 a=4'hA;	b=3;
		#1 a=4'h9;	b=4'o3;
	end
endmodule


