// -------------------------
// Exercicio06 - XOR (a'b+ab')
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//------------
//-- xor 
//-------------

module xor_expressao (output s, input p, input q);

assign s = ((~p)&q)|(p&(~q));

endmodule //xor

//-----------------
//---test xor
//----------------

module testxor;
//-----------dados locais
	reg a, b;  //definir registradores
	wire s;    //definir conexao(fio)

//---------------instancia
xor_expressao XOR2 (s, a, b);

//--------------preparacao
initial begin:start
	a=0;
	b=0;			//inicializacao simultanea
end

//---------------parte principal
initial begin:main
	$display("Exercicio06 - Thais Mairink - 441710");
	$display("Test xor ");
	$display("\n ((~a)&b)|(a&(~b) = s\n");
	$monitor("%b ^ %b = %b", a,b,s);
#1	a=0; b=0; 						//valores decimais
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;

end

endmodule //testxorgate	
