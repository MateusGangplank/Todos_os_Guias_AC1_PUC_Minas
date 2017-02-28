//--------------------------------------
//Exemplo0003 - AND
//Nome: Rafael Guimaraes de Sousa
//Matr�cula: 451607
//---------------------------------------

//------------------
//-- and gate
//------------------

module andgate(output s,
					input p,
					input q);
	assign s = p & q;
endmodule //andgate

//----------------
//-- test and gate
//----------------

module testandgate;
//------------- dados locais
	reg a,b; //definir registrador
	wire s; //definir conex�o(fio)
	
//------------------- instancia
	andgate AND1(s,a,b);
//-------------------- prepara��o
	initial begin:start
			//atribui��o simult�nea
			//dos valores iniciais
		a=0;b=0;
	end
//--------------------- parte principal

	initial begin
		$display("Exemplo0003 - Rafael Guimaraes de Sousa - 451607");
		$display("Test AND gate");
		$display("\na & b = s\n");
		a=0;b=0;
		#1	$display("%b & %b = %b",a,b,s);
			a=0;b=1;
		#1	$display("%b & %b = %b",a,b,s);
			a=1;b=0;
		#1	$display("%b & %b = %b",a,b,s);
			a=1;b=1;
		#1	$display("%b & %b = %b",a,b,s);
	end

endmodule //testnotgate