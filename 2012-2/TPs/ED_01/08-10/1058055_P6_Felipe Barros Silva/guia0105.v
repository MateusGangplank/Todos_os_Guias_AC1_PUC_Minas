//-----------------------------------
// Guia0105 - Nor usando propriedade de morgan
// Nome: Felipe Barros Silva
// Matricula: 376508
//-----------------------------------

//-- criar module

module portaNorMorgan (output s, input p, input q);
assign s= ~p & ~q;

endmodule


//-- criar teste de module

module testeNorMorgan;
reg a, b;
wire s;

//-- criar porta
portaNorMorgan norMorgan (s, a, b);

//-- prepara execu��o

initial begin: start
a=0; b=0;
end

//-- inicia execu��o

initial begin

#1 $display ("guia0105 - Felipe Barros - 376508");
#1 $display ("porta Nor em propriedade de Morgan");
#1 $display ("~a &  ~b = s");
#1 $monitor ("%b  &  %b  = %b", a, b, s);
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end //-- fim de execu��o

endmodule //-- fim de module