// ---------
// Exemplo0007 - NOR
// Nome:Rafael Lopes Barbosa
// Matricula:435052
// -----------------
// -----------------
// -- NOR gate
module norgate(output s, input p, input q);
assign s = ~(p|q);
endmodule // norgate
// ------------
// -- test NOR gate
// ------------
module testenorgate;
// ----------------------- dados locais
reg a,b; //definir registrador
			//(variavel independente)
wire s;  //definir conexao(fio)
			//(variavel dependente)
// --------------- instancia
norgate NOR1 (s,a,b);
// --------------- preparacao
initial begin: start
a=0;
b=0;
end
// -------------- parte principal
initial begin
$display("Exemplo0007 - Rafael Lopes Barbosa - 435052");
$display("Test NOR gate");
$display("\na ~| b = s\n");
a=0; b=0;
#1 $display("%b ~| %b = %b",a,b,s);
a=0; b=1;
#1 $display("%b ~| %b = %b",a,b,s);
a=1; b=0;
#1 $display("%b ~| %b = %b",a,b,s);
a=1; b=1;
#1 $display("%b ~| %b = %b",a,b,s); 			
end
endmodule // testnorgate			
