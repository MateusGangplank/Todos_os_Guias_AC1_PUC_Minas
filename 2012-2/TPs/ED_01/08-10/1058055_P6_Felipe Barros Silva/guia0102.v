//-----------------------------------
// Guia0102 - NOR
// Nome: Felipe Barros Silva
// Matricula: 376508
//-----------------------------------

//---------------------------------
//criar module para porta de nor
//---------------------------------

module norPorta (output s, input p, input q );
assign s = ~(p | q);

endmodule //fim de module


//--teste de module

module PortaTeste;

//----definir dados
reg a, b;
wire e;

//---- criar porta de nor
norPorta nor1 (e, a, b);

//---prepara para Execução

initial begin: start
a=0; b=0;

end //--fim de perparação

//--inicia a execução

initial begin

#1 $display ("teste de porta nor" );
#1 $display ("a |  b = e" );
#1 $monitor ("%b |  %b = %b", a, b, e);
#1	a=0;  b=0;
#1	a=0;  b=1;
#1	a=1;  b=0;
#1	a=1;  b=1;
	
end

endmodule //--fim de module de teste	
