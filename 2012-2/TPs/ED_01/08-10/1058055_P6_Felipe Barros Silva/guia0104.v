//-----------------------------------
// Guia0104 - NAND usando propriedade de morgan
// Nome: Felipe Barros Silva
// Matricula: 376508
//-----------------------------------


//-- criar module

module portaMorganNand (output s, input p, input q);
assign s= ~p | ~q;

endmodule

//-- criar teste de module

module testeMorgan;

reg a, b;
wire s;

//-- criar porta
portaMorganNand nandmorgan (s, a, b);

//-- prepara execução
initial begin: start
a=0; b=0;

end

//--inicia execução

initial begin

#1 $display ("guia0104 - Felipe Barros - 376508");
#1 $display ("tabela verdade NAND em propriedade de Morgan");
#1 $display ("~a |  ~b  = s" );
#1 $monitor (" %b |  %b =  %b ", a, b, s );
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;

end //-- fim de execução

endmodule //-- fim de teste de module