// ---------------------
// Guia 01 
// Nome: Marley Davidson Antonio Queiroz
// Matricula: 371706
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

	module norgate (saida,entrada1,entrada2,entrada3){
	output (saida);
	input (entrada1,entrada2,entrada3);
	assing saida = ~(entrada1 | entrada2 | entrada3)
	endmodule //norgate

module testnor;

reg e1,e2,e3
wire s1;


norgate nor1 (s1,e1,e2,e3);
initial begin:start

e1=0; e2=0; e3=0;
end
// parte principal do verilog
$display("Exercicio 02 - Porta NOR");
$display("Equanão Logica !(a&b&c)");
$display("%b E %b E %b = %b \n",e1,e2,e3,s);
e1=0, e2=0, e3=0;
$display("%b E %b E %b = %b \n",e1,e2,e3,s);
e1=0, e2=0, e3=1;
$display("%b E %b E %b = %b \n",e1,e2,e3,s);
e1=0, e2=1, e3=0;
$display("%b E %b E %b = %b \n",e1,e2,e3,s);
e1=1, e2=0, e3=0;
$display("%b E %b E %b = %b \n",e1,e2,e3,s);
e1=1, e2=1, e3=0;
$display("%b E %b E %b = %b \n",e1,e2,e3,s);
e1=1, e2=0, e3=1;
$display("%b E %b E %b = %b \n",e1,e2,e3,s);
e1=0, e2=1, e3=1;
$display("%b E %b E %b = %b \n",e1,e2,e3,s);
e1=1, e2=1, e3=1;

end
endmodule

