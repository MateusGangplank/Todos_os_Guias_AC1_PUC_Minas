//-----------------------------------
// Guia0103 - XNOR
// Nome: Felipe Barros Silva
// Matricula: 376508
//-----------------------------------


//-- criar module
module portaNxor (output s, input p, input q );

assign s= ~(p^q);

endmodule

//-- teste de module
module testeNxor;

reg a, b;
wire s;

//-- criar porta
portaNxor xnor1 (s, a, b);


//--prepara para execução

initial begin: start
a=0;  b=0;
end //-- fim

//-- inicia execução

initial begin
#1 $display ("guia0103 - Felipe Barros - 376508");
#1 $display ("teste tabela-verdade nxor");
#1 $display ("a ^ b  =  s");
#1 $monitor ("%b  ^ %b  = %b", a, b, s );
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;

end

endmodule //-- fim de teste



