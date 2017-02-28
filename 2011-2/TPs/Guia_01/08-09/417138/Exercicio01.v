//----------------------
// Exercicio 01 - nand
// Nome : Luiz marques de Oliveira
// Matricula: 417138
//---------------------- 

//----------------
//-- nand gate
//----------------

module nandgate (output s, input a, input b);
assign s =  ~(a&b) ;
endmodule


//-----------------
//-- test nandgate
//-----------------

module testnandgate;
reg a,b;
wire s;

nandgate NAND1(s,a,b);
initial begin:start
	a=0;
	b=0;
	
	end
	
	
	initial begin:main
	$display("Exercicio 01 - Luiz Marques de Oliveira");
	$display("Test NAND gate");
	$display(" ( ~(a  & b) ) = s");
	$monitor(" ( ~(%b & %b) = %b )", a,b,s);
	
	#1 a=0 ; b=0;
	#1 a=0 ; b=1;
	#1 a=1 ; b=0;
	#1 a=1 ; b=1;
	
	end
	
	endmodule // test nandgagte