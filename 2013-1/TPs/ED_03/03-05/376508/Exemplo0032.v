// -------------------------
// Exemplo0032 - F4
// Nome: Felipe Barros
// Matricula: 376508
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, output s1, input a, input b);
//-- descrever por portas
and and0 (s, a, b);
or or0 (s1, a, b);


endmodule // f4
module test_f4;

// ------------------------- definir dados

reg  x,y,  selecionar;
wire z, z1, n0, s0, s1;
f4 modulo (z, z1, x, y);
not not1 (n0, selecionar);
and and0 (s0, selecionar, z);
and and1 (s1, n0, z1);


// ------------------------- parte principal
initial begin
$display("Exemplo0032 - Felipe Barros  - 376508");
$display("Test LU's module");

x = 0; y = 0; selecionar =0;
// projetar testes do modulo
#1 $display("x  y   selecionar  resultante");
#1 $monitor("%b  %b     %b          %b  %b",x,y,selecionar, z, z1);
#1 x = 0; y = 0; selecionar =0;
#1 x = 0; y = 0; selecionar =1;
#1 x = 0; y = 1; selecionar =0;
#1 x = 0; y = 1; selecionar =1;
#1 x = 1; y = 0; selecionar =0;
#1 x = 1; y = 0; selecionar =1;
#1 x = 1; y = 1; selecionar =0;
#1 x = 1; y = 1; selecionar =1;


end
endmodule // test_f402