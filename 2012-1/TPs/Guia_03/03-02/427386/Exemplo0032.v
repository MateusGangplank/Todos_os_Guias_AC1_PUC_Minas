// -------------------------
// Exemplo0032 - 
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

module and3(output [1:0] s,
                    input  [1:0] a,
                    input  [1:0] b,
                    input  [1:0] c);
	wire [1:0] x;
	andgate AND1(x,a,b);
	andgate AND2(s,x,c);
endmodule //and3

module orgate(output [1:0] s,
                    input  [1:0] a,
                    input  [1:0] b);
	assign s = a | b;
endmodule //orgate

module test_f4;
// ------------------------- definir dados
	reg [1:0] x;
	reg [1:0] y;
	reg [1:0] op;
	wire [1:0] s1;
	wire [1:0] s2;
	wire [1:0] s3;
	wire [1:0] s4;
	wire [1:0] s;
	
	orgate OR1(s4,x,y);
	and3 AND1(s3,x,y,op);
	notgate NOT1(s2,op);
	andgate AND2(s1,s4,s2);
	orgate OR2(s,s1,s3);
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0032 - Andre Henriques Fernandes - 427386");
      $display("Test LU's module");
		x = 2'b00;      y = 2'b00;     op = 2'b00;
   	
		// projetar testes do modulo
		
		$monitor("%4b %4b %4b = %4b",op,x,y,s);
		#1 x = 2'b00; y = 2'b00; op = 2'b01;
		#1 x = 2'b00; y = 2'b11; op = 2'b01;
		#1 x = 2'b11; y = 2'b00; op = 2'b01;
		#1 x = 2'b11; y = 2'b11; op = 2'b01;
end
endmodule // test_f4