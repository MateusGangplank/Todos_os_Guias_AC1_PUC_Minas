// ---------------------
// Exercicio0009 - AND
// Nome: Thais Mairink
// Matricula: 441710
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module andgate (output s, input p, input q);
	assign s = p&q;
endmodule // and
 
// --------------------- 
// -- test andgate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
   reg   a,b,c; // definir registrador
   wire  s,g;    // definir conexao (fio)
// ------------------------- instancia 
   andgate AND1(g, a, b);
	andgate AND2(s, g, c);
	 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0;c=0;
	end 
	
	//---------------parte principal
initial begin:main
	$display("Exercicio09 - Thais Mairink - 441710");
	$display("Test AND 3 entradas");
	$display("\na & b & c  =  s\n");
   $monitor("%b & %b & %b  = %b", a, b, c, s);
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0; 
#1 a=1; b=0; c=1; 
#1 a=1; b=1; c=0; 
#1 a=1; b=1; c=1;

end

endmodule //AND 3 entradas

 