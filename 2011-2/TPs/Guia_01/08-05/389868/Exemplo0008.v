// ---------
// Exemplo0008 - XNOR
// Nome:Felipe Pacífico
// Matricula:389868
// -----------------
// -----------------
// -- XNOR gate
module xnorgate(output s, input p, input q);
assign s = ~(p^q);
endmodule // xnorgate
// ------------
// -- test XNOR gate
// ------------
module testexnorgate;
// ----------------------- dados locais
reg a,b; //definir registrador
			//(variavel independente)
wire s;  //definir conexao(fio)
			//(variavel dependente)
// --------------- instancia
xnorgate XNOR1 (s,a,b);
// --------------- preparacao
initial begin: start
a=0;
b=0;
end
// -------------- parte principal
initial begin
$display("Exemplo0008 - Felipe Pacífico - 389868");
$display("Test XNOR gate");
$display("\na ~^ b = s\n");
a=0; b=0;
#1 $display("%b ~^ %b = %b",a,b,s);
a=0; b=1;
#1 $display("%b ~^ %b = %b",a,b,s);
a=1; b=0;
#1 $display("%b ~^ %b = %b",a,b,s);
a=1; b=1;
#1 $display("%b ~^ %b = %b",a,b,s); 			
end
endmodule // testxnorgate			
