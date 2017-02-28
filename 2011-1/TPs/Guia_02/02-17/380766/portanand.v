//------------------------------
// Guia_02 - OR
// Guilherme Lucindo dos Santos
// 380766
//------------------------------

//------------
//--porta nand
//------------

module portanand (s, p, q);

output s;
input p, q;

assign s = ~(p & q);

endmodule // portanand

//--------------------
//-- porta or com nand
//--------------------

module portaor (s0, p, q);

output s0;
wire s1, s2;
input p, q;

portanand NAND1 (s1, p, p);
portanand NAND2 (s2, b, b);
portanand NAND3 (s0, s1, s2);

endmodule //portaor

//------------
//-- teste
//------------

module  testeportaor;

reg a, b;
wire s;

portaor OR1 (s, a, b);

initial begin:start
     a=0; b=0;
	  
end

initial begin:main
	$display("Guia 02 - Guilherme Lucindo - 380766");
	$display("teste porta OR");
	$display("\n s = ~(~a & ~b)\n");
	$monitor("%b = ~(~%a & ~%b)");
 #1   a=0; b=1;
 #1   a=1; b=0;
 #1   a=1; b=1;
 
 end 
 
 endmodule