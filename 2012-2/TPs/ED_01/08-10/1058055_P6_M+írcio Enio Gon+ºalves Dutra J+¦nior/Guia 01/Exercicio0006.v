// --------------------- 
// Exercicio0006 - XOR 
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// --------------------- 
// -- xor gate 
// --------------------- 
 
module xorgate (output s, input p, input q); 
	assign s = ((~p)*q)+(p*(~q)); 
endmodule // xor 
 
// --------------------- 
// -- test xorgate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
   reg   a,b; // definir registrador 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   xorgate XOR1 (s, a, b); 
 
// ------------------------- preparacao 
   initial begin:start 
            a=0;
            b=0; 
   end 
 
// ------------------------- parte principal 
   initial begin:main 
         $display("Exercicio0006 - Marcio Enio G Dutra Junior - 441698"); 
         $display("Test xor gate"); 
         $display("\n(~a)*b+a*(~b)  =  s\n"); 
 	#1    $monitor("(~%b)*%b+%b*(~%b)  =  %b", a, b, a, b, s); 
	#1		a=0; b=1;
 	#1    a=1; b=0;
 	#1    a=1; b=1;

 
 end 
 
endmodule // testxorgate