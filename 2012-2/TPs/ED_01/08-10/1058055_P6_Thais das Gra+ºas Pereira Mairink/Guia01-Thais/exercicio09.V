// -------------------------
// Exercicio09 - AND
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//---------------
//--Porta AND
//---------------

module and_quatroEntradas (output s, input p, input q);


assign s = p & q;


endmodule    //and

//------------------------------------------------
//--test and 4 entradas, usando AND de 2 entradas
//-------------------------------------------------

module test_and_quatro;

//-----------------dados locais
    reg a, b, c, d;      //registradores
    wire s, temp1, temp2;              //conexao(fio)

//--------------------instancia

and_quatroEntradas  AND2 (temp1, a, b);
and_quatroEntradas  AND3 (temp2, c, d);
and_quatroEntradas  AND4 (s, temp1, temp2);

//--------------------preparacao
initial begin:start
a=0; b=0; c=0; d=0;

end

//---------------parte principal
initial begin:main
	$display("Exercicio09 - Thais Mairink - 441710");
	$display("Test AND 4 entradas");
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
