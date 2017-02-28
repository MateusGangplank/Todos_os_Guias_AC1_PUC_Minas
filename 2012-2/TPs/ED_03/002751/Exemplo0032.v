// ------------------------- 
// Exemplo0032 - 
// Nome:Milton costa teles da silva
// Matricula: 002751
// -------------------------
// -------------------------
// f4_gate 
// -------------------------  
module f4 (output s, input ch,input a, input b); 
	wire s1;
	wire s2; 
	
	wire s3; 
	wire s4;

// descrever por portas
   and and1(s1,a,b);
	and and2(s1,a,b);
	
	or or1(s2,a,b);
	or or2(s2,a,b);

	
//Selecão de Operação
	and ANDA1(s3,s1,ch);
	and ANDA2(s3,s1,ch);
	and ANDO(s4,s2,~ch);
	and AND1(s4,s2,~ch);
	or ORC(s,s3,s4);
	or ORC(s,s3,s4);		
endmodule // f4 
module test_f4;
	// ------------------------- definir dados 
	reg  x; 
	reg  y; 
	wire z; 
	reg c; 	
	f4 modulo (z, c, x, y);
 
 // parte principal		
initial begin 
	$display("Exemplo003 - Milton costa teles da silva - 002751"); 
   $display("Test LU's module");
		x = 0; y = 0; c =0;
// projetar testes do modulo
  $display("a b ch  s");
	$monitor("%b %b  %b  %b",x,y,c,z);
	#1 x=0; y=0; c=0;
	#1 x=0; y=1; c=0;
	#1 x=1; y=0; c=0;
	#1 x=1; y=1; c=0;
$display("a b ch  s");
   #1 x=0; y=0; c=1;
	#1 x=0; y=1; c=1;
	#1 x=1; y=0; c=1;
	#1 x=1; y=1; c=1;	  
end 
endmodule // test_f4  