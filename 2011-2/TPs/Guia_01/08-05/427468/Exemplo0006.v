// --------------------- 
// Exemplo0006 - nand 
// Nome: Ursula Rosa Monteiro de Castro 
// Matricula: 427468 
// --------------------- 
// --------------------- 
// -- nand gate 
// --------------------- 
module nandgate (output s, input p, input q); 
assign s = ~(p&q); 

endmodule      // nand 
// --------------------- 
// -- test nandgate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg  a,b;       // definir registrador 
wire  s;        // definir conexao (fio) 
// ------------------------- instancia 
nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;    // 4 valores binarios 
b=0;    // 4 valores binarios 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exemplo0006 - Ursula Rosa - 427468"); 
$display("Test nand gate"); 
$display("\n a ~& b = s\n"); 
a=0;  b=0; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=0;  b=1; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=1;  b=0; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=1;  b=1; 
#1 $display("%b ~& %b = %b", a, b, s);
end 
endmodule  // testnandgate 