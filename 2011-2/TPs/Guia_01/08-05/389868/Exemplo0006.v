// ---------
// Exemplo0006 - NAND
// Nome:Felipe Pacífico
// Matricula:389868
// -----------------
// -----------------
// -- NAND gate
module nandgate(output s, input p, input q);
assign s = ~(p&q);
endmodule // nandgate
// ------------
// -- test NAND gate
// ------------
module testenandgate;
// ----------------------- dados locais
reg a,b; //definir registrador
			//(variavel independente)
wire s;  //definir conexao(fio)
			//(variavel dependente)
// --------------- instancia
nandgate NAND1 (s,a,b);
// --------------- preparacao
initial begin: start
a=0;
b=0;
end
// -------------- parte principal
initial begin
$display("Exemplo0006 - Felipe Pacífico - 389868");
$display("Test AND gate");
$display("\n ~(a&b) = s\n");
a=0; b=0;
#1 $display("%b ~& %b = %b",a,b,s);
a=0; b=1;
#1 $display("%b ~& %b = %b",a,b,s);
a=1; b=0;
#1 $display("%b ~& %b = %b",a,b,s);
a=1; b=1;
#1 $display("%b ~& %b = %b",a,b,s); 			
end
endmodule // testnandgate			
