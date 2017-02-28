//--------------------------------------
//Exemplo0003 - AND
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
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
	wire s; //definir conexão(fio)
	
//------------------- instancia
	andgate AND1(s,a,b);
//-------------------- preparação
	initial begin:start
			//atribuição simultânea
			//dos valores iniciais
		a=0;b=0;
	end
//--------------------- parte principal

	initial begin
		$display("Exemplo0003 - Mateus Guilherme do Carmo Cruz - 427446");
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