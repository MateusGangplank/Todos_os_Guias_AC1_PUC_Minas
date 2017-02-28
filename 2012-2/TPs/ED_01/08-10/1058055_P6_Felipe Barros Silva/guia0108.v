//-----------------------------------
// Guia0108 - and com 4 entrada
// Nome: Felipe Barros Silva
// Matricula: 376508
//-----------------------------------

//-- criar module

module portaAnd (output s, input a, input b, input c,input d );
assign s = a & b & c & d;

endmodule

//-- criar teste de module
module testeAnd;

//--definir os dados
reg a, b, c, d;
wire s;

//--criar porta
portaAnd and1 (s, a, b, c, d );

//--prepara execução

initial begin: start
a=0; b=0; c=0; d=0;
end

//-- inicia execução
initial begin 

#1 $display ("guia0108 - Felipe Barros - 376508");
#1 $display ("tabela verdade de porta and com 4 entradas");
#1 $display ("a & b & c & d = s ");
#1 $monitor ("%b   %b   %b   %b   %b", a, b, c, d, s);
#1 a=0; b=0; c=0; d=0;
#1 a=0; b=0; c=0; d=1;
#1 a=0; b=0; c=1; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=0; b=1; c=0; d=0;
#1 a=0; b=1; c=0; d=1;
#1 a=0; b=1; c=1; d=0;
#1 a=0; b=1; c=1; d=1;
#1 a=1; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=0; c=1; d=0;
#1 a=1; b=0; c=1; d=1;
#1 a=1; b=1; c=0; d=0;
#1 a=1; b=1; c=0; d=1;
#1 a=1; b=1; c=1; d=0;
#1 a=1; b=1; c=1; d=1;

end //-- fim de execução

endmodule //-- fim de teste de module
