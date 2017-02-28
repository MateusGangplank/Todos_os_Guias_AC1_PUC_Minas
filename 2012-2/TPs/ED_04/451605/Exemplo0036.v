// --theldo tive duvida nos 2 primeiros e no ultimo
// --fiz o cir no logisim certinho mas meu verilog esta dando erro

// OBS.: FAVOR INDICAR A SITUACAO ONDE OCORREU ERRO.

// -------------------------
// Exemplo0036 � FULL ADDER
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// -------------------------
// full adder
// -------------------------

module fullAdder (output [2:0]s, output s3,
input [2:0]a,
input [2:0]b,
input carryIn);
// descrever por portas

wire h, j;

//FA FA1 (s[0], s3, a[0], b[0], j);
//FA FA2 (s[1], j, a[1], b[1], h);
//FA FA3 (s[2], h, a[2], b[2], carryIn);
FA FA1 (s[0], h, a[0], b[0], carryIn);
FA FA2 (s[1], j, a[1], b[1], h);
FA FA3 (s[2], s3, a[2], b[2], j);

endmodule // fullAdder

module FA (output s0, output s1, 
input x,
input y,
input c);

wire a, s, d, f, g;

xor XOR1 (a, x, y);
xor XOR2 (s0, a, c);

and AND1 (f, x, y);
and AND2 (d, x, c);
and AND3 (s, y, c);

or OR1 (g, s, d);
or OR2 (s1, g, f);

endmodule

module test_fullAdder;
// ------------------------- definir dados
reg [2:0] w;
reg [2:0] k;
reg carry;
wire l;
wire [2:0] soma;

fullAdder modulo (soma, l, w, k, carry);

	initial begin: start
      w = 3'b011;
	   k = 3'b001;
	   carry = 0;
	end

// ------------------------- parte principal
initial begin
$display("Exemplo0036 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test ALU�s full adder");

// projetar testes do modulo
#1 $display("%3b + %3b = %3b %3b",w,k,l,soma);
end
endmodule // test_fullAdder