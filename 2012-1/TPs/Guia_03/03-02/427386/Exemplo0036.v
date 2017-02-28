// -------------------------
// Exemplo0036 -
// Nome: Andre Henriques Fernandes
// Matricula: 427386
// -------------------------
// -------------------------
// -------------------------

module xnorgate(output [1:0] s, input [1:0] a, input [1:0] b);

	assign s = ~(a^b);

endmodule
module notgate (output [1:0] s, input [1:0] a);

       assign s = ~a;

endmodule

module andgate(output [1:0] s,
                    input  [1:0] a,
                    input  [1:0] b);
	assign s = a & b;
endmodule //andgate

module orgate(output [1:0] s,
                    input  [1:0] a,
                    input  [1:0] b);
	assign s = a | b;
endmodule //orgate

module xorgate(output [1:0] s,
                    input  [1:0] a,
                    input  [1:0] b);
	assign s = a^b;

endmodule //xorgate

module test_f4;
// ------------------------- definir dados
	reg [1:0] x;
	reg [1:0] y;
	reg [1:0] c;
	wire [1:0] s1;
	wire [1:0] s2;
	wire [1:0] s3;
	wire [1:0] s4;
	wire [1:0] s5;
	wire [1:0] s;
	
	xorgate XOR1(s3,x,y);
	xnorgate XNOR1(s4,x,y);
	andgate AND1(s1,s3,c);
	notgate NOT1(s5,c);
	andgate AND2(s2,s4,s5);
	orgate OR1(s,s1,s2);

	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0036 - Andre Henriques Fernandes - 427386");
      $display("Test LU's module");
		x = 2'b00;      y = 2'b00;  c = 2'b00;
   	
		// projetar testes do modulo
		
		$monitor("%4b %4b %4b = %4b",c,x,y,s);
		#1 x = 2'b00; y = 2'b00; c = 2'b01;
		#1 x = 2'b00; y = 2'b11; c = 2'b11;
		#1 x = 2'b11; y = 2'b00; c = 2'b10;
		#1 x = 2'b11; y = 2'b11; c = 2'b00;
end
endmodule // test_f4