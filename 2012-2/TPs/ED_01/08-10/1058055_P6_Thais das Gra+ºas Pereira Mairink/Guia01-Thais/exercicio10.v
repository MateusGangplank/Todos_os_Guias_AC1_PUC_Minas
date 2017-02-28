// -------------------------
// Exercicio10 - OR
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//---------------
//--Porta OR
//---------------

module or_quatroEntradas (output s, input p, input q);

assign s = p | q;

endmodule    //or

//------------------------------------------------
//--test or 4 entradas, usando AND de 2 entradas
//-------------------------------------------------

module test_and_quatro;

//-----------------dados locais
    reg a, b, c, d;      //registradores
    wire s, t1, t2;              //conexao(fio)
    
//--------------------instancia
or_quatroEntradas  OR2 (t1, a, b);
or_quatroEntradas  OR3 (t2, c, d);
or_quatroEntradas  OR4 (s, t1, t2);

//--------------------preparacao
initial begin:start
a=0; b=0; c=0; d=0;

end

//---------------parte principal
initial begin:main
	$display("Exercicio010 - Thais Mairink - 441710");
	$display("Test OR 4 entradas");
	$display("\na  b  c  d =  s\n");
        $monitor("%b  %b  %b  %b = %b", a, b, c, d, s);
        
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

end

endmodule   //and
