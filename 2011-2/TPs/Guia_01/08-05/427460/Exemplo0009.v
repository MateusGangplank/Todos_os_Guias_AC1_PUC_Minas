
// ------------------------- 
// Exemplo0009 - and
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460
// ------------------------- 


// ------------------------- 
// -- and gate 
// ------------------------- 
	module andgate ( output s, input p, input q, input r); 
	not NOT1(s1,p);
	not NOT2(s2,q);
	not NOT3(s3,r);
	assign s = ~(~s1 |~s2 |~s3); 
	endmodule // andgate 

// --------------------- 
// -- test and gate 
// --------------------- 
	module testandgate; 
// ------------------------- dados locais 
		reg a, b, c; // definir registradores 
		wire s; // definir conexao (fio) 

// ------------------------- instancia 
	andgate AND1 (s, a, b, c); 

// ------------------------- preparacao 
		initial begin:start 
		a=0; b=0;c=0; 
		end 

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo 0009 - Rodrigo Arruda de Assis - 427460"); 
		$display("Test AND gate"); 
		$display("\n a & b & c= s\n"); 
		
		a=0; b=0; c=0; 
			#1 $display("%b & %b & %b= %b", a, b, c, s); 
		a=0; b=0;c=1; 
			#1 $display("%b & %b & %b= %b", a, b, c, s); 
		a=0; b=1;c=0; 
			#1 $display("%b & %b & %b= %b", a, b, c, s); 
		a=0; b=1;c=1; 
			#1 $display("%b & %b & %b= %b", a, b, c, s); 
		a=1; b=0;c=0; 
			#1 $display("%b & %b & %b= %b", a, b, c, s);  
		a=1; b=0;c=1; 
			#1 $display("%b & %b & %b= %b", a, b, c, s); 
		a=1; b=1;c=0; 
			#1 $display("%b & %b & %b= %b", a, b, c, s); 
		a=1; b=1;c=1; 
			#1 $display("%b & %b & %b= %b", a, b, c, s); 		
				
	end 

endmodule // testandgate

//------------

//	Exemplo 0009 - Rodrigo Arruda de Assis - 427460
//	Test AND gate

// a & b & c= s
// 0 & 0 & 0= 0
//	0 & 0 & 1= 0
//	0 & 1 & 0= 0
//	0 & 1 & 1= 0
//	1 & 0 & 0= 0
//	1 & 0 & 1= 0
//	1 & 1 & 0= 0
// 1 & 1 & 1= 1

//------------
