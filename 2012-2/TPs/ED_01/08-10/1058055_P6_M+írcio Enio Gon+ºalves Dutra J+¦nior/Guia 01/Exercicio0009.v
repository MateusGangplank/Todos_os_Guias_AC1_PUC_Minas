// --------------------- 
// Exercicio0009 - AND 
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
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
   reg   a,b,c,d; // definir registrador 
   wire  s,g,h;    // definir conexao (fio) 
// ------------------------- instancia 
   andgate AND1(g, a, b);
	andgate AND2(h, c, d);
	andgate AND3(s, g, h);
 
// ------------------------- preparacao 
   initial begin:start 
            a=0;
            b=0;
				c=0;
				d=0; 
   end 
 
// ------------------------- parte principal 
   initial begin:main 
         $display("Exercicio0009 - Marcio Enio G Dutra Junior - 441698"); 
         $display("Test and gate"); 
         $display("\np & q & r & o  =  s\n"); 
 	#1    $monitor("%b & %b & %b & %b  =  %b", a, b, c, d, s); 
	#1		a=0; b=0; c=0; d=1;
	#1		a=0; b=0; c=1; d=0;
	#1		a=0; b=0; c=1; d=1;
	#1		a=0; b=1; c=0; d=0;
	#1		a=0; b=1; c=0; d=1;
	#1		a=0; b=1; c=1; d=0;
	#1		a=0; b=1; c=1; d=1;
	#1		a=1; b=0; c=0; d=0;
	#1		a=1; b=0; c=0; d=1;
	#1		a=1; b=0; c=1; d=0;
	#1		a=1; b=0; c=1; d=1;
	#1		a=1; b=1; c=0; d=0;
	#1		a=1; b=1; c=0; d=1;
	#1		a=1; b=1; c=1; d=0;
	#1		a=1; b=1; c=1; d=1;

 
 end 
 
endmodule // testandgate