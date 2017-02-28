//--------------------
//Exercicio 03
//Luiz Marques de Oliveira
//417138
//--------------------


//----------------------
//-- XNOR gate
//----------------------

module xnorgate(output s, input a, input b);
assign s =  ~(a^b);
endmodule

//-------------------
//-- test xnorgate
//-------------------

module testxnorgate;
reg a,b;
wire s;

xnorgate XNOR1(s,a,b);
initial begin:start
a=0 ; b=0;
end

initial begin:main

$display("Exercicio 03 -Luiz Marques de Olveira");
$display("XNOR GATE");
$display("~(%b^%b = s");
$monitor("~(%b^%b  = %b  )",a,b,s );

	#1 a=0 ; b=0;
	#1 a=0 ; b=1;
	#1 a=1 ; b=0;
	#1 a=1 ; b=1;
	
	end
	
	endmodule // test xnorgate
