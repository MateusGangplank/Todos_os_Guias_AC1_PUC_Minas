// -------------------------
// Exemplo0034 - 
// Nome: Andre Henriques Fernandes
// Matricula: 427386
// -------------------------
// -------------------------
// -------------------------

module notgate(output [1:0] s, input [1:0]a);

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
	reg [1:0] c1;
	reg [1:0] c2;
	wire [1:0] s1;
	wire [1:0] s2;
	wire [1:0] s3;
	wire [1:0] s4;
	wire [1:0] s5;
	wire [1:0] s6;
	wire [1:0] s7;
	wire [1:0] s;
	
	orgate OR1(s7,x,y);
	xorgate XOR1(s6,x,y);
	xorgate XOR2(s4,c2,s7);
	xorgate XOR3(s5,c2,s6);
	notgate NOT1(s3,c1);
	andgate AND1(s1,s3,s4);
	andgate AND2(s2,s5,c1);
	orgate OR2(s,s1,s2);
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0034 - Andre Henriques Fernandes - 427386");
      $display("Test LU's module");
		x = 2'b00;      y = 2'b00;    c1 = 2'b00;   c2 = 2'b00;
   	
		// projetar testes do modulo
		
		$monitor("%4b %4b %4b %4b = %4b",c1,c2,x,y,s);
		#1 x = 2'b00; y = 2'b00; c1 = 2'b01; c2 = 2'b10;
		#1 x = 2'b00; y = 2'b11; c1 = 2'b11; c2 = 2'b00;
		#1 x = 2'b11; y = 2'b00; c1 = 2'b10; c2 = 2'b01;
		#1 x = 2'b11; y = 2'b11; c1 = 2'b00; c2 = 2'b11;
end
endmodule // test_f4