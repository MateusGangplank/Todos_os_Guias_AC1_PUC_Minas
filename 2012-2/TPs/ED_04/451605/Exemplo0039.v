// --theldo tive duvida nos 2 primeiros e no ultimo
// --fiz o cir no logisim certinho mas meu verilog esta dando erro

// --- Exemplo00139 complemento de 2
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// -------------------------
// complemento de 2
// -------------------------

module compde2 (output s,
input a,
input b,
input c);
// descrever por portas

wire h, g, d, f;

xor XOR1 (h, c, b);
xor XOR2 (g, c, a);
xor XOR3 (d, a, b);

or OR1 (f, h, g);
or OR2 (s, d, f);

endmodule // compde2

module test_compde2;
// ------------------------- definir dados
reg x;
reg y;
reg k;
wire comp;

compde2 modulo (comp, x, y, k);

	initial begin: start
      x = 1;
	   y = 0;
	   k = 0;
	end

// ------------------------- parte principal
initial begin
$display("Exemplo0036 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test ALU’s compde2");

// projetar testes do modulo
#1 $display("%1b =? %1b =? %1b --> %1b (se igual 1 iguais se 0 diferentes",x,y,k,comp);
end
endmodule // test_compde2

