
// ------------------------- 
// Exemplo0010 - or
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460
// ------------------------- 

// ------------------------- 
// -- or gate 
// ------------------------- 
	module orgate ( output s,input p, input q, input r); 
	not NOT1(s1,p);
	not NOT2(s2,q);
	not NOT3(s3,r);
	assign s = ~(~p & ~q & ~r); 
	endmodule // orgate 

// --------------------- 
// -- test or gate 
// --------------------- 
	module testorgate; 

// ------------------------- dados locais 
	reg a, b, c; // definir registradores 
	wire s; // definir conexao (fio) 

// ------------------------- instancia 
	orgate OR1 (s, a, b, c); 
// ------------------------- preparacao 
	initial begin:start 
	a=0; b=0; c=0; 
	
	end 

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo 0010 - Rodrigo Arruda de Assis - 427460"); 
		$display("Test OR gate"); 
		$display("\n a & b & c = s\n"); 

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

	endmodule // testorgate
		
	
//---------------

//	Exemplo 0010 - Rodrigo Arruda de Assis - 427460
//	Test OR gate
	
// a & b & c = s
// 0 & 0 & 0= 0
// 0 & 0 & 1= 1
// 0 & 1 & 0= 1
// 0 & 1 & 1= 1
// 1 & 0 & 0= 1
// 1 & 0 & 1= 1
// 1 & 1 & 0= 1
// 1 & 1 & 1= 1

//---------------