// --------- exercicio 2 
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// --------------------- 
// --------------------- 
// -- XNORgate
// ---------------------
module xnorGate ( output s,
 input a, input b);
 assign s = (~(a^b));
 endmodule // xnor
// --------------------- 
// -- test nandgate 
// --------------------- 
module exercicio0001;

reg a, b;
wire s;

xnorGate xnor1 ( s, a, b );
// ------ Preparašao
initial begin:start
a=0;
b=0;
end 

// ------------------------- parte principal 
initial begin:main
$display("Exercicioo0003 - Mateus Cunha da Silva - 463624"); 
$display("Tabela "); 
$display("\n a ~^ b = s\n"); 
$monitor(" %b ~^ %b = %b ", a, b, s);
#1a=0; b=1;
#1a=1; b=0;
#1a=1; b=1;
end
endmodule//exercicio0001
