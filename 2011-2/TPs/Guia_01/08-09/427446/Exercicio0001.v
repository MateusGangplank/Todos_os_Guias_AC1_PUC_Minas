//-------------------------------------------------
// Exerc�cio0001 - NAND
// Nome: Mateus Guilherme do Carmo Cruz
// Matr�cula: 427446
//-------------------------------------------------

//----------
// NAND gate
// -----------

module nandgate(output s, input a, input b);
	assign s = ~(a&b);
endmodule //nand

module runnandgate();
	reg a, b; //registradores
	wire s;	//conex�o(fio)

//-------instancia
	nandgate NAND1 (s,a,b);
//----------------prepara�ao
initial begin:start
	a=0;b=0;
end

//--------------parte principal
	initial begin
		$display("Exerc�cio0001 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Executa NAND gate.");
		$display("\na & b = s\n");
		a=0;b=0;
	#1 $display("%b & %b = %b",a,b,s);
		a=0;b=1;
	#1 $display("%b & %b = %b",a,b,s);
		a=1;b=0;
	#1 $display("%b & %b = %b",a,b,s);
		a=1;b=1;
	#1 $display("%b & %b = %b",a,b,s);
		
	end
	
endmodule //runnandgate