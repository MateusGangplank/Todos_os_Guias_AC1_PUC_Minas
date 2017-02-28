// --theldo tive duvida nos 2 primeiros e no ultimo
// --fiz o cir no logisim certinho mas meu verilog esta dando erro

// -------------------------
// Exemplo0036 � FULL ADDER
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// -------------------------
// subtracao
// -------------------------

module subtracao (output [2:0]s, output s3,
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

endmodule // subtracao

module FA (output s0, output s1,
input x,
input y,
input c);

wire a, s, d, f, g, notx, nota;

xor XOR1 (a, x, y);
xor XOR2 (s0, a, c);

not NOT1 (notx, x);
//not NOT2 (nota, a);        // CORRECAO
not NOT2 (nota, s0);

and AND1 (s, notx, y);
and AND2 (d, nota, c);

or OR1 (s1, s, d);

endmodule

module test_subtracao;
// ------------------------- definir dados
reg [2:0] w;
reg [2:0] k;
reg carry;
wire l;
wire [2:0] soma;

subtracao modulo (soma, l, w, k, carry);
FA FAx (soma[0], l, w[0], k[0], carry);

	initial begin: start
      w = 3'b011;
	   k = 3'b001;
//	   carry = 1'b1;      // CORRECAO
	   carry = 1'b0;
	end

// ------------------------- parte principal
initial begin
$display("Exemplo0036 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test ALU�s subtracao");

// projetar testes do modulo
#1 $display("%3b - %3b = %1b %3b",w,k,l,soma);
   $monitor("%3b - %3b = %1b %3b",w,k,l,soma);
#1 w=3'b001; k=3'b000; carry=1'b0;

end
endmodule // test_subtracao