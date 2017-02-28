// ---------------------
// Guia 01 
// Nome: Marley Davidson Antonio Queiroz
// Matricula: 371706
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

	module xnorgate (saida,entrada1,entrada2,entrada3){
	output (saida);
	input (entrada1,entrada2,entrada3);
	assing saida = ~(entrada1 ^ entrada2 ^ entrada3 ^ entrada4)
	endmodule //xnorgate

module testxnor;

reg e1,e2,e3
wire s1;


xnorgate xnor1 (s1,e1,e2,e3,e4);
initial begin:start

e1=0; e2=0; e3=0; e4=0;
end
// parte principal do verilog
$display("^xercicio 01 - Porta XNOR");
$display("^quanão Logica !(a^b^c)");
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=0, e2=0, e3=0, e4=0;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=0, e2=0, e3=0, e4=1;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=0, e2=0, e3=1, e4=0;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=0, e2=0, e3=1, e4=1;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=0, e2=0, e3=0, e4=0;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=0, e2=1, e3=0, e4=1;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=0, e2=1, e3=1, e4=0;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=0, e2=1, e3=1, e4=1;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=1, e2=1, e3=0, e4=0;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=1, e2=0, e3=0, e4=1;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=1, e2=0, e3=1, e4=0;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=1, e2=0, e3=1, e4=1;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=1, e2=0, e3=0, e4=0;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=1, e2=0, e3=0, e4=1;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=1, e2=0, e3=1, e4=0;
$display("%b ^ %b ^ %b = %b \n",e1,e2,e3,e4,s);
e1=1, e2=1, e3=1, e4=1;;


end
endmodule

