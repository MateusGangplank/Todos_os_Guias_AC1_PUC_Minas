// ---------------------
// Exercicio0010 - OR 
// Nome: Thais Mairink
// Matricula: 441710 
// ---------------------

// --------------------- 
// -- or gate 
// --------------------- 
 
module orgate (output s, input p, input q); 
	assign s = p|q; 
endmodule // or 
 
// --------------------- 
// -- test orgate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
   reg   a,b,c; // definir registrador 
   wire  s,g;    // definir conexao (fio) 
// ------------------------- instancia 
   orgate OR1(g, a, b);
	orgate OR3(s, g, c);
 
// ------------------------- preparacao 
   initial begin:start 
       a=0; b=0; c=0;
			 
   end 
	
	//---------------parte principal
initial begin:main
	$display("Exercicio09 - Thais Mairink - 441710");
	$display("Test OR 3 entradas");
	$display("\na | b | c  =  s\n");
   $monitor("%b | %b | %b  = %b", a, b, c, s);
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0; 
#1 a=1; b=0; c=1; 
#1 a=1; b=1; c=0; 
#1 a=1; b=1; c=1;

end

endmodule //OR 3 entradas

 