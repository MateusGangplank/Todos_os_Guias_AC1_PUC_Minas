//-----------------------------------
// Guia0107 - xnor em expressão
// Nome: Felipe Barros Silva
// Matricula: 376508
//-----------------------------------

//-- criar module
module PortaOr (output s, input p, input q);
assign s= p | q;
endmodule

module PortaNot (output s1, input p1);
assign s1=~p1;
endmodule

module PortaAnd (output s2, input p2, input q2 );
assign s2= p2 & q2;
endmodule

//-- teste de module
module testeXor;

reg a, b;
wire s1,s2, s3, snot1, snot2;


PortaNot not1 (snot1, a);
PortaNot not2 (snot2, b);
PortaAnd and1 (s1, a, b);
PortaAnd and2 (s2,snot1, snot2);
PortaOr or1 (s3, s1, s2);


//-- prepara execução
initial begin: start
a=0; b=0;
end

//--inicia execução
initial begin

#1 $display ("guia0106 - Felipe Barros - 376508 ");
#1 $display ("expressao ab' & a'b ");
#1 $display ("a  b   ab  a'b'  s");
#1 $monitor ("%b  %b   %b     %b   %b", a, b, s1, s2, s3 );
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end //-- end expressão

endmodule //-- end execuçao
