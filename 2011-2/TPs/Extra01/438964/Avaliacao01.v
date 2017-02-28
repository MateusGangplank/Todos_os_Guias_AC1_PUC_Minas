// ------------------------- 
// Avaliacao01 - MODULOS 
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.1 
// ------------------------- 
//letra j)
// ------------------------- 
// s2_gate 
// ------------------------- 

module s2 (output [3:0] saida0, 
			  input  [3:0] a,
           input  [3:0] b, 
           input  [3:0] c,
			  input  [3:0] d); 
			  
	wire [3:0] saida1; 
   wire [3:0] saida2;
   wire [3:0] saida3; 
   wire [3:0] nc; 
   wire [3:0] nd;
	 
// descrever por portas 

and  and1  [3:0](saida1,a,nc);
and  and2  [3:0](saida2,a,b,nd);
and  and3  [3:0](saida3,b,nc,nd);
or   or1   [3:0](saida0,saida1,saida2,saida3); 
not  not1  [3:0](nc,c);
not  not2  [3:0](nd,d);

endmodule // fim s2 

//letra k)
// ------------------------- 
// s1_gate 
// ------------------------- 
module s1 (output [3:0] saida0, 
			  input  [3:0] a,
           input  [3:0] b, 
           input  [3:0] c,
			  input  [3:0] d); 
assign saida0 = ((~a+~c)*d+(a+c)*((b*d)+(~b*~d)));			  

endmodule // fim s1 

//letra l)

module inicial01 (output [3:0] saida0, 
			  input  [3:0] a,
           input  [3:0] b, 
			  input  [3:0] d); 
			  
	wire [3:0] na,nb,w0,w1; 
	
// descrever por portas 

not  not1  [3:0](na,a);
not  not2  [3:0](nb,b);
and  and1  [3:0](w1,nb,d);
or   or1   [3:0](w0,na,nb); 
or   or1   [3:0](saida0,w1,na); 

endmodule // fim inicial01
 
 
module inicial02 (output [3:0] saida0, 
			  input  [3:0] a,
           input  [3:0] b, 
			  input  [3:0] d); 
			  
	wire [3:0] nb; 
	
// descrever por portas 

not  not1  [3:0](nb,b);
and  and1  [3:0](s,a,nb,d);

endmodule // fim inicial02

module s0(output [3:0] saida0, 
			  input  [3:0] a,
           input  [3:0] b, 
           input  [3:0] c, 
			  input  [3:0] d); 
			  
	wire [3:0] sinicial01,sinicial02; 
	
// descrever por portas 

and  and1  [3:0](w1,a,sinicial01,c);
or   or1   [3:0](saida0,w1,sinicial02);
 
endmodule // fim s0


// ------------------------- parte principal 

initial begin 
$display("Avalicao01 - Ederson Cristiano Nunes - 438964"); 
$display("Avaliacao01 module"); 
$display("s2, s1, s0"); 

a = 4'b0011;  b = 4'b0101;  c= 4'b0000; d = 4'b0101;

// projetar testes do modulo 
 $monitor("s2=%4b s1=%4b s0=%4b", s2,  s1,  s0);
 
end 

		 
