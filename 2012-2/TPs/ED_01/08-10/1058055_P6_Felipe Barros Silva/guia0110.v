//-----------------------------------
// Guia0110 - or com 4 entrada e outros modulos or com 2 entradas
// Nome: Felipe Barros Silva
// Matricula: 376508
//-----------------------------------

//-- criar module

module portaOr (output s, input a, input b, input c,input d );
assign s = a | b | c | d;

endmodule

//-- criar outro module  porta or  com 2 entrada
module portaOr1 (output s1, input a1, input b1);
assign s1= a1 | b1;

endmodule

//-- criar teste de module
module testeOr;

//--definir os dados
reg a, b, c, d, a1, b1, c1, d1;
wire s, s1, s2, s3;

//--criar porta
portaOr or1 (s, a, b, c, d );
portaOr1 or2 (s1, a1, b1);
portaOr1 or3 (s2, c1, d1);
portaOr1 or4 (s3, s1, s2);

//--prepara execução

initial begin: start
a=0; b=0; c=0; d=0;
end

//-- inicia execução
initial begin 

#1 $display ("guia0110 - Felipe Barros - 376508");
#1 $display ("tabela verdade de porta or com 4 entradas e outro modulo com 2 entrada de or");
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
