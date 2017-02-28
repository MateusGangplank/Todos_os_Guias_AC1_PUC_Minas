// ---------
// Exemplo0009 - AND
// Nome:Felipe Pacífico
// Matricula:389868
// -----------------
// -----------------
// -- AND gate
module andgate(output s, input p, input q, input r);
assign s = ~(~p | ~q | ~r);
endmodule // andgate
// ------------
// -- test AND gate
// ------------
module testeandgate;
// ----------------------- dados locais
reg a,b,c; //definir registradand
			//(variavel independente)
wire s;  //definir conexao(fio)
			//(variavel dependente)
// --------------- instancia
andgate OR1 (s,a,b,c);
// --------------- preparacao
initial begin: start
a=0;
b=0;
end
// -------------- parte principal
initial begin
$display("Exemplo0009 - Felipe Pacífico - 389868");
$display("Test AND gate");
$display("\n(a ~| b ~| c = s\n");
a=0; b=0; c=0;
#1 $display("%b ~| %b ~| %b = %b",a,b,c,s);
a=0; b=0; c=1;
#1 $display("%b ~| %b ~| %b = %b",a,b,c,s);
a=0; b=1; c=0;
#1 $display("%b ~| %b ~| = %b",a,b,c,s);
a=0; b=1; c=1;
#1 $display("%b ~| %b ~| %b = %b",a,b,c,s);
a=1; b=0; c=0;
#1 $display("%b ~| %b ~| %b = %b",a,b,c,s);
a=1; b=0; c=1;
#1 $display("%b ~| %b ~| %b = %b",a,b,c,s);
a=1; b=1; c=0;
#1 $display("%b ~| %b ~| %b = %b",a,b,c,s);
a=1; b=1; c=1;
#1 $display("%b ~| %b ~| %b = %b",a,b,c,s); 			
end
endmodule // testandgate			
