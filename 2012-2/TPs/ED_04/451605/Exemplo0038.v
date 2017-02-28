// -------------------------
// Exemplo0036 – FULL ADDER
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// -------------------------
// compigual
// -------------------------

module compigual (output s,
input a,
input b,
input c);
// descrever por portas

wire h, g, d, f;

xnor XNOR1 (h, c, b);
xnor XNOR2 (g, c, a);
xnor XNOR3 (d, a, b);

and AND1 (f, h, g);
and AND2 (s, d, f);

endmodule // compigual

module test_compigual;
// ------------------------- definir dados
reg x;
reg y;
reg k;
wire comp;

compigual modulo (comp, x, y, k);

	initial begin: start
      x = 1;
	   y = 0;
	   k = 0;
	end

// ------------------------- parte principal
initial begin
$display("Exemplo0036 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test ALU’s compigual");

// projetar testes do modulo
#1 $display("%1b =? %1b =? %1b --> %1b (se igual 1 iguais se 0 diferentes",x,y,k,comp);
end
endmodule // test_compigual