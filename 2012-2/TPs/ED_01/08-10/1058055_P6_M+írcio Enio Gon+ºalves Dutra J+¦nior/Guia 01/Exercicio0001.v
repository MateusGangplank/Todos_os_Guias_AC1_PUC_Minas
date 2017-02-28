// --------------------- 
// Exercicio0001 - NAND 
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// --------------------- 
// -- nand gate 
// --------------------- 
 
module nandgate (output s, input p, input q); 
	assign s = ~(p&q); 
endmodule // nand 
 
// --------------------- 
// -- test nandgate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
   reg   a,b; // definir registrador 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   nandgate NAND1 (s, a, b); 
 
// ------------------------- preparacao 
   initial begin:start 
            a=0;
            b=0; 
   end 
 
// ------------------------- parte principal 
   initial begin:main 
         $display("Exercicio0001 - Marcio Enio G Dutra Junior - 441698"); 
         $display("Test nand gate"); 
         $display("\n~(a & b)  =  s\n"); 
 	#1    $display("~(%b & %b)  =  %b", a, b, s); 
			a=0; b=1;
 	#1    $display("~(%b & %b)  =  %b", a, b, s); 
			a=1; b=0;
 	#1    $display("~(%b & %b)  =  %b", a, b, s); 
			a=1; b=1;
 	#1    $display("~(%b & %b)  =  %b", a, b, s); 
 
 end 
 
endmodule // testnandgate