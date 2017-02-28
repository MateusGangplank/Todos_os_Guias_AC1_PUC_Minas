// ---------
// Exemplo00010 - OR
// Nome:Felipe Pacífico
// Matricula:389868
// -----------------
// -----------------
// -- OR gate
module orgate(output s, input p, input q, input r);
assign s = ~(~p & ~q & ~r);
endmodule // orgate
// ------------
// -- test OR gate
// ------------
module testeorgate;
// ----------------------- dados locais
reg a,b,c; //definir registrador
			//(variavel independente)
wire s;  //definir conexao(fio)
			//(variavel dependente)
// --------------- instancia
orgate OR1 (s,a,b,c);
// --------------- preparacao
initial begin: start
a=0;
b=0;
end
// -------------- parte principal
initial begin
$display("Exemplo00010 - Felipe Pacífico - 389868");
$display("Test OR gate");
$display("\n~(a ~& b ~& c = s\n");
a=0; b=0; c=0;
#1 $display("%b ~& %b ~& %b = %b",a,b,c,s);
a=0; b=0; c=1;
#1 $display("%b ~& %b ~& %b = %b",a,b,c,s);
a=0; b=1; c=0;
#1 $display("%b ~& %b ~& %b = %b",a,b,c,s);
a=0; b=1; c=1;
#1 $display("%b ~& %b ~& %b = %b",a,b,c,s);
a=1; b=0; c=0;
#1 $display("%b ~& %b ~& %b = %b",a,b,c,s);
a=1; b=0; c=1;
#1 $display("%b ~& %b ~& %b = %b",a,b,c,s);
a=1; b=1; c=0;
#1 $display("%b ~& %b ~& %b = %b",a,b,c,s);
a=1; b=1; c=1;
#1 $display("%b ~& %b ~& %b = %b",a,b,c,s); 			
end
endmodule // testorgate			
