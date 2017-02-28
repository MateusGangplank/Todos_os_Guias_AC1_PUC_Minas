//------------------
// Exercicio_02
// Luiz Marques de Oliveira
// 417138
// -----------------

//--------------
//-- NOR GATE
//--------------

module norgate(output s, input a, input b);
assign  s = ~(a|b) ;
endmodule

//-----------------
//-- test nor gate
//-----------------


module testnorgate;
reg a, b ;
wire s;

norgate NOR1(s,a,b);
initial begin:start
a=0 ; b=0 ;
end


initial begin:main
$display("Exercicio_02 - Luiz Marques de olveira");
$display("NOR GATE");
$display( " ~(a|b) = s");
$monitor("~(%b|%b) = %b", a,b,s);

	#1 a=0 ; b=0;
	#1 a=0 ; b=1;
	#1 a=1 ; b=0;
	#1 a=1 ; b=1;
	
	end
	
	endmodule // test norgate


