// -------------------------
// Exemplo0033 - 
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
	reg [1:0] op;
	wire [1:0] s1;
	wire [1:0] s2;
	wire [1:0] s0;
	wire [1:0] s;
	
	//Circuito simplificado do Exemplo0033(a).circ pela algebra de Boole
	orgate OR1(s1,x,y);
	andgate AND1(s2,x,y);
	xorgate XOR1(s,op,s1);
	xorgate XOR2(s0,op,s2);
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0033 - Andre Henriques Fernandes - 427386");
      $display("Test LU's module");
		x = 2'b00;      y = 2'b00;   op = 2'b00;
   	
		// projetar testes do modulo
		
		$monitor("%4b %4b %4b = %4b",op,x,y,s);
		#1 x = 2'b00; y = 2'b00; op = 2'b01;
		#1 x = 2'b00; y = 2'b11; op = 2'b01;
		#1 x = 2'b11; y = 2'b00; op = 2'b01;
		#1 x = 2'b11; y = 2'b11; op = 2'b01;
end
endmodule // test_f4