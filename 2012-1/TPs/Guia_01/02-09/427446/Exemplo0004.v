//--------------------------------------
//Exemplo0004 - OR
//Nome: Mateus Guilherme do Carmo Cruz
//Matr�cula: 427446
//---------------------------------------

//------------------
//-- or gate
//------------------

module orgate(output s,
					input p,q);
	assign s = p | q;
endmodule //orgate

//----------------
//-- test or gate
//----------------

module testorgate;
//------------- dados locais
	reg a,b; //definir registrador
	wire s; //definir conex�o(fio)
	
//------------------- instancia
	orgate OR1(s,a,b);
//-------------------- prepara��o
	initial begin:start
			//atribui��o simult�nea
			//dos valores iniciais
		a=0;b=0;
	end
//--------------------- parte principal

	initial begin
		$display("Exemplo0004 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test OR gate");
		$display("\na | b = s\n");
		a=0;b=0;
		#1	$display("%b | %b = %b",a,b,s);
			a=0;b=1;
		#1	$display("%b | %b = %b",a,b,s);
			a=1;b=0;
		#1	$display("%b | %b = %b",a,b,s);
			a=1;b=1;
		#1	$display("%b | %b = %b",a,b,s);
	end

endmodule //testorgate