// ---------------------
// Exercicio0011 - ZERO
// Nome: Thais Mairink 
// Matricula: 441710 
// ---------------------
 
// --------------------- 
// -- zero
// --------------------- 
 
module zero (output s, input[7:0] p); 
	assign s = ~(p[0]|p[1]|p[2]|p[3]|p[4]|p[5]|p[6]|p[7]); 
endmodule // zero

// ---------------------
// -- test zero
// ---------------------
module testzero; 
// ------------------------- dados locais
   reg[7:0]   a; // definir registrador
   wire  s;    // definir conexao (fio)
// ------------------------- instancia
   zero ZERO1(s, a);
 
// ------------------------- preparacao 
   initial begin:start
            a=8'b0000_0000; 
   end 
 
// ------------------------- parte principal 
   initial begin:main 
         $display("Exercicio0011 - Thais Mairink - 441710"); 
         $display("Test zero"); 
         $display("\np  =  s\n"); 
 	#1    $monitor("%b  =  %b", a, s); 
	#1		a=8'b0000_0001;
	#1		a=8'b0000_0010;
	#1		a=8'b0000_0011;
	#1		a=8'b0000_0100;
	#1		a=8'b0000_0101;
	#1		a=8'b0000_0110;
	#1		a=8'b0000_0111;
	#1		a=8'b0000_1000;
	#1		a=8'b0000_1001;
	#1		a=8'b0000_1010;
	#1		a=8'b0000_1011;
	#1		a=8'b0000_1100;
	#1		a=8'b0000_1101;
	#1		a=8'b0000_1110;
	#1		a=8'b1111_1111;
 
 end 
 
endmodule // testzero