// ---------------------
// Guia 01 
// Nome: Marley Davidson Antonio Queiroz
// Matricula: 371706
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

	module nandgate (saida,entrada1,entrada2,entrada3); //{ CORRIGIDO
//	output (saida);
	output saida;
//	input (entrada1,entrada2,entrada3);
 	input entrada1,entrada2,entrada3;
//	assing saida = ~(entrada1 & entrada2 & entrada3)
	assign saida = ~(entrada1 & entrada2 & entrada3);
	endmodule //nandgate

module testnand;

//reg e1,e2,e3
reg e1,e2,e3;
wire s1;


nandgate nand1 (s1,e1,e2,e3);
initial begin:start

e1=0; e2=0; e3=0;
end

// parte principal do verilog
initial begin     // CORRIGIDO
$display("&xercicio 01 - Porta NAND");
$display("&quan�o Logica !(a&b&c)");
$display("%b & %b & %b = %b \n",e1,e2,e3,s);
//e1=0, e2=0, e3=0;
e1=0; e2=0; e3=0;
$display("%b & %b & %b = %b \n",e1,e2,e3,s);
e1=0, e2=0, e3=1;
$display("%b & %b & %b = %b \n",e1,e2,e3,s);
e1=0, e2=1, e3=0;
$display("%b & %b & %b = %b \n",e1,e2,e3,s);
e1=1, e2=0, e3=0;
$display("%b & %b & %b = %b \n",e1,e2,e3,s);
e1=1, e2=1, e3=0;
$display("%b & %b & %b = %b \n",e1,e2,e3,s);
e1=1, e2=0, e3=1;
$display("%b & %b & %b = %b \n",e1,e2,e3,s);
e1=0, e2=1, e3=1;
$display("%b & %b & %b = %b \n",e1,e2,e3,s);
e1=1, e2=1, e3=1;

end
endmodule

